# Generated by the VisualDSP++ IDDE

# Note:  Any changes made to this Makefile will be lost the next time the
# matching project file is loaded into the IDDE.  If you wish to preserve
# changes, rename this file and run it externally to the IDDE.

# The syntax of this Makefile is such that GNU Make v3.77 or higher is
# required.

# The current working directory should be the directory in which this
# Makefile resides.

# Supported targets:
#     teste_fir1_Debug
#     teste_fir1_Debug_clean

# Define this variable if you wish to run this Makefile on a host
# other than the host that created it and VisualDSP++ may be installed
# in a different directory.

ADI_DSP=D:\Documents\Apps\VirtualDSP


# $VDSP is a gmake-friendly version of ADI_DIR

empty:=
space:= $(empty) $(empty)
VDSP_INTERMEDIATE=$(subst \,/,$(ADI_DSP))
VDSP=$(subst $(space),\$(space),$(VDSP_INTERMEDIATE))

RM=cmd /C del /F /Q

#
# Begin "teste_fir1_Debug" configuration
#

ifeq ($(MAKECMDGOALS),teste_fir1_Debug)

teste_fir1_Debug : ./Debug/teste_fir1.dxe 

./Debug/teste_fir1.doj :teste_fir1.c $(VDSP)/Blackfin/include/stdio.h $(VDSP)/Blackfin/include/yvals.h $(VDSP)/Blackfin/include/cycles.h $(VDSP)/Blackfin/include/xcycle_count.h $(VDSP)/Blackfin/include/limits.h $(VDSP)/Blackfin/include/cycle_count_bf.h 
	@echo ".\teste_fir1.c"
	$(VDSP)/ccblkfn.exe -c .\teste_fir1.c -file-attr ProjectName=teste_fir1 -O -Ov100 -g -Oa -structs-do-not-overlap -no-multiline -D DO_CYCLE_COUNTS -double-size-32 -decls-strong -warn-protos -proc ADSP-BF533 -o .\Debug\teste_fir1.doj -MM

./Debug/teste_fir1.dxe :$(VDSP)/Blackfin/ldf/adsp-BF533.ldf $(VDSP)/Blackfin/lib/bf532_rev_0.5/crtsf532y.doj ./Debug/teste_fir1.doj $(VDSP)/Blackfin/lib/bf532_rev_0.5/__initsbsz532.doj $(VDSP)/Blackfin/lib/cplbtab533.doj $(VDSP)/Blackfin/lib/bf532_rev_0.5/crtn532y.doj $(VDSP)/Blackfin/lib/bf532_rev_0.5/libsmall532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/libio532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/libc532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/librt_fileio532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/libevent532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/libcpp532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/libf64ieee532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/libdsp532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/libsftflt532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/libetsi532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/Debug/libssl532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/Debug/libdrv532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/Debug/libusb532y.dlb $(VDSP)/Blackfin/lib/bf532_rev_0.5/libprofile532y.dlb 
	@echo "Linking..."
	$(VDSP)/ccblkfn.exe .\Debug\teste_fir1.doj -L .\Debug -add-debug-libpaths -flags-link -od,.\Debug -o .\Debug\teste_fir1.dxe -proc ADSP-BF533 -MM

endif

ifeq ($(MAKECMDGOALS),teste_fir1_Debug_clean)

teste_fir1_Debug_clean:
	-$(RM) ".\Debug\teste_fir1.doj"
	-$(RM) ".\Debug\teste_fir1.dxe"
	-$(RM) ".\Debug\*.ipa"
	-$(RM) ".\Debug\*.opa"
	-$(RM) ".\Debug\*.ti"
	-$(RM) ".\Debug\*.pgi"
	-$(RM) ".\*.rbld"

endif


