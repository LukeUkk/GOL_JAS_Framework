#define	COMPONENT VCOMAI
#include "..\scriptComponent.hpp"

#define COMPONENTPATH(var1) CUSTOM_FOLDER\COMPONENT##_##var1.sqf
#define PREP(var1) ##COMPONENT##_##var1 = compile preProcessFileLineNumbers QUOTE(COMPONENTPATH(var1));
#define PREP_SUB(var1) ##COMPONENT##_##var1 = compile preProcessFileLineNumbers QUOTE(CUSTOM_FOLDER\DangerCauses\COMPONENT##_##var1.sqf);
