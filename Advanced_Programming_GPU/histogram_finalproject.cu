/* TO DO: Please put your name and date of modification
 *
 * Author:      Brady Chen  5/1/2015
 * Modified By:
 *              <your name> <date>    
 *
 * This is a C code for the computation of a histogram of data from an input text file. The
 * text file contains multiple lines of characters. The code generate the frequency histogram 
 * of characters from the input file.   
 */
                                                                                                    
#include <stdio.h>
#include <string.h>
#include <stdarg.h>

/* TO DO: (possible)
 *
 * Definition of important values:
 *   MAX_TEXT_LINES  -- maximum number of lines for the input file. We initially set to 1000
 *                     If your file contains more than 1000, just change the value
 *   MAX_LINE_LENGTH -- the length of each line. You change the value
 *   NUMBER_OF_CHARS -- this the total number of characters used in the input file. We set 
 *                     the number to 128 which could include all the standard characters in
 *                     the ASCII code table. If your input file contains more than 128 standard
 *                     characters, please increase the number. For example, you should use 256
 *                     for extended ASCII code.
 *   TOTAL_SIZE      -- this is the total number of characters in the input file.
 * 
 * NOTE: You can change the values of the varibales if necessary but please don't change the variable
 *       names themselves  
 */ 
#define MAX_TEXT_LINES 4400  
#define MAX_LINE_LENGTH 75   
#define NUMBER_OF_CHARS 128   
#define TOTAL_SIZE (MAX_TEXT_LINES + 10)*(MAX_LINE_LENGTH + 10)

/*
 * Declaraion of the arrays of characters 
 *   aTextData    -- this is a two dimensional array of char. It contains all the characters 
 *                   inputted from the input file. The first index record the lines and the
 *                   second index record the columns in each line. We add 10 on MAX_TEXT_LINES 
 *                   and MAX_LINE_LENGTH as safety spaces to crash on off-by-one errors. 
 *
 *   NOTE: No need to change this part
 */
char aTextData[MAX_TEXT_LINES + 10][MAX_LINE_LENGTH + 10];
char aFlattenedData[(MAX_TEXT_LINES + 10)*(MAX_LINE_LENGTH + 10)];


/* TO DO:
 *
 * Declaration of function
 *   histogram() -- This function takes a two arguments
 *                  aText -- a two dimensional array of char.
 *                  histo -- a one dimensional array which returns the frequency histogram
 *                           of the characrers in the array aText
 * NOTE: you need to modify the declararion accordingly based on the changes in the gpu_histogram()
 */
int histogram(char aText[MAX_TEXT_LINES + 10][MAX_LINE_LENGTH + 10], unsigned int histo[NUMBER_OF_CHARS]);

int main(void) 
{
	/*
	 *  Declaration of variables 
	 *    histo      -- contains the frequency histogram of the characters
	 *    lineBuffer -- line buffer for reading
	 *    iTextSize  -- how large is the array
	 *    iTextUsed  -- how many lines contained
	 */
	unsigned int histo[NUMBER_OF_CHARS];
	char lineBuffer[MAX_LINE_LENGTH + 10];
	int  iTextSize = MAX_TEXT_LINES;  
	int  iTextUsed = 0;               

	// clean the memory with zeros
	memset(aTextData, 0, sizeof(aTextData));
	memset(lineBuffer, 0, sizeof(lineBuffer));

	/*  TO DO: (possible)
	 *  Data read and conversion: The following lines of code do the following
	 *    1. Find the input file (in this case "input.txt)
	 *    2. Read the data from the input file and store it in a two dimensional
	 *       array of char
	 * 
	 *  NOTE: Please DO NOT change the following lines of code except for the first
	 *        line, where you are allowed to change the path for the input file
	 *        "input.txt"
	 */
	char *inputFile = "../input_test.txt"; // you may need to change the path depending on
	                                  // where you put the input file
	// read input file into the array. use binary mode "rb"
	FILE *fin = fopen(inputFile, "rb");
	if (!fin) {
		printf("cannot read %s\n", inputFile);
		return 1;
	}
	// while not end of file, read another line
	while (fgets(lineBuffer, sizeof(lineBuffer)-10, fin) != 0)
	{
		// check if array has space for another line
		if (iTextUsed >= iTextSize)
		{
			printf("overflow: too many text lines\n"); 
			return 1;
		}
		// strip CR/LF from line endings so we get pure text
		char *psz = strchr(lineBuffer, '\r'); if (psz) *psz = '\0';
		psz = strchr(lineBuffer, '\n'); if (psz) *psz = '\0';
		// store the line
		strncpy(aTextData[iTextUsed], lineBuffer, MAX_LINE_LENGTH);
		aTextData[iTextUsed][MAX_LINE_LENGTH - 1] = '\0'; // safety
		iTextUsed++;
	}
	fclose(fin);
	/* end of the Data read and conversion */

	/* TO DO:
	 * Function call to compute the frequency histogram of the data
	 *   NOTE: you NEED TO MODIFY this portion.
	 *         1. declare the blocks and threads
	 *         2. call the newly implemented kernel function gpu_histogram() .
	 *         Please note that the kernel function DOES NOT take array as argument,
	 *         not to mention two dimensional array in this case.
	 */
	if (histogram(aTextData, histo) !=0) 
		return 1;
	
	/* TO DO:
	 *
	 * Output of histogram results
	 * the following is the output of the histogram frequency of characters in
	 * the order of ASCII code. the array histo[] contains the frequency histogram
	 * of 128 characters defined in ASCII.
	 *   1. The decimal values for the letters are
	 *      A to Z -- 65 to 90
	 *      a to z -- 97 to 122
	 *   2. the following lines of code print the histogram results for a to z.
	 *   
	 * NOTE: You are required to add code for computing the frequency histogram for
	 *       letters A to Z (including both low case and up case). To do this, you 
	 *       could add the frequency histograms for capital letters and low case letters.
	 *       For example, to calcuate the frequency histogram of letter A, you should
	 *       add the frequency histogram of capital A and low case a.  
	 */
	unsigned int histocount = 0; // total character count
	printf("histogram frequency of characters a to z: \n");
	for (int i = 97; i < 97+26 ; i++) {
		histocount += histo[i];
		printf("%d ", histo[i]);
	}
	printf("\n");
	printf("histogram frequency of characters in terms of percentiles: \n");
	for (int i = 97; i < 97 + 26; i++) {
		printf("%.4f ", (float)histo[i]/(float)histocount);
	}

	/* TO DO: Please add your code here for computing the frequency histogram for all letters
	 *        regardless low or up cases.
	 *
	 */

	return 0;
}

/* TO DO:
 *
 * Implementation of function
 *   histogram() -- This function takes a two arguments
 *                  aText -- a two dimensional array of char.
 *                  histo -- a one dimensional array which returns the frequency histogram
 *                           of the characrers in the array aText
 * NOTE: you need to change the function to kenel function. Here are the changes you need to make
 *        1. change the name of the function to gpu_histogram()
 *        2. change the arguments to piniters 
 *           gpu_histogram(char * aText, unsigned int * histo)
 *        3. re-implement the function
 */
int histogram(char aText[MAX_TEXT_LINES + 10][MAX_LINE_LENGTH + 10], unsigned int histo[NUMBER_OF_CHARS])
{
	int i, j;
	for (i = 0; i < NUMBER_OF_CHARS; i++)
		histo[i] = 0;
	for (i = 0; i < MAX_TEXT_LINES+10; i++) {
		for (j = 0; j < MAX_LINE_LENGTH + 10; j++) {
			histo[(int)(aText[i][j])]++;
		}
	}
	return 0;
}
