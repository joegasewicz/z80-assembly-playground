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

Start:
    ld hl, Msg
    CALL Loop

Loop:
    ld a, (hl)         ; loads a character from the string
    or a                ; A or A = 0 only if A = 0 (a will equal 0 if = 0)
    jr z, Exit          ; if A = 0, jump to the Exit label
    rst $10             ; paints the character
    inc hl              ; HL = next character
    jr Loop             ; returns to the beginning of the loop

Exit:                   
    ret                 ; exists the programme

Msg:
    defm 'Hello Joe how are you', $00

;;
;; Set up the Next output
;;

    ; This sets the name of the project, the start address,
    ; and the initial stack pointer
    SAVENEX OPEN "project1.nex", Start, $ff40

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

