#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>

#define FILENAME "Sully_%d.c"

int		main(void)
{
	char *code = "#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <unistd.h>%1$c#include <sys/stat.h>%1$c%1$c#define FILENAME %3$cSully_%2$cd.c%3$c%1$c%1$cint		main(void)%1$c{%1$c	char *code = %3$c%5$s%3$c;%1$c	int i = %4$d;%1$c%1$c	if (i <= 0)%1$c		return (0);%1$c	for (; i >= 0; i--)%1$c	{%1$c		char filename[256];%1$c		sprintf(filename, FILENAME, i);%1$c		chmod(filename, 0644);%1$c		int fd = open(filename, O_CREAT | O_TRUNC | O_WRONLY, 0644);%1$c		if (fd < 0)%1$c			continue ;%1$c		dprintf(fd, code, 10, 37, 34, i, code);%1$c		close(fd);%1$c	}%1$c	return (0);%1$c}%1$c";
	int i = 5;

	if (i <= 0)
		return (0);
	for (; i >= 0; i--)
	{
		char filename[256];
		sprintf(filename, FILENAME, i);
		chmod(filename, 0644);
		int fd = open(filename, O_CREAT | O_TRUNC | O_WRONLY, 0644);
		if (fd < 0)
			continue ;
		dprintf(fd, code, 10, 37, 34, i, code);
		close(fd);
	}
	return (0);
}
