/* ML5Reals.h ***************************************************-*-c++-*-
**                                                                      **
**                                  G A M M A                           **
**                                                                      **
**      MATLAB Real Part  (MAT Version 5)  	      Interface		**
**                                                                      **
**      Scott Smith                                                     **
**      Dr. Scott A. Smith                                              **
**      1800 E. Paul Dirac Drive                                        **
**      National High Magnetic Field Laboratory                         **
**      Tallahassee FL 32306 USA                                        **
**                                                                      **
**      $Header: $
**                                                                      **
*************************************************************************/

/*************************************************************************
**                                                                      **
**  Description                                                         **
**                                                                      **
** This MATLAB class provides functions for the input and output of a   **
** MATLAB array real part sub-element in MAT version 5 files. MATLAB is **
** a commercial product and can be purchaced from The MathWorks, Inc.   **
** This  module  deals with binary MAT files version 5 circa 1999.      **
**                                                                      **
*************************************************************************/

#ifndef  _GML5REALS_H_				// Is file already included?
#define  _GML5REALS_H_ 				// If no, then remember it

#  if defined(GAMPRAGMA)			// Using the GNU compiler?
#    pragma interface				// This is the interface 
#  endif

#include <GamGen.h>				// Know MSVCDLL (__declspec)
#include <GamIO/ML5SubE.h>			// Include base class
#include <GamIO/ML5Tag.h>			// Include MAT 5 tags
#include <GamIO/ML5DA.h>
#include <Matrix/matrix.h>			// Include GAMMA matrices
#include <Matrix/row_vector.h>			// Include GAMMA row vectors
#include <Matrix/col_vector.h>			// Include GAMMA column vectors
#include <string>				// Include libstdc++ strings

class MatLab5Re : MatLab5SE
  {
 
// ----------------------------------------------------------------------------
// --------------------------- PRIVATE FUNCTIONS ------------------------------
// ----------------------------------------------------------------------------

// ____________________________________________________________________________ 
// i             MATLAB MAT 5 Reals Array Sub-Element Error Handling
// ____________________________________________________________________________
 
/*              Input           MLRE5   : MAT version 5 sub-element
                                eidx    : Error index
                                pname   : string in message
                                noret   : Flag for return (0=linefeed)
           Output               none    : Error message output
                                          Execution stopped (if fatal)       */  
 
void MLRE5error(int eidx, int noret=1);
void MLRE5error(int eidx, const std::string& pname, int noret=1);
volatile void MLRE5fatality(int eidx);


public:

// ----------------------------------------------------------------------------
// ---------------------------- PUBLIC FUNCTIONS ------------------------------
// ----------------------------------------------------------------------------

 
// ____________________________________________________________________________
// A           MATLAB MAT 5 Reals Array Sub-Element Constructors
// ____________________________________________________________________________
 

MatLab5Re();
MatLab5Re(const matrix& mx);
virtual ~MatLab5Re();

// ____________________________________________________________________________
// B            MATLAB MAT 5 Reals Array Sub-Element Access Functions
// ____________________________________________________________________________

 
// ____________________________________________________________________________
// C        MATLAB MAT 5 Reals Array Sub-Element Binary Output Functions
// ____________________________________________________________________________

/* These are the functions which will output this sub-element in MATLAB ".mat"
   binary format, version 5.  This is done with a pair {tag,data}.  Both the
   tag & data will be written directly from these functions, bypassing the
   associated class structures which have no knowledge of GAMMA array types.
 
   Remember, the MATLAB MAT version 5 tag for this sub-element contains
   8-bytes with two important settings: 1.) data type & 2.) # of bytes.
   The data type is placed in the first 4 bytes and the number of bytes
   placed into the last 4 bytes (for non-compressed data elements which we
   will always output...).  In this case, we output the elements as doubles
   so that the data type should be MATLAB type miDOUBLE, i.e. value 9.
 
                Input           ML5Re   : MAT version 5 reals SE (this)
                                fp      : Output file stream
                                mx      : GAMMA matrix
                                rv      : GAMMA row vector
                                cv      : GAMMA column vector
                Output          void    : Output file stream is modified
                                          by having the ML5Re written to it
                Note                    : No care taken herein to insure the
                                          sub-element is properly written.   */
 
int write(std::fstream& fp, const matrix& mx)     const;                       
int write(std::fstream& fp, const row_vector& rv) const;
int write(std::fstream& fp, const col_vector& cv) const;

/* These are the functions which will return the number of bytes that are
   written upon output the sub-element in MATLAB ".mat" binary format, V.5   */
 
int Size(const matrix& mx) const;

   

// ____________________________________________________________________________
// D          MATLAB MAT 5 Reals Array Sub-Element Binary Input Functions
// ____________________________________________________________________________

/* These are the functions which will input an reals array sub-element in 
   MATLAB ".mat" binary format, version 5.  Note that in a valid MATLAB MAT
   file, an "Reals Array Sub-Element" is a combination of Tag + Data that has
   an 8 byte tag and no data.
 
                Input           ML5Re   : MAT version 5 reals array (this)
                                fp      : Input file stream
                               warn     : Warning output level
                                                0 = no warnings
                                                1 = warnings
                                               >1 = fatal warnings
                Output          void    : ML5Re is set from values found
                                          in the input stream
                Note                    : No care is taken to insure the
                                          reals array is read from the top of
					  a data element (as it should be
                                          in MATLAB)                         */

int    fread(std::fstream& fp,int bigend,                    int warn=1);
matrix read (std::fstream& fp,int bigend,const MatLab5DA& DA,int warn=1);

 
// ____________________________________________________________________________
// E      MATLAB MAT 5 Reals Array Sub-Element ASCII Output Functions
// ____________________________________________________________________________

                                                                                
void print(std::ostream& ostr) const;
 
        // Input                ML5Re	: MAT version 5 reals array (this)
        //                      ostr    : An output stream
        // Output               ostr    : Output stream with MATLAB MAT file
        //                                reals array version 5 info placed
	//				  into it
        // Note                         : This information exists at the
        //                                beginning of each reals array
 
friend std::ostream& operator<< (std::ostream& ostr, const MatLab5Re& ML5Re);
 
        // Input                ostr    : An output stream
        //                      ML5Re	: MAT version 5 reals array
        // Output               ostr    : The output stream modified by
        //                                the reals array parameters
  };


#endif							 // _GML5REALS_H_
