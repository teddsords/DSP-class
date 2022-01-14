/* Implementação de um filtro Média Móvel 
Lê um arquivo binário com amostras em 16bits
Salva arquivo filtrado também em 16 bits
Walter versão 1.0 
 */
#include <stdio.h>
#include <fcntl.h>
#include <io.h>


#define NSAMPLES       161	// Tamanho da média

int main()
{
   FILE *in_file, *out_file;
   int i, n, n_amost;
  
   short entrada, saida;
   short sample[NSAMPLES] = {0x0};

   float y=0;

   //Carregando os coeficientes do filtro média móvel
   
   float coef[NSAMPLES]={
   				#include "CoeficientesFiltroPassaFaixa400_800.csv"
   };
  
 
  // "Sweep10_3600.pcm"
  // "SenoFrequencia400.pcm"
  // "SenoFrequencia600.pcm"
  // "SenoFrequencia800.pcm"
  // "SenoFrequencia2000.pcm"
    /* abre os arquivos de entrada e saida */
  if ((in_file = fopen("Sweep10_3600.pcm","rb"))==NULL)
  {
    printf("\nErro: Nao abriu o arquivo de entrada\n");
    return 0;
  }
  // "SweepAposFPF400_800.pcm"
  // "SenoFrequencia400_FPF400.pcm"
  // "SenoFrequencia600_FPF600.pcm"
  // "SenoFrequencia800_FPF800.pcm"
  if ((out_file = fopen("SenoFrequencia800_FPF800_2.pcm","wb"))==NULL)
  {
    printf("\nErro: Nao abriu o arquivo de saida\n");
    return 0;
  }

   // zera vetor de amostras
   for (i=0; i<NSAMPLES; i++)
        {
        sample[i]=0;
        }

   // execução do filtro
 do {
        
	   //zera saída do filtro
        y=0;

        //lê dado do arquivo
        n_amost = fread(&entrada,sizeof(short),1,in_file);
				sample[0] = entrada;

        //Convolução e acumulação
        for (n=0; n<NSAMPLES; n++)
                {
                y += coef[n]*sample[n];
                }

        //desloca amostra
        for (n=NSAMPLES-1; n>0; n--)
                {
                sample[n]=sample[n-1];
                }

				saida = (short) y;

        //escreve no arquivo de saída
        fwrite(&saida,sizeof(short),1,out_file);

 } while (n_amost);


   //fecha os arquivos de entrada de saída
   fclose(out_file);
   fclose(in_file);
   return 0;
}