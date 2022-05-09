

@.A_vtable=global[1 x i8*] [
	i8 * bitcast(i32(i8 *) * @A.run to i8 *)
]
@.OutOfBounds1_vtable=global[0 x i8*] []
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
    %_0 = call i8* @calloc(i32 1, i32 8)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [1 x i8*], [1 x i8*]* @.A_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_3 = bitcast i8* %_0 to i8***
    %_4 = load i8**, i8*** %_3
    %_5 = getelementptr i8*, i8** %_4, i32 0
    %_6 = load i8*, i8** %_5
    %_7 = bitcast i8* %_6 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_8 = call i32 %_7(i8* %_0)

    call void (i32) @print_int(i32 %_8)
    ret i32 0
}
define i32 @A.run(i8* %this){
    %a = alloca i32*
    ; code snipet for assignment Statemnt
    ; code snipet for array allocation! 
  ;primary: 20
;---IN PRIMARY EXPRESSION END 1850---


    %_0 = add i32 1 , 20
    ; Check that the size of the array is not negative - since we added 1, we just check
    ; that the size is >= 1.
    %_1 = icmp sge i32 %_0 , 1
    br i1 %_1 , label %sizeIsNotNeg_0, label %sizeIsNeg_0
    ; Size was negative, throw negative size exception
    sizeIsNeg_0:
    call void @throw_nsz()
    br label %sizeIsNotNeg_0
    ; All ok, we can proceed with the allocation
    sizeIsNotNeg_0:
    ; Allocate sz + 1 integers (4 bytes each)
    %_2 = call i8* @calloc( i32 %_0, i32 4)
    ; Cast the returned pointer
    %_3 = bitcast i8* %_2 to i32*
    ; Store the size of the array in the first position of the array
    store i32 20, i32* %_3


  ;primary: %_3
;---IN PRIMARY EXPRESSION END 1850---


    store i32* %_3, i32** %a


    ;code snipet for printing
    ;code snipet for arrayLookup
  ;primary: a
    %_4 = load i32*, i32** %a
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 10
;---IN PRIMARY EXPRESSION END 1850---


    ; Load the size of the array (first integer of the array)
    %_5 = load i32, i32* %_4
     ; Check that the index is greater than zero
    %_6 = icmp sge i32 10 ,0
    ;Chech that the index is less than the size of the array
    %_7 = icmp slt i32 10,  %_5
    %_8 = and i1 %_7, %_6
    br i1 %_8, label %oob_ok_0, label %oob_err_0
    ; Else throw out of bounds exception
    oob_err_0:
    call void @throw_oob()
    br label %oob_ok_0
    ; All ok, we can safely index the array now
    oob_ok_0:
    %_9 = add i32 1, 10
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_10 = getelementptr i32, i32* %_4 , i32 %_9
 %_11 = load i32, i32* %_10


    call void (i32) @print_int(i32 %_11)
    ;code snipet for arrayLookup
  ;primary: a
    %_12 = load i32*, i32** %a
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 40
;---IN PRIMARY EXPRESSION END 1850---


    ; Load the size of the array (first integer of the array)
    %_13 = load i32, i32* %_12
     ; Check that the index is greater than zero
    %_14 = icmp sge i32 40 ,0
    ;Chech that the index is less than the size of the array
    %_15 = icmp slt i32 40,  %_13
    %_16 = and i1 %_15, %_14
    br i1 %_16, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_17 = add i32 1, 40
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_18 = getelementptr i32, i32* %_12 , i32 %_17
 %_19 = load i32, i32* %_18


    ret i32 %_19
}
