#include<stdio.h>

double multiply_id ( int a, double b )
{
	printf("%s\n", __func__);
	return a * b;
}

double multiply_di ( double a, int b )
{
	printf("%s\n", __func__);
	return a * b;
}

double multiply_dd ( double a, double b )
{
	printf("%s\n", __func__);
	return a * b;
}

int multiply_ii ( int a, int b )
{
	printf("%s\n", __func__);
	return a * b;
}


/*
 * #define multiply(a,b) _Generic((a), \
 * int: _Generic((b), \
 *     int: multiply_ii, \
 *         double: multiply_id), \
 *         double: _Generic((b), \
 *             int: multiply_di, \
 *                 double: multiply_dd) ) (a,b)
 *                 */

#define _G2(ParamB,ParamA_Type, TypeB1, TypeB1_Func, TypeB2, TypeB2_Func) \
ParamA_Type: _Generic((ParamB), \
			     TypeB1: TypeB1_Func, \
			     TypeB2: TypeB2_Func)

#define multiply(a,b) _Generic((a), \
		_G2(b,int,int,multiply_ii,double,multiply_id), \
		_G2(b,double,int,multiply_di,double,multiply_dd) ) (a,b)

#define typecheck(T) _Generic( (T), char: "char", int: "int", long: "long", float: "float", default: "unknown T")

int main(int argc, const char * argv[]) {
	printf( "passing a long value to the macro, result is %s \n", typecheck(2353463456356465));
	printf( "passing a float value to the macro, result is %s \n", typecheck(4.32f));
	printf( "passing a int value to the macro, result is %s \n", typecheck(324));
	printf( "passing a string value to the macro, result is %s \n", typecheck("Hello"));
	{
		int i;
		double d;

		i = 5;
		d = 5.5;

		d = multiply( multiply(d, multiply(d,i) ) ,multiply(i,i) );

		printf("%f\n", d);  
	}
	return 0;
}
