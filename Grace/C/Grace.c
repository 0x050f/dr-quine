#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>

#define ㅤ	f(n, a, m, e, _, a)
#define		f(f, l, o, w, e, r) o##l##i##f
#define		FILENAME "Grace_kid.c"

// Wait...What ? 
int		ㅤ(void)
{
	char *code = "#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <unistd.h>%1$c#include <sys/stat.h>%1$c%1$c#define ㅤ	f(n, a, m, e, _, a)%1$c#define		f(f, l, o, w, e, r) o##l##i##f%1$c#define		FILENAME %2$cGrace_kid.c%2$c%1$c%1$c// Wait...What ? %1$cint		ㅤ(void)%1$c{%1$c	char *code = %2$c%3$s%2$c;%1$c	chmod(FILENAME, 0644);%1$c	int fd = open(FILENAME, O_CREAT | O_TRUNC | O_WRONLY, 0644);%1$c	if (fd < 0)%1$c		return (1);%1$c	dprintf(fd, code, 10, 34, code);%1$c	close(fd);%1$c	return (0);%1$c}%1$c";
	chmod(FILENAME, 0644);
	int fd = open(FILENAME, O_CREAT | O_TRUNC | O_WRONLY, 0644);
	if (fd < 0)
		return (1);
	dprintf(fd, code, 10, 34, code);
	close(fd);
	return (0);
}
