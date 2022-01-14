/* Implementação de um filtro Média Móvel 
Lê um arquivo binário com amostras em 16bits
Salva arquivo filtrado também em 16 bits
Walter versão 1.0 
 */
#include <stdio.h>
#include <fcntl.h>
#include <io.h>


#define NSAMPLES       161	// Tamanho da média

extern short mediaMovel(short *, short *, int);


int main()
{
   FILE *in_file, *out_file;
   int i;
  
   short entrada, saida;
   short sample[NSAMPLES] = {0x0};

   float yPF=0, yPA = 0, yPB = 0, ySaida = 0, 
	fatorPassaBaixa = 1,
	fatorPassaFaixa = 0,
	fatorPassaAlta = 0; 
	

   //printf("Qual o Ganho para o Passa Baixa?\n");
   //scanf("%f", &fatorPassaBaixa);

   //printf("Qual o Ganho para o Passa Alta?\n");
   //scanf("%f", &fatorPassaAlta);

   
   //printf("Qual o Ganho para o Passa Faixa?\n");
   //scanf("%f", &fatorPassaFaixa);

   //Carregando os coeficientes do filtro média móvel
   
   float coef[NSAMPLES]={
   				#include "CoeficientesFiltroPassaBanda1000_2000.csv"
   };

   float coef2[NSAMPLES] ={
                #include "CoeficientesFiltroPassaAlta2000.csv"
   };

   float coef3[NSAMPLES]={
                #include "CoeficientesFiltroPassaBaixa1000.csv"
   };
  
 
    /* abre os arquivos de entrada e saida */
  if ((in_file = fopen("Sweep10_3600.pcm","rb"))==NULL)
  {
    printf("\nErro: Nao abriu o arquivo de entrada\n");
    return 0;
  }
  if ((out_file = fopen("Sweep10_3600_AposEqualizadorPBPAPF.pcm","wb"))==NULL)
  {
    printf("\nErro: Nao abriu o arquivo de saida\n");
    return 0;
  }


   // execução do filtro
while(fread(&entrada, sizeof(short), 1, in_file) == 1) 
{
        
		sample[0] = entrada;

            //Conv do filtro passa faixa
            for (n=0; n<NSAMPLES; n++)
            {
                yPF += coef[n]*sample[n];
            }
            
            //Conv do filtro passa alta
            for (n=0; n<NSAMPLES; n++)
            {
                yPA += coef2[n]*sample[n];
            }
        
            //Conv do filtro passa baixa
            for (n=0; n<NSAMPLES; n++)
            {
                yPB += coef3[n]*sample[n];
            }

        //desloca amostra
        for (n=NSAMPLES-1; n>0; n--)
                {
                sample[n]=sample[n-1];
                }

                ySaida = (yPB * fatorPassaBaixa) + (yPA * fatorPassaAlta) + (yPF * fatorPassaFaixa);
				saida = (short) ySaida;

        //escreve no arquivo de saída
        fwrite(&saida,sizeof(short),1,out_file);

 } while (n_amost);


   //fecha os arquivos de entrada de saída
   fclose(out_file);
   fclose(in_file);
   return 0;
}