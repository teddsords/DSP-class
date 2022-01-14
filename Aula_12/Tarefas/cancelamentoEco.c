#include <stdio.h>

#define Coef 160

int main() {

    FILE *Data_Far, *Data_Near, *Data_Out;
    
    int i, amostras;
    double u = 0.000000000005;
    short Read_Far, Read_Near, e_escrito;
    short Data_OP[Coef];
    double Filter_Adaptive[Coef];
    double error_out, Fir_Out;

    if((Data_Far = fopen("far_apcm.pcm", "rb")) == NULL){

        printf("\nO arquivo far nao abriu");
        return 0;
    }

    if((Data_Near = fopen("near_apcm.pcm", "rb")) == NULL){

        printf("\nO arquivo near nao abriu");
        return 0;
    }

    if((Data_Out = fopen("SemEco.pcm", "wb")) == NULL){

        printf("\nO arquivo de saida nao abriu");
        return 0;
    }

    for(i = 0; i < Coef; i++){

        Data_OP[i] = 0;
        Filter_Adaptive[i] = 0.0;
    }

    do{
        Fir_Out = 0;

        amostras = fread(&Read_Far, sizeof(short), 1, Data_Far);
        Data_OP[0] = Read_Far;

        for (i = 0; i <Coef; i++) {
            Fir_Out += Data_OP[i] * Filter_Adaptive[i];
        }

        fread(&Read_Near, sizeof(short), 1, Data_Near);

        error_out = Read_Near - Fir_Out;
        e_escrito = (short) error_out;

        for (i = 0; i < Coef; i++) {
            Filter_Adaptive[i] = Filter_Adaptive[i]  +  u * error_out * Data_OP[i];
        }

        for (i = Coef - 1; i > 0; i--) {
            Data_OP[i] = Data_OP[i - 1];
        }
        
        fwrite(&e_escrito, sizeof(short), 1, Data_Out);
    }while(amostras);

    
    fclose(Data_Far);
    fclose(Data_Near);
    fclose(Data_Out);

    return 0;
}