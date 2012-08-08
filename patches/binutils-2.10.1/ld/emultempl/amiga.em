# This shell script emits a C file. -*- C -*-
# It does some substitutions.
cat >e${EMULATION_NAME}.c <<EOF
/* This file is is generated by a shell script.  DO NOT EDIT! */

/* emulate the original gld for the given ${EMULATION_NAME}
   Copyright (C) 1991, 1993 Free Software Foundation, Inc.
   Written by Steve Chamberlain steve@cygnus.com

This file is part of GLD, the Gnu Linker.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

#define TARGET_IS_${EMULATION_NAME}

#include "bfd.h"
#include "sysdep.h"
#include "bfdlink.h"

#include "getopt.h"
#include "ld.h"
#include "config.h"
#include "ldmain.h"
#include "ldemul.h"
#include "ldfile.h"
#include "ldmisc.h"
#include "ldexp.h"
#include "ldlang.h"

#if defined(TARGET_IS_amiga)
#include "libamiga.h"
#else
extern int amiga_base_relative; /* defined in amigaoslink.c */
#endif

/* 1 means, write out debug hunk, when producing a load file */
extern int write_debug_hunk;

/* This is the attribute to use for the next file */
extern int amiga_attribute;

/* generate a resident executable */
extern int amiga_resident;

static void gld${EMULATION_NAME}_before_parse PARAMS ((void));
static char *gld${EMULATION_NAME}_get_script PARAMS ((int *isfile));
static int gld${EMULATION_NAME}_parse_args PARAMS ((int, char **));

/* Handle amiga specific options */
static int
gld${EMULATION_NAME}_parse_args (argc, argv)
     int argc;
     char **argv;
{
  int prevoptind = optind;
  int prevopterr = opterr;
  int indx;
  int longind;
  int optc;
  long val;
  char *end;

#define OPTION_IGNORE (300)
#define OPTION_AMIGA_CHIP               (OPTION_IGNORE + 1)
#define OPTION_AMIGA_FAST               (OPTION_AMIGA_CHIP + 1)
#define OPTION_AMIGA_ATTRIBUTE          (OPTION_AMIGA_FAST + 1)
#define OPTION_AMIGA_DEBUG              (OPTION_AMIGA_ATTRIBUTE + 1)
#define OPTION_AMIGA_DATADATA_RELOC     (OPTION_AMIGA_DEBUG + 1)
#define OPTION_FLAVOR			(OPTION_AMIGA_DATADATA_RELOC + 1)

  static struct option longopts[] = {
    {"amiga-datadata-reloc", no_argument, NULL, OPTION_AMIGA_DATADATA_RELOC},
    /*    '\0', NULL, "Relocate for resident program", ONE_DASH },*/
    {"amiga-debug-hunk", no_argument, NULL, OPTION_AMIGA_DEBUG},
    /*    '\0', NULL, "Output encapsulated stabs in debug hunk", ONE_DASH },*/
    {"attribute", required_argument, NULL, OPTION_AMIGA_ATTRIBUTE},
    /*'\0', NULL, "Set section attributes", ONE_DASH },*/
    {"chip", no_argument, NULL, OPTION_AMIGA_CHIP},
    /*'\0', NULL, "Force sections in chip memory", ONE_DASH },*/
    {"fast", no_argument, NULL, OPTION_AMIGA_FAST},
    /*'\0', NULL, "Force sections in fast memory", ONE_DASH },*/
    {"flavor", required_argument, NULL, OPTION_FLAVOR},
    /*'\0', NULL, "Select a library flavor", ONE_DASH },*/
    {NULL, no_argument, NULL, 0}
  };

  indx = optind;
  if (indx == 0)
    indx = 1;

  opterr = 0;
  optc = getopt_long_only (argc, argv, "-", longopts, &longind);
  opterr = prevopterr;
  switch (optc)
    {
    default:
      optind = prevoptind;
      return 0;

    case 0:
      /* Long option which just sets a flag.  */
      break;

    case OPTION_AMIGA_CHIP:
      amiga_attribute=2; /* We do not use MEMF_FAST, so we do not have to include exec/memory.h*/
      break;
    case OPTION_AMIGA_FAST:
      amiga_attribute=4;
      break;
    case OPTION_AMIGA_ATTRIBUTE:
      {
	char *end;
	amiga_attribute = strtoul (optarg, &end, 0);
	if (*end)
	  einfo ("%P%F: invalid number \`%s\'\n", optarg);
      }
      break;
    case OPTION_AMIGA_DEBUG:
      write_debug_hunk=1; /* Write out debug hunk */
      break;

    case OPTION_AMIGA_DATADATA_RELOC:
      amiga_resident=1; /* Write out datadata_reloc array */
      break;

    case OPTION_FLAVOR:
      {
	extern void ldfile_add_flavor (char*);
	ldfile_add_flavor (optarg);
      }
      break;
    }
  return 1;
}

