    lui s0, 0x10000  # serial address 
.TESTW1:
    lb s1, 5(s0)                      
    andi s1, s1, 0x20                 
    beq s1, zero, .TESTW1             

    addi a0, zero, 'b'                
    sb a0, 0(s0)                      

.TESTW2:
    lb s1, 5(s0)                      
    andi s1, s1, 0x20                 
    beq s1, zero, .TESTW2             

    addi a0, zero, 'o' # 4c
    sb a0, 0(s0)  # 50

 .TESTW3:
     lb s1, 5(s0) # 54
     andi s1, s1, 0x20 # 58
     beq s1, zero, .TESTW3 # 5c

     addi a0, zero, 'o'
     sb a0, 0(s0)

 .TESTW4:
     lb s1, 5(s0)
     andi s1, s1, 0x20
     beq s1, zero, .TESTW4

     addi a0, zero, 't'
     sb a0, 0(s0)

 .TESTW5:
     lb s1, 5(s0)
     andi s1, s1, 0x20
     beq s1, zero, .TESTW5

     addi a0, zero, '!'
     sb a0, 0(s0)

# This program resides in the last 1 MB of flash i.e. 700000 in flash
# Flash Pointer
    li t0, 0x80F08000

# Copy BaseRAM (rbl, 32KB, start from 0x80F08000, i.e. 708000 in flash)
    li a0, 0x80000000  # BaseRAM ptr
    li a1, 0x80008000
copy_baseram:
    lw t1, 0(t0)
    sw t1, 0(a0)
    addi t0, t0, 4
    addi a0, a0, 4
    bne a0, a1, copy_baseram


    lui s0, 0x10000  # serial address         
.TESTW6:
    lb s1, 5(s0)                              
    andi s1, s1, 0x20                         
    beq s1, zero, .TESTW6                     
    # do not write when serial is in used

    addi a0, zero, 'B'                        
    sb a0, 0(s0)                  

# Copy ExtRAM (uCore, 960KB, start from 0x80F10000, i.e. 710000 in flash)
     li a0, 0x80400000
     li a1, 0x804F0000
 copy_extram:
     lw t1, 0(t0)
     sw t1, 0(a0)
     addi t0, t0, 4
     addi a0, a0, 4
     bne a0, a1, copy_extram


    lui s0, 0x10000   
.TESTW7:
    lb s1, 5(s0)                              
    andi s1, s1, 0x20                         
    beq s1, zero, .TESTW7                     

    addi a0, zero, 'D'                        
    sb a0, 0(s0)    

    li a0, 0

.BEGIN_BOOT:
    fence.i

    # rbl boot_first_hart
    li a0, 0
    li a1, 0

    # Return to rbls
    li ra, 0x80000000
    ret