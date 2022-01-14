/* Implementa��o de um filtro M�dia M�vel 
L� um arquivo bin�rio com amostras em 16bits
Salva arquivo filtrado tamb�m em 16 bits
Walter vers�o 1.0 
 */
#include <stdio.h>
#include <string.h>


#define NSAMPLES       161	// Tamanho da m�dia



extern short mediaMovel(short *, short *, int);



int main()
{
   FILE *in_file, *out_file;
   int i;
  
   short entrada, saida;
   short sample[NSAMPLES] = {0x0};

   //Carregando os coeficientes do filtro m�dia m�vel
   
   short coef[NSAMPLES]={
   				#include "CoeficientesFiltroPassaBaixa1000DSPEnvironment.csv"
   };
  
 
	// "Sweep10_3600.pcm"
    // "SenoFrequencia800.pcm"
    /* abre os arquivos de entrada e saida */
  	if ((in_file = fopen("..\\SenoFrequencia1000.pcm","rb"))==NULL)
  	{
    	printf("\nErro: Nao abriu o arquivo de entrada\n");
    	return 0;
  	}
  	
  	//"SweepAposFPB800.pcm"
  	//"SenoFrequencia800_FPB800.pcm"
  	if ((out_file = fopen("..\\SenoFrequencia1000_FPB1000.pcm","wb"))==NULL)
  	{
    	printf("\nErro: Nao abriu o arquivo de saida\n");
    	return 0;
  	}
	
  	printf("Por favor aguarde enquanto executamos o filtro....\n");

   	// execu��o do filtro
 	while(fread(&entrada, sizeof(short), 1, in_file) == 1)
	{
        
		sample[0] = entrada;
		saida = mediaMovel(sample, coef, NSAMPLES);
	
        //escreve no arquivo de sa�da
        fwrite(&saida,sizeof(short),1,out_file);
 	} 

	printf("Terminamos de executar o codigo!!\n");


   //fecha os arquivos de entrada de sa�da
   fclose(out_file);
   fclose(in_file);
   return 0;
}