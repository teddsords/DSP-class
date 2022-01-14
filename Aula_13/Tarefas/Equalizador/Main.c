/* Implementação de um filtro Média Móvel 
Lê um arquivo binário com amostras em 16bits
Salva arquivo filtrado também em 16 bits
Walter versão 1.0 
 */
#include <stdio.h>
#include<string.h>


#define NSAMPLES       161	// Tamanho da média
#define NORMALIZADOR   32768

extern short mediaMovel(short *, short *, int);


int main()
{
	FILE *in_file, *out_file;
   	int i;
  
   	short entrada, saida;
   	short sample[NSAMPLES] = {0x0};

   	short yPF=0, yPA = 0, yPB = 0, ySaida = 0, 
	fatorPassaBaixa = 0,		// Escrever o multiplo de 32768
	fatorPassaFaixa = 1,		// Para os tres fatores!!!!!
	fatorPassaAlta = 0; 
	

   	//printf("Qual o Ganho para o Passa Baixa?\n");
   	//scanf("%f", &fatorPassaBaixa);

   	//printf("Qual o Ganho para o Passa Alta?\n");
   	//scanf("%f", &fatorPassaAlta);

   
   	//printf("Qual o Ganho para o Passa Faixa?\n");
   	//scanf("%f", &fatorPassaFaixa);

   	//Carregando os coeficientes do filtro média móvel
   
   	short coef[NSAMPLES]={
   				#include "CoeficientesFiltroPassaBanda1000_2000_DSPEnvironment.csv"
   	};

   	short coef2[NSAMPLES] ={
                #include "CoeficientesFiltroPassaAlta2000DSPEnvironment.csv"
   	};

	short coef3[NSAMPLES]={
                #include "CoeficientesFiltroPassaBaixa1000DSPEnvironment.csv"
   	};
  
 
    /* abre os arquivos de entrada e saida */
  	if ((in_file = fopen("..\\Sweep10_3600.pcm","rb"))==NULL)
  	{
    	printf("\nErro: Nao abriu o arquivo de entrada\n");
    	return 0;
  	}
  	
  	if ((out_file = fopen("..\\Sweep10_3600_AposEqualizadorPBPAPF.pcm","wb"))==NULL)
  	{
    	printf("\nErro: Nao abriu o arquivo de saida\n");
    	return 0;
  	}


   // execução do filtro
	while(fread(&entrada, sizeof(short), 1, in_file) == 1) 
	{
		sample[0] = entrada;

        //Conv do filtro passa faixa
    	yPF = mediaMovel(sample, coef, NSAMPLES);
            
       	//Conv do filtro passa alta
        yPA = mediaMovel(sample, coef2, NSAMPLES);
            
       	//Conv do filtro passa baixa
        yPB = mediaMovel(sample, coef3, NSAMPLES);
            

       	ySaida = (yPB * fatorPassaBaixa) + (yPA * fatorPassaAlta) + (yPF * fatorPassaFaixa);

        //escreve no arquivo de saída
        fwrite(&ySaida,sizeof(short),1,out_file);

 	}


   	//fecha os arquivos de entrada de saída
   	fclose(out_file);
   	fclose(in_file);
   	return 0;
}