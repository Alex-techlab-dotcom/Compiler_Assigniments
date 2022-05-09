
@.arrays_vtable=global[0 x i8*] []
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
    %x = alloca i32*
    %size = alloca i32
    ; code snipet for assignment Statemnt
    ; code snipet for array allocation! 


    %_0 = add i32 1 , 9
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
    store i32 9, i32* %_3




    store i32* %_3, i32** %x


    ; code snipet for assignment Statemnt
    %_4 = load i32*, i32** %x


    %_5 = load i32, i32* %_4
    store i32 %_5, i32* %size


    ;code snipet for ArrayAssignmentStatement




    ;Load the address of the x array
    %_6 = load i32*, i32** %x
    ; Load the size of the array (first integer of the array)
    %_7 = load i32, i32* %_6
     ; Check that the index is greater than zero
    %_8 = icmp sge i32 0 ,0
    ;Chech that the index is less than the size of the array
    %_9 = icmp slt i32 0,  %_7
    %_10 = and i1 %_9, %_8
    br i1 %_10, label %oob_ok_0, label %oob_err_0
    ; Else throw out of bounds exception
    oob_err_0:
    call void @throw_oob()
    br label %oob_ok_0
    ; All ok, we can safely index the array now
    oob_ok_0:
    %_11 = add i32 1, 0
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_12 = getelementptr i32, i32* %_6 , i32 %_11
     ; And store value to that address *%_6 = value
    store i32 1, i32* %_12


    ;code snipet for ArrayAssignmentStatement




    ;Load the address of the x array
    %_13 = load i32*, i32** %x
    ; Load the size of the array (first integer of the array)
    %_14 = load i32, i32* %_13
     ; Check that the index is greater than zero
    %_15 = icmp sge i32 4 ,0
    ;Chech that the index is less than the size of the array
    %_16 = icmp slt i32 4,  %_14
    %_17 = and i1 %_16, %_15
    br i1 %_17, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_18 = add i32 1, 4
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_19 = getelementptr i32, i32* %_13 , i32 %_18
     ; And store value to that address *%_13 = value
    store i32 2, i32* %_19


    ;code snipet for printing
    %_20 = load i32, i32* %size


    call void (i32) @print_int(i32 %_20)
    ret i32 0
}
