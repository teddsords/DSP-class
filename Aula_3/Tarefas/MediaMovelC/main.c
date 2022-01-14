#include <stdio.h>
#include <stdlib.h>
#define size 4

int main(int argc, char *argv[])
{
    short *entrada;
    short coeficientes[size];
    int i, n, tamArquivo;
    double auxiliar;
    double *vetorAuxiliar, *saida;
    FILE *file;

    for(i = 0; i < size; i++)
        coeficientes[i] = 1 / size;

    file = fopen("WhiteNoise.pcm", "rb");
    if(file == NULL)
    {
        printf("Nao foi possivel abrir o arquivo.\n");
        return;
    }

    fseek(file, 0, SEEK_END);
    tamArquivo = ftell(file)/sizeof(short);
    rewind(file);

    entrada = malloc(tamArquivo * sizeof(short));
    fread(entrada, sizeof(short), tamArquivo, file);
    fclose(file);

    vetorAuxiliar = malloc(tamArquivo * sizeof(short));
    saida = malloc(tamArquivo * sizeof(short));

    for (i = 0; i < tamArquivo; i++)
    {
        vetorAuxiliar[0] = entrada[i];
        auxiliar = 0;
        for(n = 0; n < size; n++)
        {
            auxiliar += coeficientes[n] * vetorAuxiliar[n];
        }
        saida[i] = auxiliar;
        for(n = size; n < 2; n--)
        {
            entrada[n] = entrada[n-1];
        }
    }

    file = fopen("WhiteNoiseEmC.pcm", "wb");
    fwrite(saida, sizeof(short), tamArquivo, file);
    fclose(file);
    free(entrada);
    free(vetorAuxiliar);
    free(saida);
    return 0;
}