static void
gld${EMULATION_NAME}_before_parse()
{
#if defined(TARGET_IS_amiga_bss)
  amiga_base_relative=1;
  amiga_resident=0;
#endif

#ifndef TARGET_			/* I.e., if not generic.  */
  ldfile_output_architecture = bfd_arch_${ARCH};
#endif /* not TARGET_ */
}

static void 
gld${EMULATION_NAME}_after_parse()
{
  sort_flavors();
}

static void 
gld${EMULATION_NAME}_after_open()
{
  ldctor_build_sets ();
}

#if defined(TARGET_IS_amiga)

static void
 amiga_assign_attribute(lang_input_statement_type *);

void
amiga_after_allocation()
{
#if 0 /* Does not work at the moment */
  lang_for_each_input_file (amiga_assign_attribute);
#endif
}

static void
amiga_assign_attribute(inp)
     lang_input_statement_type *inp;
{
  asection *s;

  if (inp->the_bfd->xvec->flavour==bfd_target_amiga_flavour)
    {
      for (s=inp->the_bfd->sections;s!=NULL;s=s->next)
	amiga_per_section(s)->attribute=inp->amiga_attribute;
    }

}
#else
extern void
amiga_after_allocation();
#endif

static char *
gld${EMULATION_NAME}_get_script(isfile)
     int *isfile;
EOF

if test -n "$COMPILE_IN"
then
# Scripts compiled in.

# sed commands to quote an ld script as a C string.
sc="-f ${srcdir}/emultempl/stringify.sed"

cat >>e${EMULATION_NAME}.c <<EOF
{			     
  *isfile = 0;

  if (link_info.relocateable == true && config.build_constructors == true)
    return
EOF
sed $sc ldscripts/${EMULATION_NAME}.xu                     >> e${EMULATION_NAME}.c
echo '  ; else if (link_info.relocateable == true) return' >> e${EMULATION_NAME}.c
sed $sc ldscripts/${EMULATION_NAME}.xr                     >> e${EMULATION_NAME}.c
echo '  ; else if (!config.text_read_only) return'         >> e${EMULATION_NAME}.c
sed $sc ldscripts/${EMULATION_NAME}.xbn                    >> e${EMULATION_NAME}.c
echo '  ; else if (!config.magic_demand_paged) return'     >> e${EMULATION_NAME}.c
sed $sc ldscripts/${EMULATION_NAME}.xn                     >> e${EMULATION_NAME}.c
echo '  ; else return'                                     >> e${EMULATION_NAME}.c
sed $sc ldscripts/${EMULATION_NAME}.x                      >> e${EMULATION_NAME}.c
echo '; }'                                                 >> e${EMULATION_NAME}.c

else
# Scripts read from the filesystem.

cat >>e${EMULATION_NAME}.c <<EOF
{			     
  *isfile = 1;

  if (link_info.relocateable == true && config.build_constructors == true)
    return "ldscripts/${EMULATION_NAME}.xu";
  else if (link_info.relocateable == true)
    return "ldscripts/${EMULATION_NAME}.xr";
  else if (!config.text_read_only)
    return "ldscripts/${EMULATION_NAME}.xbn";
  else if (!config.magic_demand_paged)
    return "ldscripts/${EMULATION_NAME}.xn";
  else
    return "ldscripts/${EMULATION_NAME}.x";
}
EOF

fi

cat >>e${EMULATION_NAME}.c <<EOF

struct ld_emulation_xfer_struct ld_${EMULATION_NAME}_emulation = 
{
  gld${EMULATION_NAME}_before_parse,	/* before_parse */
  syslib_default,			/* syslib */
  hll_default,				/* hll */
  gld${EMULATION_NAME}_after_parse,
  gld${EMULATION_NAME}_after_open,
  amiga_after_allocation,		/* after_allocation */
  set_output_arch_default,		/* set_output_arch */
  ldemul_default_target,		/* choose_target */
  before_allocation_default,		/* before_allocation */
  gld${EMULATION_NAME}_get_script,	/* get_script */
  "${EMULATION_NAME}",			/* emulation_name */
  "${OUTPUT_FORMAT}",			/* target_name */
  NULL,					/* finish */
  NULL,					/* create_output_section_statements */
  NULL,					/* open_dynamic_library */
  NULL,					/* place_orphan */
  NULL,					/* set_symbols */
  gld${EMULATION_NAME}_parse_args,
  NULL,					/* unrecognized file */
};
EOF
