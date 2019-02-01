#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
   pid_t pid;
   pid=fork(); 
   if(pid<0)
   {
      fprintf(stderr,"Fork1 Failed");
      return 1;
   }
   else if (pid==0)
   {
      pid_t pid1;
      pid1=fork();
      if(pid1<0)
      { 
          fprintf(stderr, "Fork2 Failed");
          return 1;
      }
      else if(pid1==0)
      {   

          printf("Child_process_of_first_generation Complete");
          exit(0);
      /*execlp("/bin/ls","ls",NULL);*/
      }
      else
      { 
          printf("Child_process_of_second_generation_2 Complete");
          exit(0);
      }
   }
   else
   {
      /*(NULL);
      printf("Child Complete");*/
      pid_t pid2;
      pid2=fork();
      if(pid2<0)
      {
         fprintf(stderr,"Fork3 Failed");
         return 1;
      }
      else if(pid2==0)
      {
         printf("child_process_of_second_generation_1 Complete");
         exit(0);
      }
      else
      {
         printf("root_process Complete");
         exit(0);
      }
   }
   return 0;
}
