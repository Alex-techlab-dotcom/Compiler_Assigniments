

@.Test1_vtable=global[1 x i8*] [
	i8 * bitcast(i32(i8 *, i32, i1) * @Test1.Start to i8 *)
]
@.Example1_vtable=global[0 x i8*] []
declare i8* @calloc(i32, i32)
declare i32 @printf(i8*, ...)
declare void @exit(i32)

@_cint = constant [4 x i8] c"%d\0a\00"
@_cOOB = constant [15 x i8] c"Out of bounds\0a\00"
@_cNSZ = constant [15 x i8] c"Negative size\0a\00"

define void @print_int(i32 %i) {
    %_str = bitcast [4 x i8]* @_cint to i8*
    call i32 (i8*, ...) @printf(i8* %_str, i32 %i)
    ret void
}

define void @throw_oob() {
    %_str = bitcast [15 x i8]* @_cOOB to i8*
    call i32 (i8*, ...) @printf(i8* %_str)
    call void @exit(i32 1)
    ret void
}

define void @throw_nsz() {
    %_str = bitcast [15 x i8]* @_cNSZ to i8*
    call i32 (i8*, ...) @printf(i8* %_str)
    call void @exit(i32 1)
    ret void
}
define i32 @main() {
    ;code snipet for printing
    %_0 = call i8* @calloc(i32 1, i32 12)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [1 x i8*], [1 x i8*]* @.Test1_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_3 = bitcast i8* %_0 to i8***
    %_4 = load i8**, i8*** %_3
    %_5 = getelementptr i8*, i8** %_4, i32 0
    %_6 = load i8*, i8** %_5
    %_7 = bitcast i8* %_6 to i32 (i8 *, i32, i1)*

    ;Code snippet for performing the call 

  ;primary: 5
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    %_8 = call i32 %_7(i8* %_0 , i32 5, i1 1)

    call void (i32) @print_int(i32 %_8)
    ret i32 0
}
define i32 @Test1.Start(i8* %this, i32 %.b, i1 %.c){
    %b = alloca i32
    store i32 %.b, i32* %b
    %c = alloca i1
    store i1 %.c, i1* %c
    %ntb = alloca i1
    %nti = alloca i32*
    %ourint = alloca i32
    ; code snipet for assignment Statemnt
    ; code snipet for array allocation! 
  ;primary: b
    %_0 = load i32, i32* %b
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = add i32 1 , %_0
    ; Check that the size of the array is not negative - since we added 1, we just check
    ; that the size is >= 1.
    %_2 = icmp sge i32 %_1 , 1
    br i1 %_2 , label %sizeIsNotNeg_0, label %sizeIsNeg_0
    ; Size was negative, throw negative size exception
    sizeIsNeg_0:
    call void @throw_nsz()
    br label %sizeIsNotNeg_0
    ; All ok, we can proceed with the allocation
    sizeIsNotNeg_0:
    ; Allocate sz + 1 integers (4 bytes each)
    %_3 = call i8* @calloc( i32 %_1, i32 4)
    ; Cast the returned pointer
    %_4 = bitcast i8* %_3 to i32*
    ; Store the size of the array in the first position of the array
    store i32 %_0, i32* %_4


  ;primary: %_4
;---IN PRIMARY EXPRESSION END 1850---


    store i32* %_4, i32** %nti


    ; code snipet for assignment Statemnt
    ;code snipet for arrayLookup
  ;primary: nti
    %_5 = load i32*, i32** %nti
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ; Load the size of the array (first integer of the array)
    %_6 = load i32, i32* %_5
     ; Check that the index is greater than zero
    %_7 = icmp sge i32 0 ,0
    ;Chech that the index is less than the size of the array
    %_8 = icmp slt i32 0,  %_6
    %_9 = and i1 %_8, %_7
    br i1 %_9, label %oob_ok_0, label %oob_err_0
    ; Else throw out of bounds exception
    oob_err_0:
    call void @throw_oob()
    br label %oob_ok_0
    ; All ok, we can safely index the array now
    oob_ok_0:
    %_10 = add i32 1, 0
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_11 = getelementptr i32, i32* %_5 , i32 %_10
 %_12 = load i32, i32* %_11


    store i32 %_12, i32* %ourint


    ;code snipet for printing
  ;primary: ourint
    %_13 = load i32, i32* %ourint
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_13)
    ;code snipet for arrayLookup
  ;primary: nti
    %_14 = load i32*, i32** %nti
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ; Load the size of the array (first integer of the array)
    %_15 = load i32, i32* %_14
     ; Check that the index is greater than zero
    %_16 = icmp sge i32 0 ,0
    ;Chech that the index is less than the size of the array
    %_17 = icmp slt i32 0,  %_15
    %_18 = and i1 %_17, %_16
    br i1 %_18, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_19 = add i32 1, 0
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_20 = getelementptr i32, i32* %_14 , i32 %_19
 %_21 = load i32, i32* %_20


    ret i32 %_21
}
