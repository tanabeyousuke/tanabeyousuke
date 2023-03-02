#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>

int upload(char ip[15], int port, char naiyou[980]){
  //接続用意
  struct sockaddr_in server;
  int sock = socket(AF_INET, SOCK_STREAM, 0);
  server.sin_family = AF_INET;
  server.sin_port = htons(port);
  server.sin_addr.s_addr = inet_addr(ip);
  //接続
  connect(sock, (struct sockaddr *)&server, sizeof(server));
  //送信
  send(sock, naiyou, strlen(naiyou) + 1, 0);
  //受信
  char subject[20000];
  recv(sock, subject, 20000, 0);
  //ソケットを閉じる
  close(sock);
  
  return subject;
}

int main(void){

  char buf[32];
  int n;
  char ip[15];
  int port;
  char naiyou[980];

  
  while(1){
    scanf("%s", &naiyou);
    printf(upload(ip, port, naiyou));
  }
  return 0;
}

