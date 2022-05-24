#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>

#define ㅤ j = 0;

char *code = "#include <fcntl.h>%1$c#include <stdlib.h>%1$c#include <stdio.h>%1$c#include <unistd.h>%1$c#include <sys/stat.h>%1$c%1$c#define ㅤ j = 0;%1$c%1$cchar *code = %3$c%5$s%3$c;%1$c%1$cint		main(void)%1$c{%1$c	char filename[256];%1$c	char command[256];%1$c	int j = 1;%1$c	int i = %4$d;%1$c%1$c	if (i <= 0)%1$c		return (0);%1$c	else if (j)%1$c		i--;%1$c	sprintf(filename, %3$cSully_%2$cd.c%3$c, i);%1$c	chmod(filename, 0644);%1$c	int fd = open(filename, O_CREAT | O_TRUNC | O_WRONLY, 0644);%1$c	if (fd < 0)%1$c		return (1);%1$c	dprintf(fd, code, 10, 37, 34, i, code);%1$c	close(fd);%1$c	sprintf(command, %3$cgcc -Wall -Wextra -Werror Sully_%2$c1$d.c -o Sully_%2$c1$d; ./Sully_%2$c1$d%3$c, i);%1$c	system(command);%1$c	return (0);%1$c}%1$c";

int		main(void)
{
	char filename[256];
	char command[256];
	int j = 1;
	int i = 5;ㅤ

	if (i <= 0)
		return (0);
	else if (j)
		i--;
	sprintf(filename, "Sully_%d.c", i);
	chmod(filename, 0644);
	int fd = open(filename, O_CREAT | O_TRUNC | O_WRONLY, 0644);
	if (fd < 0)
		return (1);
	dprintf(fd, code, 10, 37, 34, i, code);
	close(fd);
	sprintf(command, "gcc -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d; ./Sully_%1$d", i);
	system(command);
	return (0);
}
