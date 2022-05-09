


@.ArrayTest_vtable=global[1 x i8*] [
	i8 * bitcast(i32(i8 *, i32) * @ArrayTest.test to i8 *)
]
@.B_vtable=global[1 x i8*] [
	i8 * bitcast(i32(i8 *, i32) * @B.test to i8 *)
]
@.Main_vtable=global[0 x i8*] []
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
    %ab = alloca i8*
    ; code snipet for assignment Statemnt
    %_0 = call i8* @calloc(i32 1, i32 20)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [1 x i8*], [1 x i8*]* @.ArrayTest_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_0, i8 ** %ab


    ;code snipet for printing
  ;primary: ab
    %_3 = load i8*, i8** %ab
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_4 = bitcast i8* %_3 to i8***
    %_5 = load i8**, i8*** %_4
    %_6 = getelementptr i8*, i8** %_5, i32 0
    %_7 = load i8*, i8** %_6
    %_8 = bitcast i8* %_7 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 3
;---IN PRIMARY EXPRESSION END 1850---


    %_9 = call i32 %_8(i8* %_3 , i32 3)

    call void (i32) @print_int(i32 %_9)
    ret i32 0
}
define i32 @ArrayTest.test(i8* %this, i32 %.num){
    %num = alloca i32
    store i32 %.num, i32* %num
    %i = alloca i32
    %intArray = alloca i32*
    ; code snipet for assignment Statemnt
    ; code snipet for array allocation! 
  ;primary: num
    %_0 = load i32, i32* %num
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


    store i32* %_4, i32** %intArray


    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    %_5 = getelementptr i8, i8* %this, i32 16
    %_6 = bitcast i8* %_5 to i32*
    store i32 0, i32* %_6


    ;code snipet for printing
  ;primary: aaa
    %_7 = getelementptr i8, i8* %this, i32 16
    %_8 = bitcast i8* %_7 to i32*
    %_9 = load i32, i32* %_8
;---IN PRIMARY EXPRESSION END 1838 ---


    call void (i32) @print_int(i32 %_9)
    ;code snipet for printing
  ;primary: intArray
    %_10 = load i32*, i32** %intArray
;---IN PRIMARY EXPRESSION END 1846---


    %_11 = load i32, i32* %_10
    call void (i32) @print_int(i32 %_11)
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %i


    ;code snipet for printing
  ;primary: 111
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 111)

  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: i
    %_12 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: intArray
    %_13 = load i32*, i32** %intArray
;---IN PRIMARY EXPRESSION END 1846---


    %_14 = load i32, i32* %_13
  ;primary: %_14
;---IN PRIMARY EXPRESSION END 1850---


    %_15 = icmp slt i32 %_12 , %_14
br i1%_15, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ;code snipet for printing
  ;primary: i
    %_16 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_17 = add i32 1 ,  %_16


    call void (i32) @print_int(i32 %_17)
    ;code snipet for ArrayAssignmentStatement
  ;primary: i
    %_18 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: i
    %_19 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_20 = add i32 1 ,  %_19


    ;1347
    ;Load the address of the %intArray array
    %_21 = load i32*, i32** %intArray
    ; Load the size of the array (first integer of the array)
    %_22 = load i32, i32* %_21
     ; Check that the index is greater than zero
    %_23 = icmp sge i32 %_18 ,0
    ;Chech that the index is less than the size of the array
    %_24 = icmp slt i32 %_18,  %_22
    %_25 = and i1 %_24, %_23
    br i1 %_25, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_26 = add i32 1, %_18
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_27 = getelementptr i32, i32* %_21 , i32 %_26
     ; And store value to that address *%_21 = value
    store i32 %_20, i32* %_27


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


    ;code snipet for printing
  ;primary: 222
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 222)
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %i



  ;while loop
br label %whileCond_2

whileCond_2:
  ;primary: i
    %_30 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: intArray
    %_31 = load i32*, i32** %intArray
;---IN PRIMARY EXPRESSION END 1846---


    %_32 = load i32, i32* %_31
  ;primary: %_32
;---IN PRIMARY EXPRESSION END 1850---


    %_33 = icmp slt i32 %_30 , %_32
br i1%_33, label %loop_then_2, label %loop_exit_2

loop_then_2:
    ;code snipet for printing
    ;code snipet for arrayLookup
  ;primary: intArray
    %_34 = load i32*, i32** %intArray
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: i
    %_35 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_36 = load i32, i32* %_34
     ; Check that the index is greater than zero
    %_37 = icmp sge i32 %_35 ,0
    ;Chech that the index is less than the size of the array
    %_38 = icmp slt i32 %_35,  %_36
    %_39 = and i1 %_38, %_37
    br i1 %_39, label %oob_ok_3, label %oob_err_3
    ; Else throw out of bounds exception
    oob_err_3:
    call void @throw_oob()
    br label %oob_ok_3
    ; All ok, we can safely index the array now
    oob_ok_3:
    %_40 = add i32 1, %_35
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_41 = getelementptr i32, i32* %_34 , i32 %_40
 %_42 = load i32, i32* %_41


    call void (i32) @print_int(i32 %_42)
    ; code snipet for assignment Statemnt
  ;primary: i
    %_43 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_44 = add i32 1 ,  %_43


    store i32 %_44, i32* %i


