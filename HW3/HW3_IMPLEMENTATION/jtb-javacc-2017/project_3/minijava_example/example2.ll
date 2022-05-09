


@.Base_vtable=global[3 x i8*] [
	i8 * bitcast(i32(i8 *, i32) * @Base.set to i8 *),
	i8 * bitcast(i32(i8 *, i32) * @Base.get to i8 *),
	i8 * bitcast(i32(i8 *) * @Base.foo to i8 *)
]
@.Derived_vtable=global[3 x i8*] [
	i8 * bitcast(i32(i8 *, i32) * @Derived.set to i8 *),
	i8 * bitcast(i32(i8 *, i32) * @Derived.get to i8 *),
	i8 * bitcast(i32(i8 *) * @Base.foo to i8 *)
]
@.Example_vtable=global[0 x i8*] []
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
    %b = alloca i8*
    %d = alloca i8*
    %_0 = call i8* @calloc(i32 1, i32 12)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [3 x i8*], [3 x i8*]* @.Base_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1
    store i8 * %_0, i8 ** %b
    %_3 = call i8* @calloc(i32 1, i32 12)
    %_4 = bitcast i8* %_3 to i8***
    %_5 = getelementptr [3 x i8*], [3 x i8*]* @.Derived_vtable, i32 0, i32 0
    store i8** %_5, i8*** %_4
    store i8 * %_3, i8 ** %d
    %_6 = load i8*, i8** %b

   ;Code snippet for MessageSend

    %_7 = bitcast i8* %_6 to i8***
    %_8 = load i8**, i8*** %_7
    %_9 = getelementptr i8*, i8** %_8, i32 0
    %_10 = load i8*, i8** %_9
    %_11 = bitcast i8* %_10 to i32(i8 *, i32)*

    ;Code snippet for performing the call 

    %_12 = call i32 %_11(i8* %_6 , i32 2)

    call void (i32) @print_int(i32 %_12)
    ret i32 0
}
define i32 @Base.set(i8* %this, i32 %.x){
    %x = alloca i32
    store i32 %.x, i32* %x
    %_0 = getelementptr i8, i8* %this, i32 8
    %_1 = bitcast i8* %_0 to i32*
    store i32 2, i32* %_1

   ;Code snippet for MessageSend

    %_2 = bitcast i8* %this to i8***
    %_3 = load i8**, i8*** %_2
    %_4 = getelementptr i8*, i8** %_3, i32 1
    %_5 = load i8*, i8** %_4
    %_6 = bitcast i8* %_5 to i32(i8 *, i32)*

    ;Code snippet for performing the call 

    %_7 = getelementptr i8, i8* %this, i32 8
    %_8 = bitcast i8* %_7 to i32*
    %_9 = load i32, i32* %_8
    %_10 = call i32 %_6(i8* %this , i32 %_9)

    %_11 = getelementptr i8, i8* %this, i32 8
    %_12 = bitcast i8* %_11 to i32*
    %_13 = load i32, i32* %_12

   ;Code snippet for MessageSend

    %_14 = bitcast i8* %this to i8***
    %_15 = load i8**, i8*** %_14
    %_16 = getelementptr i8*, i8** %_15, i32 1
    %_17 = load i8*, i8** %_16
    %_18 = bitcast i8* %_17 to i32(i8 *, i32)*

    ;Code snippet for performing the call 

    %_19 = getelementptr i8, i8* %this, i32 8
    %_20 = bitcast i8* %_19 to i32*
    %_21 = load i32, i32* %_20
    %_22 = call i32 %_18(i8* %this , i32 %_21)

    %_23 = mul i32 %_22 ,  %_13
    %_24 = mul i32 %_23 ,  %_10
    store i32 %_24, i32* %x
    store i32 1, i32* %x

  ;while loop
br label %whileCond_0

whileCond_0:
    %_25 = load i32, i32* %x
    %_26 = icmp slt i32 %_25 , 10
br i1%_26, label %loop_then_0, label %loop_exit_0

loop_then_0:
    %_27 = load i32, i32* %x
    call void (i32) @print_int(i32 %_27)
    %_28 = load i32, i32* %x
    %_29 = add i32 %_28 , 1
    store i32 %_29, i32* %x
br label %whileCond_0
loop_exit_0:
    %_30 = load i32, i32* %x
    ret i32 %_30
}
define i32 @Base.get(i8* %this, i32 %.x){
    %x = alloca i32
    store i32 %.x, i32* %x
    call void (i32) @print_int(i32 1)
    %_0 = load i32, i32* %x

   ;Code snippet for MessageSend

    %_1 = bitcast i8* %this to i8***
    %_2 = load i8**, i8*** %_1
    %_3 = getelementptr i8*, i8** %_2, i32 2
    %_4 = load i8*, i8** %_3
    %_5 = bitcast i8* %_4 to i32(i8 *)*

    ;Code snippet for performing the call 

    %_6 = call i32 %_5(i8* %this)

    %_7 = add i32 %_6 ,  %_0
    ret i32 %_7
}
define i32 @Base.foo(i8* %this){
    %x = alloca i32
    store i32 2, i32* %x
    %_0 = load i32, i32* %x
    ret i32 %_0
}
define i32 @Derived.set(i8* %this, i32 %.x){
    %x = alloca i32
    store i32 %.x, i32* %x
    %_0 = load i32, i32* %x
    %_1 = mul i32%_0 , 2
    %_2 = getelementptr i8, i8* %this, i32 8
    %_3 = bitcast i8* %_2 to i32*
    store i32 %_1, i32* %_3
    %_4 = getelementptr i8, i8* %this, i32 8
    %_5 = bitcast i8* %_4 to i32*
    %_6 = load i32, i32* %_5

   ;Code snippet for MessageSend

    %_7 = bitcast i8* %this to i8***
    %_8 = load i8**, i8*** %_7
    %_9 = getelementptr i8*, i8** %_8, i32 1
    %_10 = load i8*, i8** %_9
    %_11 = bitcast i8* %_10 to i32(i8 *, i32)*

    ;Code snippet for performing the call 

    %_12 = load i32, i32* %x
    %_13 = call i32 %_11(i8* %this , i32 %_12)

    %_14 = add i32 %_13 ,  %_6
    ret i32 %_14
}
define i32 @Derived.get(i8* %this, i32 %.k){
    %k = alloca i32
    store i32 %.k, i32* %k
    store i32 2, i32* %k
    %_0 = load i32, i32* %k
    ret i32 %_0
}
