TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
#DB += xxx.db
DB += SRS10_test.substitutions
DB += SRS_aiFloat.template
DB += SRS_aoFloat.template
DB += SRS_PV.db
DB += SRS10_BCD.db
DB += SRS10_Out.substitutions
DB += SRS_bo.template
DB += SRS_bi.template
DB += SRS_mbbi.template
DB += SRS_mbbo.template
#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

