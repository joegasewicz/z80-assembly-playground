;;
;; Sample Code
;;
    ; Allow the Next paging and instructions
    DEVICE ZXSPECTRUMNEXT

    ; Generate a map file for use with Cspect
    CSPECTMAP "project1.map"

    org $8000
; $4000 - $57FF (16384 to 22527) Screen area
; $5800 - $5AFF (22528 to 23295) Color Attribute area

; A F
; B C
; D E
; H L
; I
; R

; EQU - define constants
; DB/DEFB - define bytes
; DM/DEFM - define message
; DW/DEFW - define word
; DS/DEFS - define space

; RST 

; INC & DEC 

; LD destination, origin

; AND , OR, XOR (if both are equal - 0 otherwise 1)

; PrintTwoLetters:
;     ld hl, msg
;     ld a, (hl)
;     rst $10
;     inc hl
;     ld a, (hl)
;     rst $10
;     inc hl
;     ld a, (hl)
;     rst $10
;     ret

ATTR_S:     equ $5c8d               ; Format: FLASH, BRIGHT, PAPER, INK (FBPPPIII)
ATTR_T:     equ $5c8f               ; System variables: current attribute (FBPPPIII)

; --------------------------------------------------------------
; ROM Routine similiar to Basic AT
; Position the cursor at the specified coordinates.
; Input: B -> Y-coordinate.
;        C -> X-coordinate.
; In this routine, the top left-hand corner of the screem
; is (24, 33).
; Alters the value of A, DE and HL registers.
; ---------------------------------------------------------------
LOCATE:   equ $0dd9
; ---------------------------------------------------------------
; ROM routine similair to Basic's CLS.
; Clear the display using the attribute loaded in the system 
; variable ATTR_S. Alters the value of the AF, BC, DE and HL 
; registers.
; -----------------------------------------------------------------
CLS:    equ $0daf

Main:
    ld a, $0e               ; A = color attributes
    ld hl, ATTR_T           ; Load into memory





;;
;; Set up the Next output
;;

    ; This sets the name of the project, the start address,
    ; and the initial stack pointer
    SAVENEX OPEN "project1.nex", Main, $ff40

    ; This asserts the minimum core version. Set it to the core version
    ; and the initial stack pointer
    SAVENEX CORE 2,0,0

    ; This sets the border color whi8le loading (in this case white)
    ; what to do with the file handle of the next file when starting (0 =
    ; close file handle as we're not going to access the project1.nex
    ; file after starting. See sjasmplus (0 = no, we set to default), and
    ; whether we require the full 2MB expansion (0 = no we don't).
    SAVENEX CFG 7,0,0,0

    ; Generate the #Nex File automatically based on which pages you use.
    SAVENEX AUTO

