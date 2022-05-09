

@.Test_vtable=global[1 x i8*] [
	i8 * bitcast(i1(i8 *, i32) * @Test.start to i8 *)
]
@.ArrayTest_vtable=global[0 x i8*] []
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
    %n = alloca i1
    ; code snipet for assignment Statemnt
    %_0 = call i8* @calloc(i32 1, i32 8)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [1 x i8*], [1 x i8*]* @.Test_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_3 = bitcast i8* %_0 to i8***
    %_4 = load i8**, i8*** %_3
    %_5 = getelementptr i8*, i8** %_4, i32 0
    %_6 = load i8*, i8** %_5
    %_7 = bitcast i8* %_6 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 10
;---IN PRIMARY EXPRESSION END 1850---


    %_8 = call i1 %_7(i8* %_0 , i32 10)

    store i1 %_8, i1* %n


    ret i32 0
}
define i1 @Test.start(i8* %this, i32 %.sz){
    %sz = alloca i32
    store i32 %.sz, i32* %sz
    %b = alloca i32*
    %i = alloca i32
    %l = alloca i32
    ; code snipet for assignment Statemnt
    ; code snipet for array allocation! 
  ;primary: sz
    %_0 = load i32, i32* %sz
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


    store i32* %_4, i32** %b


    ; code snipet for assignment Statemnt
  ;primary: b
    %_5 = load i32*, i32** %b
;---IN PRIMARY EXPRESSION END 1846---


    %_6 = load i32, i32* %_5
    store i32 %_6, i32* %l


    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %i



  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: i
    %_7 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: l
    %_8 = load i32, i32* %l
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: %_8
;---IN PRIMARY EXPRESSION END 1850---


    %_9 = icmp slt i32 %_7 , %_8
br i1%_9, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ;code snipet for ArrayAssignmentStatement
  ;primary: i
    %_10 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: i
    %_11 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


    ;1347
    ;Load the address of the %b array
    %_12 = load i32*, i32** %b
    ; Load the size of the array (first integer of the array)
    %_13 = load i32, i32* %_12
     ; Check that the index is greater than zero
    %_14 = icmp sge i32 %_10 ,0
    ;Chech that the index is less than the size of the array
    %_15 = icmp slt i32 %_10,  %_13
    %_16 = and i1 %_15, %_14
    br i1 %_16, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_17 = add i32 1, %_10
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_18 = getelementptr i32, i32* %_12 , i32 %_17
     ; And store value to that address *%_12 = value
    store i32 %_11, i32* %_18


    ;code snipet for printing
    ;code snipet for arrayLookup
  ;primary: b
    %_19 = load i32*, i32** %b
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: i
    %_20 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_21 = load i32, i32* %_19
     ; Check that the index is greater than zero
    %_22 = icmp sge i32 %_20 ,0
    ;Chech that the index is less than the size of the array
    %_23 = icmp slt i32 %_20,  %_21
    %_24 = and i1 %_23, %_22
    br i1 %_24, label %oob_ok_2, label %oob_err_2
    ; Else throw out of bounds exception
    oob_err_2:
    call void @throw_oob()
    br label %oob_ok_2
    ; All ok, we can safely index the array now
    oob_ok_2:
    %_25 = add i32 1, %_20
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_26 = getelementptr i32, i32* %_19 , i32 %_25
 %_27 = load i32, i32* %_26


    call void (i32) @print_int(i32 %_27)
    ; code snipet for assignment Statemnt
  ;primary: i
    %_28 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_29 = add i32 1 ,  %_28


    store i32 %_29, i32* %i


br label %whileCond_0
loop_exit_0:


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
