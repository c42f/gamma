/* FloqAcq.h ****************************************************-*-c++-*-
**                                                                      **
**      Acquisitons in Floquet Space            Interface		**
**                                                                      **
**      Copyright (c) 1992                                              **
**      Tilo Levante                                                    **
**      Eidgenoessische Technische Hochschule                           **
**      Labor fuer physikalische Chemie                                 **
**      8092 Zurich / Switzerland                                       **
**                                                                      **
**      $Header: $
**                                                                      **
*************************************************************************/

/*************************************************************************
**                                                                      **
** Description                                                          **
**                                                                      **
** This module supports use of Floquet operators in GAMMA simulations.  **
** In particular, these functions allow for facile calculations of FIDs **
** (free induction decays). It must be used in conjunction with GAMMA   **
** Floquet operator classes.                                            **
**                                                                      **
*************************************************************************/

#ifndef   Gfloq_acq_h_			// Is file already included?
#  define Gfloq_acq_h_ 1		// If no, then remember it
#  if defined(GAMPRAGMA)		// Using the GNU compiler?
#    pragma interface			// This is the interface
#  endif

#include <GamGen.h>			// Know MSVCDLL (__declspec)
#include <HSLib/GenOp.h>		// Include general operators
#include <Level2/TrnsTable1D.h>		// Include transition tables
#include <Floquet/FloqOp.h>		// Include Floquet operators
#include <Matrix/row_vector.h>		// Include row vectors

// ____________________________________________________________________________
// A			     Free Induction Decay
// ____________________________________________________________________________


MSVCDLL void FID(floq_op sigma, gen_op& det, floq_op& ham, double dw,int np,row_vector& fid);

	// Input		sigma : operator propagated (initial density mx)
	// 			det   : "detction operator" in trace computation
	//	 		ham   : "hamiltonian" for propagation (in Hertz)
	//	 		dw    : evolution time (seconds, per point)
	//	 		np    : number of points to generate
	//			fid   :	data row_vector containing the result
	// Output		      : none, fid data row_vector filled
	// Note			      : it is assumed row_vector fid is at least
	//				as large as np


MSVCDLL void FID( floq_op &sigma, gen_op& det, floq_op& ham, row_vector& fid);

	// Input	sigma : operator propagated (initial density mx)
	// 		det   : "detction operator" in trace computation
	//	 	ham   : "hamiltonian" for propagation (in Hertz)
	//		fid   :	data row_vector containing the result
	// Output	      : none, fid data row_vector filled

MSVCDLL void spec(floq_op sigma, gen_op& det, floq_op& ham, 
                        double minF, double maxF, int np, row_vector& spec);

	// Input		sigma : operator propagated (initial density mx)
	// 			det   : "detction operator" in trace computation
	//	 		ham   : "hamiltonian" for propagation (in Hertz)
	//	 		minF,maxF    : Frequency range in (in Hertz)
	//	 		np    : number of points to generate
	//			spec  :	data row_vector containing the result
	// Output		      : none, spec data row_vector filled
	// Note			      : it is assumed row_vector spec is at least
	//				as large as np


// ____________________________________________________________________________
// F                   DIRECT TRANSITION TABLE GENERATION
// ____________________________________________________________________________

/* These functions return a 1D transitions table given a prepared system
   (density operator) that will be evolved during the an acquisition.  There
   are a few other factors which will influence the table generated by these
   functions.

        ICUT    This is an intensity cutoff value.  Any transition whose
                intensity (norm) is below this value will be removed from the
                returned table.
*/

MSVCDLL TTable1D table(const floq_op& Fsig0, const gen_op& D, const floq_op& H);

MSVCDLL void transitions(const floq_op& sig0, const gen_op& D, const floq_op& H, 
                       double minF, double maxF, int np, row_vector& spec);

MSVCDLL void spec_maspowder (floq_op sigma, gen_op& det, floq_op& ham, 
                       double minF, double maxF, int np, row_vector& spec);

	// Input		sigma : operator propagated (initial density mx)
	// 			det   : "detction operator" in trace computation
	//	 		ham   : "hamiltonian" for propagation (in Hertz)
	//	 		minF,maxF    : Frequency range in (in Hertz)
	//	 		np    : number of points to generate
	//			spec  :	data row_vector containing the result
	// Output		      : none, spec data row_vector filled
	// Note			      : it is assumed row_vector spec is at least
	//				as large as np

MSVCDLL void FID_vega( floq_op sigma, gen_op& det, floq_op& ham,
          double dw,int np,row_vector& fid);

	// Input		sigma : operator propagated (initial density mx)
	// 			det   : "detction operator" in trace computation
	//	 		ham   : "hamiltonian" for propagation (in Hertz)
	//	 		dw    : evolution time (seconds, per point)
	//	 		np    : number of points to generate
	//			fid   :	data row_vector containing the result
	// Output		      : none, fid data row_vector filled
	// Note			      : it is assumed row_vector fid is at least
	//				as large as np


MSVCDLL void FID_vega( floq_op &sigma, gen_op& det, floq_op& ham,
          row_vector& fid);

	// Input	sigma : operator propagated (initial density mx)
	// 		det   : "detction operator" in trace computation
	//	 	ham   : "hamiltonian" for propagation (in Hertz)
	//		fid   :	data row_vector containing the result
	// Output	      : none, fid data row_vector filled

MSVCDLL void spec_vega(floq_op sigma, gen_op& det, floq_op& ham, 
          double minF, double maxF, int np, row_vector& spec);

	// Input		sigma : operator propagated (initial density mx)
	// 			det   : "detction operator" in trace computation
	//	 		ham   : "hamiltonian" for propagation (in Hertz)
	//	 		minF,maxF    : Frequency range in (in Hertz)
	//	 		np    : number of points to generate
	//			spec  :	data row_vector containing the result
	// Output		      : none, spec data row_vector filled
	// Note			      : it is assumed row_vector spec is at least
	//				as large as np


#endif 						/* __NMR_FLOQ_ACQ_H__ */ 
