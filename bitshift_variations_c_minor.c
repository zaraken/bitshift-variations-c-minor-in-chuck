// C program from shell script but formated a bit
int g(i,x,t,o){
    return((3&x&(i*((3&i>>16?"BY}6YB6%":"Qj}6jQ6%")[t%8]+51)>>o))<<4);
};

void main(i,n,s){
    for(i=0; i <= 136703;i++){
        putchar(g(i,1,n=i>>14,12)
                +g(i,s=i>>17,n^i>>13,10)
                +g(i,s/3,n+((i>>11)%3),10)
                +g(i,s/5,8+n-((i>>10)%3),9));
    }
}
