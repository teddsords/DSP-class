#include <stdio.h>

int main(){

    FILE *Data_in, *Data_out;

    if((Data_in = fopen("WhiteNoise.pcm", "rb")) == NULL){

        printf("O arquivo de entrada nao abriu\n");
        return 0;
    }

    if((Data_out = fopen("SaidaIdentificacao.pcm", "wb")) == NULL){

        printf("O arquivo de saida nao abriu\n");
        return 0;
    }

    double u = 0.000000000005;
    // Cumprimento dos filtros
    int N = 4, i, j;
    int Nmax = N;

    // Pegando a largura do FILE de entrada
    fseek(Data_in, 0L, SEEK_END);
    int len = ftell(Data_in);
    printf("Tamanho da variavel len apos ftell: %d\n", len);
    rewind(Data_in);

    // Criando os vetores  para ser utilziados
    double wn[N], yn[Nmax];            // si no funciona cambiar a float
    short x_linhan[Nmax];
    for(i = 0; i < Nmax; i++)
    {
        wn[i] = 0.0;
        yn[i] = 0.0;
        x_linhan[i] = 0.0;
    }

    // Definindo a planta
    double Wo[] = {0.5, 0.3, -0.5, 0.8};
    int NWo = 4, amostras;

    // Criando mais vetores
    short  Read, e_escrito, e_salva[len], y_salva[len], w_salva[len][N], x_new = 0;
    double ee = 0, y, d_new;
    for(i = 0; i < len; i++)
    {
        e_salva[i] = 0;
        y_salva[i] = 0;

        for(j = 0; j < N; j++)
        {
            w_salva[i][j] = 0;
        }
    }

    for(i = 0; i < len; i++)
    {
        // Lendo a amostra de entrada
        amostras = fread(&Read, sizeof(short), 1, Data_in);
        x_new = Read;

        // Filtrando o sinal de entrada x
        x_linhan[0] = x_new;

        y = 0;
        ////////////////////////////////////////////////////////////////////////////////////////////////
        for(j = 0; j < N; j++)
        {
            y = y + x_linhan[j] * wn[j];
        }

        y_salva[i] = y;

        d_new = 0;

        for(j = 0; j < NWo; j++)
        {
            d_new = d_new + x_linhan[j] * Wo[j];
        }
        /////////////////////////////////////////////////////////////////////////////////////////////////

        // Calculo do erro e(n) = d(n) - y(n)
        ee = d_new - y;

        // Atualizando os coeficientes do filtro usando LMS
        for(j = 0; j < N; j++)
        {
            wn[j] = wn[j] + u*ee*x_linhan[j];
        }

        for(j = 0; j < N; j++)
        {
            w_salva[i][j] = wn[j];
        }

        // Atualizando o vetor x_linhan
        for(j = N; j >= 1; j--)
        {
            x_linhan[j] = x_linhan[j-1];
        }



        // Escrevendo o erro no arquivo de saida
        e_escrito = (short) ee;
        fwrite(&e_escrito, sizeof(short), 1, Data_out);
        //printf("valor do ee: %f\t Valor do d_new: %f\t Valor do y: %f\n", ee, d_new, y);
        e_salva[i] = (short) ee;


    }

    for(i = 0; i < N; i++)
    {
        printf("Valores do Wn: %f\n", wn[i]);
    }

    fclose(Data_in);
    fclose(Data_out);

    return 0;
}