br label %whileCond_2
loop_exit_2:


    ;code snipet for printing
  ;primary: 333
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 333)
  ;primary: intArray
    %_45 = load i32*, i32** %intArray
;---IN PRIMARY EXPRESSION END 1846---


    %_46 = load i32, i32* %_45
    ret i32 %_46
}
define i32 @B.test(i8* %this, i32 %.num){
    %num = alloca i32
    store i32 %.num, i32* %num
    %i = alloca i32
    %intArray = alloca i32*
    ; code snipet for assignment Statemnt
    ; code snipet for array allocation! 
  ;primary: num
    %_0 = load i32, i32* %num
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


    store i32* %_4, i32** %intArray


    ; code snipet for assignment Statemnt
  ;primary: 12
;---IN PRIMARY EXPRESSION END 1850---


    %_5 = getelementptr i8, i8* %this, i32 20
    %_6 = bitcast i8* %_5 to i32*
    store i32 12, i32* %_6


    ;code snipet for printing
  ;primary: aaa
    %_7 = getelementptr i8, i8* %this, i32 20
    %_8 = bitcast i8* %_7 to i32*
    %_9 = load i32, i32* %_8
;---IN PRIMARY EXPRESSION END 1838 ---


    call void (i32) @print_int(i32 %_9)
    ;code snipet for printing
  ;primary: intArray
    %_10 = load i32*, i32** %intArray
;---IN PRIMARY EXPRESSION END 1846---


    %_11 = load i32, i32* %_10
    call void (i32) @print_int(i32 %_11)
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %i


    ;code snipet for printing
  ;primary: 111
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 111)

  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: i
    %_12 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: intArray
    %_13 = load i32*, i32** %intArray
;---IN PRIMARY EXPRESSION END 1846---


    %_14 = load i32, i32* %_13
  ;primary: %_14
;---IN PRIMARY EXPRESSION END 1850---


    %_15 = icmp slt i32 %_12 , %_14
br i1%_15, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ;code snipet for printing
  ;primary: i
    %_16 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_17 = add i32 1 ,  %_16


    call void (i32) @print_int(i32 %_17)
    ;code snipet for ArrayAssignmentStatement
  ;primary: i
    %_18 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: i
    %_19 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_20 = add i32 1 ,  %_19


    ;1347
    ;Load the address of the %intArray array
    %_21 = load i32*, i32** %intArray
    ; Load the size of the array (first integer of the array)
    %_22 = load i32, i32* %_21
     ; Check that the index is greater than zero
    %_23 = icmp sge i32 %_18 ,0
    ;Chech that the index is less than the size of the array
    %_24 = icmp slt i32 %_18,  %_22
    %_25 = and i1 %_24, %_23
    br i1 %_25, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_26 = add i32 1, %_18
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_27 = getelementptr i32, i32* %_21 , i32 %_26
     ; And store value to that address *%_21 = value
    store i32 %_20, i32* %_27


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


    ;code snipet for printing
  ;primary: 222
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 222)
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %i



  ;while loop
br label %whileCond_2

whileCond_2:
  ;primary: i
    %_30 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: intArray
    %_31 = load i32*, i32** %intArray
;---IN PRIMARY EXPRESSION END 1846---


    %_32 = load i32, i32* %_31
  ;primary: %_32
;---IN PRIMARY EXPRESSION END 1850---


    %_33 = icmp slt i32 %_30 , %_32
br i1%_33, label %loop_then_2, label %loop_exit_2

loop_then_2:
    ;code snipet for printing
    ;code snipet for arrayLookup
  ;primary: intArray
    %_34 = load i32*, i32** %intArray
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: i
    %_35 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_36 = load i32, i32* %_34
     ; Check that the index is greater than zero
    %_37 = icmp sge i32 %_35 ,0
    ;Chech that the index is less than the size of the array
    %_38 = icmp slt i32 %_35,  %_36
    %_39 = and i1 %_38, %_37
    br i1 %_39, label %oob_ok_3, label %oob_err_3
    ; Else throw out of bounds exception
    oob_err_3:
    call void @throw_oob()
    br label %oob_ok_3
    ; All ok, we can safely index the array now
    oob_ok_3:
    %_40 = add i32 1, %_35
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_41 = getelementptr i32, i32* %_34 , i32 %_40
 %_42 = load i32, i32* %_41


    call void (i32) @print_int(i32 %_42)
    ; code snipet for assignment Statemnt
  ;primary: i
    %_43 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_44 = add i32 1 ,  %_43


    store i32 %_44, i32* %i


br label %whileCond_2
loop_exit_2:


    ;code snipet for printing
  ;primary: 333
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 333)
  ;primary: intArray
    %_45 = load i32*, i32** %intArray
;---IN PRIMARY EXPRESSION END 1846---


    %_46 = load i32, i32* %_45
    ret i32 %_46
}
