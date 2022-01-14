short mediaMovel(short *sample, short *coef, int NSAMPLES)
{	 
	int n, y;
	short saida;
  	
	//zera saida do filtro
	y=0;
    
    //Convolusao e acumulação
    for (n=0; n<NSAMPLES; n++)
    {
    	y += coef[n]* sample[n];
    }

	//desloca amostra
   	for (n=NSAMPLES-1; n>0; n--)
	{
		sample[n] = sample[n-1];
    }

				
	saida = y>>15;
	return saida;
}