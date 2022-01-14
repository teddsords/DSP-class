/* Implementação de um filtro Média Móvel 
Lê um arquivo binário com amostras em 16bits
Salva arquivo filtrado também em 16 bits
Walter versão 1.0 
 */
#include <stdio.h>
#include <string.h>


#define NSAMPLES       161	// Tamanho da média

extern short mediaMovel(short *, short *, int);

int main()
{
	FILE *in_file, *out_file;
   	int i;
  
   	short entrada, saida;
   	short sample[NSAMPLES] = {0x0};

   	//Carregando os coeficientes do filtro média móvel
   
   	short coef[NSAMPLES]={
   				#include "CoeficientesFiltroPassaBanda1000_2000_DSPEnvironment.csv"
   };
  
 
  	// "Sweep10_3600.pcm"
  	// "SenoFrequencia400.pcm"
  	// "SenoFrequencia600.pcm"
  	// "SenoFrequencia800.pcm"
  	// "SenoFrequencia2000.pcm"
    /* abre os arquivos de entrada e saida */
  	if ((in_file = fopen("..\\Sweep10_3600.pcm","rb"))==NULL)
  	{
    	printf("\nErro: Nao abriu o arquivo de entrada\n");
    	return 0;
  	}
  	
  	// "SweepAposFPF400_800.pcm"
  	// "SenoFrequencia400_FPF400.pcm"
  	// "SenoFrequencia600_FPF600.pcm"
  	// "SenoFrequencia800_FPF800.pcm"
  	if ((out_file = fopen("..\\SweepAposFPF1000_2000.pcm","wb"))==NULL)
  	{
    	printf("\nErro: Nao abriu o arquivo de saida\n");
    	return 0;
  	}

	printf("Por favor aguarde enquanto executamos o filtro...\n");

   	// execução do filtro
	while(fread(&entrada, sizeof(short), 1, in_file) == 1) 
	{
        
		sample[0] = entrada;

		saida = mediaMovel(sample, coef, NSAMPLES);

        //escreve no arquivo de saída
        fwrite(&saida,sizeof(short),1,out_file);

 	}

	printf("Terminamos de executar o codigo!\n");

   	//fecha os arquivos de entrada de saída
   	fclose(out_file);
   	fclose(in_file);
   	return 0;
}