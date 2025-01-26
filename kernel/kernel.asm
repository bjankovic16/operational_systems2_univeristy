
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	88013103          	ld	sp,-1920(sp) # 8000b880 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	1a4000ef          	jal	ra,800001ba <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
// which hart (core) is this?
static inline uint64
r_mhartid()
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec22                	sd	s0,24(sp)
    80000020:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80000022:	f14027f3          	csrr	a5,mhartid
    80000026:	fef43423          	sd	a5,-24(s0)
  return x;
    8000002a:	fe843783          	ld	a5,-24(s0)
}
    8000002e:	853e                	mv	a0,a5
    80000030:	6462                	ld	s0,24(sp)
    80000032:	6105                	addi	sp,sp,32
    80000034:	8082                	ret

0000000080000036 <r_mstatus>:
#define MSTATUS_MPP_U (0L << 11)
#define MSTATUS_MIE (1L << 3)    // machine-mode interrupt enable.

static inline uint64
r_mstatus()
{
    80000036:	1101                	addi	sp,sp,-32
    80000038:	ec22                	sd	s0,24(sp)
    8000003a:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    8000003c:	300027f3          	csrr	a5,mstatus
    80000040:	fef43423          	sd	a5,-24(s0)
  return x;
    80000044:	fe843783          	ld	a5,-24(s0)
}
    80000048:	853e                	mv	a0,a5
    8000004a:	6462                	ld	s0,24(sp)
    8000004c:	6105                	addi	sp,sp,32
    8000004e:	8082                	ret

0000000080000050 <w_mstatus>:

static inline void 
w_mstatus(uint64 x)
{
    80000050:	1101                	addi	sp,sp,-32
    80000052:	ec22                	sd	s0,24(sp)
    80000054:	1000                	addi	s0,sp,32
    80000056:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mstatus, %0" : : "r" (x));
    8000005a:	fe843783          	ld	a5,-24(s0)
    8000005e:	30079073          	csrw	mstatus,a5
}
    80000062:	0001                	nop
    80000064:	6462                	ld	s0,24(sp)
    80000066:	6105                	addi	sp,sp,32
    80000068:	8082                	ret

000000008000006a <w_mepc>:
// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
static inline void 
w_mepc(uint64 x)
{
    8000006a:	1101                	addi	sp,sp,-32
    8000006c:	ec22                	sd	s0,24(sp)
    8000006e:	1000                	addi	s0,sp,32
    80000070:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mepc, %0" : : "r" (x));
    80000074:	fe843783          	ld	a5,-24(s0)
    80000078:	34179073          	csrw	mepc,a5
}
    8000007c:	0001                	nop
    8000007e:	6462                	ld	s0,24(sp)
    80000080:	6105                	addi	sp,sp,32
    80000082:	8082                	ret

0000000080000084 <r_sie>:
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
    80000084:	1101                	addi	sp,sp,-32
    80000086:	ec22                	sd	s0,24(sp)
    80000088:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    8000008a:	104027f3          	csrr	a5,sie
    8000008e:	fef43423          	sd	a5,-24(s0)
  return x;
    80000092:	fe843783          	ld	a5,-24(s0)
}
    80000096:	853e                	mv	a0,a5
    80000098:	6462                	ld	s0,24(sp)
    8000009a:	6105                	addi	sp,sp,32
    8000009c:	8082                	ret

000000008000009e <w_sie>:

static inline void 
w_sie(uint64 x)
{
    8000009e:	1101                	addi	sp,sp,-32
    800000a0:	ec22                	sd	s0,24(sp)
    800000a2:	1000                	addi	s0,sp,32
    800000a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sie, %0" : : "r" (x));
    800000a8:	fe843783          	ld	a5,-24(s0)
    800000ac:	10479073          	csrw	sie,a5
}
    800000b0:	0001                	nop
    800000b2:	6462                	ld	s0,24(sp)
    800000b4:	6105                	addi	sp,sp,32
    800000b6:	8082                	ret

00000000800000b8 <r_mie>:
#define MIE_MEIE (1L << 11) // external
#define MIE_MTIE (1L << 7)  // timer
#define MIE_MSIE (1L << 3)  // software
static inline uint64
r_mie()
{
    800000b8:	1101                	addi	sp,sp,-32
    800000ba:	ec22                	sd	s0,24(sp)
    800000bc:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mie" : "=r" (x) );
    800000be:	304027f3          	csrr	a5,mie
    800000c2:	fef43423          	sd	a5,-24(s0)
  return x;
    800000c6:	fe843783          	ld	a5,-24(s0)
}
    800000ca:	853e                	mv	a0,a5
    800000cc:	6462                	ld	s0,24(sp)
    800000ce:	6105                	addi	sp,sp,32
    800000d0:	8082                	ret

00000000800000d2 <w_mie>:

static inline void 
w_mie(uint64 x)
{
    800000d2:	1101                	addi	sp,sp,-32
    800000d4:	ec22                	sd	s0,24(sp)
    800000d6:	1000                	addi	s0,sp,32
    800000d8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mie, %0" : : "r" (x));
    800000dc:	fe843783          	ld	a5,-24(s0)
    800000e0:	30479073          	csrw	mie,a5
}
    800000e4:	0001                	nop
    800000e6:	6462                	ld	s0,24(sp)
    800000e8:	6105                	addi	sp,sp,32
    800000ea:	8082                	ret

00000000800000ec <w_medeleg>:
  return x;
}

static inline void 
w_medeleg(uint64 x)
{
    800000ec:	1101                	addi	sp,sp,-32
    800000ee:	ec22                	sd	s0,24(sp)
    800000f0:	1000                	addi	s0,sp,32
    800000f2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw medeleg, %0" : : "r" (x));
    800000f6:	fe843783          	ld	a5,-24(s0)
    800000fa:	30279073          	csrw	medeleg,a5
}
    800000fe:	0001                	nop
    80000100:	6462                	ld	s0,24(sp)
    80000102:	6105                	addi	sp,sp,32
    80000104:	8082                	ret

0000000080000106 <w_mideleg>:
  return x;
}

static inline void 
w_mideleg(uint64 x)
{
    80000106:	1101                	addi	sp,sp,-32
    80000108:	ec22                	sd	s0,24(sp)
    8000010a:	1000                	addi	s0,sp,32
    8000010c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80000110:	fe843783          	ld	a5,-24(s0)
    80000114:	30379073          	csrw	mideleg,a5
}
    80000118:	0001                	nop
    8000011a:	6462                	ld	s0,24(sp)
    8000011c:	6105                	addi	sp,sp,32
    8000011e:	8082                	ret

0000000080000120 <w_mtvec>:
}

// Machine-mode interrupt vector
static inline void 
w_mtvec(uint64 x)
{
    80000120:	1101                	addi	sp,sp,-32
    80000122:	ec22                	sd	s0,24(sp)
    80000124:	1000                	addi	s0,sp,32
    80000126:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mtvec, %0" : : "r" (x));
    8000012a:	fe843783          	ld	a5,-24(s0)
    8000012e:	30579073          	csrw	mtvec,a5
}
    80000132:	0001                	nop
    80000134:	6462                	ld	s0,24(sp)
    80000136:	6105                	addi	sp,sp,32
    80000138:	8082                	ret

000000008000013a <w_pmpcfg0>:

static inline void
w_pmpcfg0(uint64 x)
{
    8000013a:	1101                	addi	sp,sp,-32
    8000013c:	ec22                	sd	s0,24(sp)
    8000013e:	1000                	addi	s0,sp,32
    80000140:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
    80000144:	fe843783          	ld	a5,-24(s0)
    80000148:	3a079073          	csrw	pmpcfg0,a5
}
    8000014c:	0001                	nop
    8000014e:	6462                	ld	s0,24(sp)
    80000150:	6105                	addi	sp,sp,32
    80000152:	8082                	ret

0000000080000154 <w_pmpaddr0>:

static inline void
w_pmpaddr0(uint64 x)
{
    80000154:	1101                	addi	sp,sp,-32
    80000156:	ec22                	sd	s0,24(sp)
    80000158:	1000                	addi	s0,sp,32
    8000015a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
    8000015e:	fe843783          	ld	a5,-24(s0)
    80000162:	3b079073          	csrw	pmpaddr0,a5
}
    80000166:	0001                	nop
    80000168:	6462                	ld	s0,24(sp)
    8000016a:	6105                	addi	sp,sp,32
    8000016c:	8082                	ret

000000008000016e <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    8000016e:	1101                	addi	sp,sp,-32
    80000170:	ec22                	sd	s0,24(sp)
    80000172:	1000                	addi	s0,sp,32
    80000174:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80000178:	fe843783          	ld	a5,-24(s0)
    8000017c:	18079073          	csrw	satp,a5
}
    80000180:	0001                	nop
    80000182:	6462                	ld	s0,24(sp)
    80000184:	6105                	addi	sp,sp,32
    80000186:	8082                	ret

0000000080000188 <w_mscratch>:
  asm volatile("csrw sscratch, %0" : : "r" (x));
}

static inline void 
w_mscratch(uint64 x)
{
    80000188:	1101                	addi	sp,sp,-32
    8000018a:	ec22                	sd	s0,24(sp)
    8000018c:	1000                	addi	s0,sp,32
    8000018e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    80000192:	fe843783          	ld	a5,-24(s0)
    80000196:	34079073          	csrw	mscratch,a5
}
    8000019a:	0001                	nop
    8000019c:	6462                	ld	s0,24(sp)
    8000019e:	6105                	addi	sp,sp,32
    800001a0:	8082                	ret

00000000800001a2 <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    800001a2:	1101                	addi	sp,sp,-32
    800001a4:	ec22                	sd	s0,24(sp)
    800001a6:	1000                	addi	s0,sp,32
    800001a8:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    800001ac:	fe843783          	ld	a5,-24(s0)
    800001b0:	823e                	mv	tp,a5
}
    800001b2:	0001                	nop
    800001b4:	6462                	ld	s0,24(sp)
    800001b6:	6105                	addi	sp,sp,32
    800001b8:	8082                	ret

00000000800001ba <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    800001ba:	1101                	addi	sp,sp,-32
    800001bc:	ec06                	sd	ra,24(sp)
    800001be:	e822                	sd	s0,16(sp)
    800001c0:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    800001c2:	00000097          	auipc	ra,0x0
    800001c6:	e74080e7          	jalr	-396(ra) # 80000036 <r_mstatus>
    800001ca:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    800001ce:	fe843703          	ld	a4,-24(s0)
    800001d2:	77f9                	lui	a5,0xffffe
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffd57ff>
    800001d8:	8ff9                	and	a5,a5,a4
    800001da:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    800001de:	fe843703          	ld	a4,-24(s0)
    800001e2:	6785                	lui	a5,0x1
    800001e4:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    800001e8:	8fd9                	or	a5,a5,a4
    800001ea:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    800001ee:	fe843503          	ld	a0,-24(s0)
    800001f2:	00000097          	auipc	ra,0x0
    800001f6:	e5e080e7          	jalr	-418(ra) # 80000050 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    800001fa:	00001797          	auipc	a5,0x1
    800001fe:	5fc78793          	addi	a5,a5,1532 # 800017f6 <main>
    80000202:	853e                	mv	a0,a5
    80000204:	00000097          	auipc	ra,0x0
    80000208:	e66080e7          	jalr	-410(ra) # 8000006a <w_mepc>

  // disable paging for now.
  w_satp(0);
    8000020c:	4501                	li	a0,0
    8000020e:	00000097          	auipc	ra,0x0
    80000212:	f60080e7          	jalr	-160(ra) # 8000016e <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    80000216:	67c1                	lui	a5,0x10
    80000218:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000021c:	00000097          	auipc	ra,0x0
    80000220:	ed0080e7          	jalr	-304(ra) # 800000ec <w_medeleg>
  w_mideleg(0xffff);
    80000224:	67c1                	lui	a5,0x10
    80000226:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000022a:	00000097          	auipc	ra,0x0
    8000022e:	edc080e7          	jalr	-292(ra) # 80000106 <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    80000232:	00000097          	auipc	ra,0x0
    80000236:	e52080e7          	jalr	-430(ra) # 80000084 <r_sie>
    8000023a:	87aa                	mv	a5,a0
    8000023c:	2227e793          	ori	a5,a5,546
    80000240:	853e                	mv	a0,a5
    80000242:	00000097          	auipc	ra,0x0
    80000246:	e5c080e7          	jalr	-420(ra) # 8000009e <w_sie>

  // configure Physical Memory Protection to give supervisor mode
  // access to all of physical memory.
  w_pmpaddr0(0x3fffffffffffffull);
    8000024a:	57fd                	li	a5,-1
    8000024c:	00a7d513          	srli	a0,a5,0xa
    80000250:	00000097          	auipc	ra,0x0
    80000254:	f04080e7          	jalr	-252(ra) # 80000154 <w_pmpaddr0>
  w_pmpcfg0(0xf);
    80000258:	453d                	li	a0,15
    8000025a:	00000097          	auipc	ra,0x0
    8000025e:	ee0080e7          	jalr	-288(ra) # 8000013a <w_pmpcfg0>

  // ask for clock interrupts.
  timerinit();
    80000262:	00000097          	auipc	ra,0x0
    80000266:	032080e7          	jalr	50(ra) # 80000294 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    8000026a:	00000097          	auipc	ra,0x0
    8000026e:	db2080e7          	jalr	-590(ra) # 8000001c <r_mhartid>
    80000272:	87aa                	mv	a5,a0
    80000274:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    80000278:	fe442783          	lw	a5,-28(s0)
    8000027c:	853e                	mv	a0,a5
    8000027e:	00000097          	auipc	ra,0x0
    80000282:	f24080e7          	jalr	-220(ra) # 800001a2 <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    80000286:	30200073          	mret
}
    8000028a:	0001                	nop
    8000028c:	60e2                	ld	ra,24(sp)
    8000028e:	6442                	ld	s0,16(sp)
    80000290:	6105                	addi	sp,sp,32
    80000292:	8082                	ret

0000000080000294 <timerinit>:
// which arrive at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80000294:	1101                	addi	sp,sp,-32
    80000296:	ec06                	sd	ra,24(sp)
    80000298:	e822                	sd	s0,16(sp)
    8000029a:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    8000029c:	00000097          	auipc	ra,0x0
    800002a0:	d80080e7          	jalr	-640(ra) # 8000001c <r_mhartid>
    800002a4:	87aa                	mv	a5,a0
    800002a6:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 1000000; // cycles; about 1/10th second in qemu.
    800002aa:	000f47b7          	lui	a5,0xf4
    800002ae:	2407879b          	addiw	a5,a5,576
    800002b2:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    800002b6:	0200c7b7          	lui	a5,0x200c
    800002ba:	17e1                	addi	a5,a5,-8
    800002bc:	6398                	ld	a4,0(a5)
    800002be:	fe842783          	lw	a5,-24(s0)
    800002c2:	fec42683          	lw	a3,-20(s0)
    800002c6:	0036969b          	slliw	a3,a3,0x3
    800002ca:	2681                	sext.w	a3,a3
    800002cc:	8636                	mv	a2,a3
    800002ce:	020046b7          	lui	a3,0x2004
    800002d2:	96b2                	add	a3,a3,a2
    800002d4:	97ba                	add	a5,a5,a4
    800002d6:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    800002d8:	fec42703          	lw	a4,-20(s0)
    800002dc:	87ba                	mv	a5,a4
    800002de:	078a                	slli	a5,a5,0x2
    800002e0:	97ba                	add	a5,a5,a4
    800002e2:	078e                	slli	a5,a5,0x3
    800002e4:	00014717          	auipc	a4,0x14
    800002e8:	d6c70713          	addi	a4,a4,-660 # 80014050 <timer_scratch>
    800002ec:	97ba                	add	a5,a5,a4
    800002ee:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    800002f2:	fec42783          	lw	a5,-20(s0)
    800002f6:	0037979b          	slliw	a5,a5,0x3
    800002fa:	2781                	sext.w	a5,a5
    800002fc:	873e                	mv	a4,a5
    800002fe:	020047b7          	lui	a5,0x2004
    80000302:	973e                	add	a4,a4,a5
    80000304:	fe043783          	ld	a5,-32(s0)
    80000308:	07e1                	addi	a5,a5,24
    8000030a:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    8000030c:	fe043783          	ld	a5,-32(s0)
    80000310:	02078793          	addi	a5,a5,32 # 2004020 <_entry-0x7dffbfe0>
    80000314:	fe842703          	lw	a4,-24(s0)
    80000318:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    8000031a:	fe043783          	ld	a5,-32(s0)
    8000031e:	853e                	mv	a0,a5
    80000320:	00000097          	auipc	ra,0x0
    80000324:	e68080e7          	jalr	-408(ra) # 80000188 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    80000328:	00009797          	auipc	a5,0x9
    8000032c:	bd878793          	addi	a5,a5,-1064 # 80008f00 <timervec>
    80000330:	853e                	mv	a0,a5
    80000332:	00000097          	auipc	ra,0x0
    80000336:	dee080e7          	jalr	-530(ra) # 80000120 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    8000033a:	00000097          	auipc	ra,0x0
    8000033e:	cfc080e7          	jalr	-772(ra) # 80000036 <r_mstatus>
    80000342:	87aa                	mv	a5,a0
    80000344:	0087e793          	ori	a5,a5,8
    80000348:	853e                	mv	a0,a5
    8000034a:	00000097          	auipc	ra,0x0
    8000034e:	d06080e7          	jalr	-762(ra) # 80000050 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000352:	00000097          	auipc	ra,0x0
    80000356:	d66080e7          	jalr	-666(ra) # 800000b8 <r_mie>
    8000035a:	87aa                	mv	a5,a0
    8000035c:	0807e793          	ori	a5,a5,128
    80000360:	853e                	mv	a0,a5
    80000362:	00000097          	auipc	ra,0x0
    80000366:	d70080e7          	jalr	-656(ra) # 800000d2 <w_mie>
}
    8000036a:	0001                	nop
    8000036c:	60e2                	ld	ra,24(sp)
    8000036e:	6442                	ld	s0,16(sp)
    80000370:	6105                	addi	sp,sp,32
    80000372:	8082                	ret

0000000080000374 <consputc>:
// called by printf, and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    80000374:	1101                	addi	sp,sp,-32
    80000376:	ec06                	sd	ra,24(sp)
    80000378:	e822                	sd	s0,16(sp)
    8000037a:	1000                	addi	s0,sp,32
    8000037c:	87aa                	mv	a5,a0
    8000037e:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    80000382:	fec42783          	lw	a5,-20(s0)
    80000386:	0007871b          	sext.w	a4,a5
    8000038a:	10000793          	li	a5,256
    8000038e:	02f71363          	bne	a4,a5,800003b4 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80000392:	4521                	li	a0,8
    80000394:	00001097          	auipc	ra,0x1
    80000398:	aac080e7          	jalr	-1364(ra) # 80000e40 <uartputc_sync>
    8000039c:	02000513          	li	a0,32
    800003a0:	00001097          	auipc	ra,0x1
    800003a4:	aa0080e7          	jalr	-1376(ra) # 80000e40 <uartputc_sync>
    800003a8:	4521                	li	a0,8
    800003aa:	00001097          	auipc	ra,0x1
    800003ae:	a96080e7          	jalr	-1386(ra) # 80000e40 <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    800003b2:	a801                	j	800003c2 <consputc+0x4e>
    uartputc_sync(c);
    800003b4:	fec42783          	lw	a5,-20(s0)
    800003b8:	853e                	mv	a0,a5
    800003ba:	00001097          	auipc	ra,0x1
    800003be:	a86080e7          	jalr	-1402(ra) # 80000e40 <uartputc_sync>
}
    800003c2:	0001                	nop
    800003c4:	60e2                	ld	ra,24(sp)
    800003c6:	6442                	ld	s0,16(sp)
    800003c8:	6105                	addi	sp,sp,32
    800003ca:	8082                	ret

00000000800003cc <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    800003cc:	7179                	addi	sp,sp,-48
    800003ce:	f406                	sd	ra,40(sp)
    800003d0:	f022                	sd	s0,32(sp)
    800003d2:	1800                	addi	s0,sp,48
    800003d4:	87aa                	mv	a5,a0
    800003d6:	fcb43823          	sd	a1,-48(s0)
    800003da:	8732                	mv	a4,a2
    800003dc:	fcf42e23          	sw	a5,-36(s0)
    800003e0:	87ba                	mv	a5,a4
    800003e2:	fcf42c23          	sw	a5,-40(s0)
  int i;

  for(i = 0; i < n; i++){
    800003e6:	fe042623          	sw	zero,-20(s0)
    800003ea:	a0a1                	j	80000432 <consolewrite+0x66>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    800003ec:	fec42703          	lw	a4,-20(s0)
    800003f0:	fd043783          	ld	a5,-48(s0)
    800003f4:	00f70633          	add	a2,a4,a5
    800003f8:	fdc42703          	lw	a4,-36(s0)
    800003fc:	feb40793          	addi	a5,s0,-21
    80000400:	4685                	li	a3,1
    80000402:	85ba                	mv	a1,a4
    80000404:	853e                	mv	a0,a5
    80000406:	00003097          	auipc	ra,0x3
    8000040a:	796080e7          	jalr	1942(ra) # 80003b9c <either_copyin>
    8000040e:	87aa                	mv	a5,a0
    80000410:	873e                	mv	a4,a5
    80000412:	57fd                	li	a5,-1
    80000414:	02f70863          	beq	a4,a5,80000444 <consolewrite+0x78>
      break;
    uartputc(c);
    80000418:	feb44783          	lbu	a5,-21(s0)
    8000041c:	2781                	sext.w	a5,a5
    8000041e:	853e                	mv	a0,a5
    80000420:	00001097          	auipc	ra,0x1
    80000424:	960080e7          	jalr	-1696(ra) # 80000d80 <uartputc>
  for(i = 0; i < n; i++){
    80000428:	fec42783          	lw	a5,-20(s0)
    8000042c:	2785                	addiw	a5,a5,1
    8000042e:	fef42623          	sw	a5,-20(s0)
    80000432:	fec42703          	lw	a4,-20(s0)
    80000436:	fd842783          	lw	a5,-40(s0)
    8000043a:	2701                	sext.w	a4,a4
    8000043c:	2781                	sext.w	a5,a5
    8000043e:	faf747e3          	blt	a4,a5,800003ec <consolewrite+0x20>
    80000442:	a011                	j	80000446 <consolewrite+0x7a>
      break;
    80000444:	0001                	nop
  }

  return i;
    80000446:	fec42783          	lw	a5,-20(s0)
}
    8000044a:	853e                	mv	a0,a5
    8000044c:	70a2                	ld	ra,40(sp)
    8000044e:	7402                	ld	s0,32(sp)
    80000450:	6145                	addi	sp,sp,48
    80000452:	8082                	ret

0000000080000454 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000454:	7179                	addi	sp,sp,-48
    80000456:	f406                	sd	ra,40(sp)
    80000458:	f022                	sd	s0,32(sp)
    8000045a:	1800                	addi	s0,sp,48
    8000045c:	87aa                	mv	a5,a0
    8000045e:	fcb43823          	sd	a1,-48(s0)
    80000462:	8732                	mv	a4,a2
    80000464:	fcf42e23          	sw	a5,-36(s0)
    80000468:	87ba                	mv	a5,a4
    8000046a:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    8000046e:	fd842783          	lw	a5,-40(s0)
    80000472:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000476:	00014517          	auipc	a0,0x14
    8000047a:	d1a50513          	addi	a0,a0,-742 # 80014190 <cons>
    8000047e:	00001097          	auipc	ra,0x1
    80000482:	df0080e7          	jalr	-528(ra) # 8000126e <acquire>
  while(n > 0){
    80000486:	a215                	j	800005aa <consoleread+0x156>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(myproc()->killed){
    80000488:	00002097          	auipc	ra,0x2
    8000048c:	38c080e7          	jalr	908(ra) # 80002814 <myproc>
    80000490:	87aa                	mv	a5,a0
    80000492:	579c                	lw	a5,40(a5)
    80000494:	cb99                	beqz	a5,800004aa <consoleread+0x56>
        release(&cons.lock);
    80000496:	00014517          	auipc	a0,0x14
    8000049a:	cfa50513          	addi	a0,a0,-774 # 80014190 <cons>
    8000049e:	00001097          	auipc	ra,0x1
    800004a2:	e34080e7          	jalr	-460(ra) # 800012d2 <release>
        return -1;
    800004a6:	57fd                	li	a5,-1
    800004a8:	aa25                	j	800005e0 <consoleread+0x18c>
      }
      sleep(&cons.r, &cons.lock);
    800004aa:	00014597          	auipc	a1,0x14
    800004ae:	ce658593          	addi	a1,a1,-794 # 80014190 <cons>
    800004b2:	00014517          	auipc	a0,0x14
    800004b6:	d7650513          	addi	a0,a0,-650 # 80014228 <cons+0x98>
    800004ba:	00003097          	auipc	ra,0x3
    800004be:	486080e7          	jalr	1158(ra) # 80003940 <sleep>
    while(cons.r == cons.w){
    800004c2:	00014797          	auipc	a5,0x14
    800004c6:	cce78793          	addi	a5,a5,-818 # 80014190 <cons>
    800004ca:	0987a703          	lw	a4,152(a5)
    800004ce:	00014797          	auipc	a5,0x14
    800004d2:	cc278793          	addi	a5,a5,-830 # 80014190 <cons>
    800004d6:	09c7a783          	lw	a5,156(a5)
    800004da:	faf707e3          	beq	a4,a5,80000488 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];
    800004de:	00014797          	auipc	a5,0x14
    800004e2:	cb278793          	addi	a5,a5,-846 # 80014190 <cons>
    800004e6:	0987a783          	lw	a5,152(a5)
    800004ea:	2781                	sext.w	a5,a5
    800004ec:	0017871b          	addiw	a4,a5,1
    800004f0:	0007069b          	sext.w	a3,a4
    800004f4:	00014717          	auipc	a4,0x14
    800004f8:	c9c70713          	addi	a4,a4,-868 # 80014190 <cons>
    800004fc:	08d72c23          	sw	a3,152(a4)
    80000500:	07f7f793          	andi	a5,a5,127
    80000504:	2781                	sext.w	a5,a5
    80000506:	00014717          	auipc	a4,0x14
    8000050a:	c8a70713          	addi	a4,a4,-886 # 80014190 <cons>
    8000050e:	1782                	slli	a5,a5,0x20
    80000510:	9381                	srli	a5,a5,0x20
    80000512:	97ba                	add	a5,a5,a4
    80000514:	0187c783          	lbu	a5,24(a5)
    80000518:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    8000051c:	fe842783          	lw	a5,-24(s0)
    80000520:	0007871b          	sext.w	a4,a5
    80000524:	4791                	li	a5,4
    80000526:	02f71963          	bne	a4,a5,80000558 <consoleread+0x104>
      if(n < target){
    8000052a:	fd842703          	lw	a4,-40(s0)
    8000052e:	fec42783          	lw	a5,-20(s0)
    80000532:	2781                	sext.w	a5,a5
    80000534:	08f77163          	bgeu	a4,a5,800005b6 <consoleread+0x162>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    80000538:	00014797          	auipc	a5,0x14
    8000053c:	c5878793          	addi	a5,a5,-936 # 80014190 <cons>
    80000540:	0987a783          	lw	a5,152(a5)
    80000544:	37fd                	addiw	a5,a5,-1
    80000546:	0007871b          	sext.w	a4,a5
    8000054a:	00014797          	auipc	a5,0x14
    8000054e:	c4678793          	addi	a5,a5,-954 # 80014190 <cons>
    80000552:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    80000556:	a085                	j	800005b6 <consoleread+0x162>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    80000558:	fe842783          	lw	a5,-24(s0)
    8000055c:	0ff7f793          	andi	a5,a5,255
    80000560:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80000564:	fe740713          	addi	a4,s0,-25
    80000568:	fdc42783          	lw	a5,-36(s0)
    8000056c:	4685                	li	a3,1
    8000056e:	863a                	mv	a2,a4
    80000570:	fd043583          	ld	a1,-48(s0)
    80000574:	853e                	mv	a0,a5
    80000576:	00003097          	auipc	ra,0x3
    8000057a:	5b2080e7          	jalr	1458(ra) # 80003b28 <either_copyout>
    8000057e:	87aa                	mv	a5,a0
    80000580:	873e                	mv	a4,a5
    80000582:	57fd                	li	a5,-1
    80000584:	02f70b63          	beq	a4,a5,800005ba <consoleread+0x166>
      break;

    dst++;
    80000588:	fd043783          	ld	a5,-48(s0)
    8000058c:	0785                	addi	a5,a5,1
    8000058e:	fcf43823          	sd	a5,-48(s0)
    --n;
    80000592:	fd842783          	lw	a5,-40(s0)
    80000596:	37fd                	addiw	a5,a5,-1
    80000598:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    8000059c:	fe842783          	lw	a5,-24(s0)
    800005a0:	0007871b          	sext.w	a4,a5
    800005a4:	47a9                	li	a5,10
    800005a6:	00f70c63          	beq	a4,a5,800005be <consoleread+0x16a>
  while(n > 0){
    800005aa:	fd842783          	lw	a5,-40(s0)
    800005ae:	2781                	sext.w	a5,a5
    800005b0:	f0f049e3          	bgtz	a5,800004c2 <consoleread+0x6e>
    800005b4:	a031                	j	800005c0 <consoleread+0x16c>
      break;
    800005b6:	0001                	nop
    800005b8:	a021                	j	800005c0 <consoleread+0x16c>
      break;
    800005ba:	0001                	nop
    800005bc:	a011                	j	800005c0 <consoleread+0x16c>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    800005be:	0001                	nop
    }
  }
  release(&cons.lock);
    800005c0:	00014517          	auipc	a0,0x14
    800005c4:	bd050513          	addi	a0,a0,-1072 # 80014190 <cons>
    800005c8:	00001097          	auipc	ra,0x1
    800005cc:	d0a080e7          	jalr	-758(ra) # 800012d2 <release>

  return target - n;
    800005d0:	fd842783          	lw	a5,-40(s0)
    800005d4:	fec42703          	lw	a4,-20(s0)
    800005d8:	40f707bb          	subw	a5,a4,a5
    800005dc:	2781                	sext.w	a5,a5
    800005de:	2781                	sext.w	a5,a5
}
    800005e0:	853e                	mv	a0,a5
    800005e2:	70a2                	ld	ra,40(sp)
    800005e4:	7402                	ld	s0,32(sp)
    800005e6:	6145                	addi	sp,sp,48
    800005e8:	8082                	ret

00000000800005ea <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    800005ea:	1101                	addi	sp,sp,-32
    800005ec:	ec06                	sd	ra,24(sp)
    800005ee:	e822                	sd	s0,16(sp)
    800005f0:	1000                	addi	s0,sp,32
    800005f2:	87aa                	mv	a5,a0
    800005f4:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    800005f8:	00014517          	auipc	a0,0x14
    800005fc:	b9850513          	addi	a0,a0,-1128 # 80014190 <cons>
    80000600:	00001097          	auipc	ra,0x1
    80000604:	c6e080e7          	jalr	-914(ra) # 8000126e <acquire>

  switch(c){
    80000608:	fec42783          	lw	a5,-20(s0)
    8000060c:	0007871b          	sext.w	a4,a5
    80000610:	07f00793          	li	a5,127
    80000614:	0cf70763          	beq	a4,a5,800006e2 <consoleintr+0xf8>
    80000618:	fec42783          	lw	a5,-20(s0)
    8000061c:	0007871b          	sext.w	a4,a5
    80000620:	07f00793          	li	a5,127
    80000624:	10e7c363          	blt	a5,a4,8000072a <consoleintr+0x140>
    80000628:	fec42783          	lw	a5,-20(s0)
    8000062c:	0007871b          	sext.w	a4,a5
    80000630:	47d5                	li	a5,21
    80000632:	06f70163          	beq	a4,a5,80000694 <consoleintr+0xaa>
    80000636:	fec42783          	lw	a5,-20(s0)
    8000063a:	0007871b          	sext.w	a4,a5
    8000063e:	47d5                	li	a5,21
    80000640:	0ee7c563          	blt	a5,a4,8000072a <consoleintr+0x140>
    80000644:	fec42783          	lw	a5,-20(s0)
    80000648:	0007871b          	sext.w	a4,a5
    8000064c:	47a1                	li	a5,8
    8000064e:	08f70a63          	beq	a4,a5,800006e2 <consoleintr+0xf8>
    80000652:	fec42783          	lw	a5,-20(s0)
    80000656:	0007871b          	sext.w	a4,a5
    8000065a:	47c1                	li	a5,16
    8000065c:	0cf71763          	bne	a4,a5,8000072a <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    80000660:	00003097          	auipc	ra,0x3
    80000664:	5b0080e7          	jalr	1456(ra) # 80003c10 <procdump>
    break;
    80000668:	aac1                	j	80000838 <consoleintr+0x24e>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
      cons.e--;
    8000066a:	00014797          	auipc	a5,0x14
    8000066e:	b2678793          	addi	a5,a5,-1242 # 80014190 <cons>
    80000672:	0a07a783          	lw	a5,160(a5)
    80000676:	37fd                	addiw	a5,a5,-1
    80000678:	0007871b          	sext.w	a4,a5
    8000067c:	00014797          	auipc	a5,0x14
    80000680:	b1478793          	addi	a5,a5,-1260 # 80014190 <cons>
    80000684:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000688:	10000513          	li	a0,256
    8000068c:	00000097          	auipc	ra,0x0
    80000690:	ce8080e7          	jalr	-792(ra) # 80000374 <consputc>
    while(cons.e != cons.w &&
    80000694:	00014797          	auipc	a5,0x14
    80000698:	afc78793          	addi	a5,a5,-1284 # 80014190 <cons>
    8000069c:	0a07a703          	lw	a4,160(a5)
    800006a0:	00014797          	auipc	a5,0x14
    800006a4:	af078793          	addi	a5,a5,-1296 # 80014190 <cons>
    800006a8:	09c7a783          	lw	a5,156(a5)
    800006ac:	18f70163          	beq	a4,a5,8000082e <consoleintr+0x244>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    800006b0:	00014797          	auipc	a5,0x14
    800006b4:	ae078793          	addi	a5,a5,-1312 # 80014190 <cons>
    800006b8:	0a07a783          	lw	a5,160(a5)
    800006bc:	37fd                	addiw	a5,a5,-1
    800006be:	2781                	sext.w	a5,a5
    800006c0:	07f7f793          	andi	a5,a5,127
    800006c4:	2781                	sext.w	a5,a5
    800006c6:	00014717          	auipc	a4,0x14
    800006ca:	aca70713          	addi	a4,a4,-1334 # 80014190 <cons>
    800006ce:	1782                	slli	a5,a5,0x20
    800006d0:	9381                	srli	a5,a5,0x20
    800006d2:	97ba                	add	a5,a5,a4
    800006d4:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    800006d8:	873e                	mv	a4,a5
    800006da:	47a9                	li	a5,10
    800006dc:	f8f717e3          	bne	a4,a5,8000066a <consoleintr+0x80>
    }
    break;
    800006e0:	a2b9                	j	8000082e <consoleintr+0x244>
  case C('H'): // Backspace
  case '\x7f':
    if(cons.e != cons.w){
    800006e2:	00014797          	auipc	a5,0x14
    800006e6:	aae78793          	addi	a5,a5,-1362 # 80014190 <cons>
    800006ea:	0a07a703          	lw	a4,160(a5)
    800006ee:	00014797          	auipc	a5,0x14
    800006f2:	aa278793          	addi	a5,a5,-1374 # 80014190 <cons>
    800006f6:	09c7a783          	lw	a5,156(a5)
    800006fa:	12f70c63          	beq	a4,a5,80000832 <consoleintr+0x248>
      cons.e--;
    800006fe:	00014797          	auipc	a5,0x14
    80000702:	a9278793          	addi	a5,a5,-1390 # 80014190 <cons>
    80000706:	0a07a783          	lw	a5,160(a5)
    8000070a:	37fd                	addiw	a5,a5,-1
    8000070c:	0007871b          	sext.w	a4,a5
    80000710:	00014797          	auipc	a5,0x14
    80000714:	a8078793          	addi	a5,a5,-1408 # 80014190 <cons>
    80000718:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    8000071c:	10000513          	li	a0,256
    80000720:	00000097          	auipc	ra,0x0
    80000724:	c54080e7          	jalr	-940(ra) # 80000374 <consputc>
    }
    break;
    80000728:	a229                	j	80000832 <consoleintr+0x248>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    8000072a:	fec42783          	lw	a5,-20(s0)
    8000072e:	2781                	sext.w	a5,a5
    80000730:	10078363          	beqz	a5,80000836 <consoleintr+0x24c>
    80000734:	00014797          	auipc	a5,0x14
    80000738:	a5c78793          	addi	a5,a5,-1444 # 80014190 <cons>
    8000073c:	0a07a703          	lw	a4,160(a5)
    80000740:	00014797          	auipc	a5,0x14
    80000744:	a5078793          	addi	a5,a5,-1456 # 80014190 <cons>
    80000748:	0987a783          	lw	a5,152(a5)
    8000074c:	40f707bb          	subw	a5,a4,a5
    80000750:	2781                	sext.w	a5,a5
    80000752:	873e                	mv	a4,a5
    80000754:	07f00793          	li	a5,127
    80000758:	0ce7ef63          	bltu	a5,a4,80000836 <consoleintr+0x24c>
      c = (c == '\r') ? '\n' : c;
    8000075c:	fec42783          	lw	a5,-20(s0)
    80000760:	0007871b          	sext.w	a4,a5
    80000764:	47b5                	li	a5,13
    80000766:	00f70563          	beq	a4,a5,80000770 <consoleintr+0x186>
    8000076a:	fec42783          	lw	a5,-20(s0)
    8000076e:	a011                	j	80000772 <consoleintr+0x188>
    80000770:	47a9                	li	a5,10
    80000772:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    80000776:	fec42783          	lw	a5,-20(s0)
    8000077a:	853e                	mv	a0,a5
    8000077c:	00000097          	auipc	ra,0x0
    80000780:	bf8080e7          	jalr	-1032(ra) # 80000374 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80000784:	00014797          	auipc	a5,0x14
    80000788:	a0c78793          	addi	a5,a5,-1524 # 80014190 <cons>
    8000078c:	0a07a783          	lw	a5,160(a5)
    80000790:	2781                	sext.w	a5,a5
    80000792:	0017871b          	addiw	a4,a5,1
    80000796:	0007069b          	sext.w	a3,a4
    8000079a:	00014717          	auipc	a4,0x14
    8000079e:	9f670713          	addi	a4,a4,-1546 # 80014190 <cons>
    800007a2:	0ad72023          	sw	a3,160(a4)
    800007a6:	07f7f793          	andi	a5,a5,127
    800007aa:	2781                	sext.w	a5,a5
    800007ac:	fec42703          	lw	a4,-20(s0)
    800007b0:	0ff77713          	andi	a4,a4,255
    800007b4:	00014697          	auipc	a3,0x14
    800007b8:	9dc68693          	addi	a3,a3,-1572 # 80014190 <cons>
    800007bc:	1782                	slli	a5,a5,0x20
    800007be:	9381                	srli	a5,a5,0x20
    800007c0:	97b6                	add	a5,a5,a3
    800007c2:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    800007c6:	fec42783          	lw	a5,-20(s0)
    800007ca:	0007871b          	sext.w	a4,a5
    800007ce:	47a9                	li	a5,10
    800007d0:	02f70a63          	beq	a4,a5,80000804 <consoleintr+0x21a>
    800007d4:	fec42783          	lw	a5,-20(s0)
    800007d8:	0007871b          	sext.w	a4,a5
    800007dc:	4791                	li	a5,4
    800007de:	02f70363          	beq	a4,a5,80000804 <consoleintr+0x21a>
    800007e2:	00014797          	auipc	a5,0x14
    800007e6:	9ae78793          	addi	a5,a5,-1618 # 80014190 <cons>
    800007ea:	0a07a703          	lw	a4,160(a5)
    800007ee:	00014797          	auipc	a5,0x14
    800007f2:	9a278793          	addi	a5,a5,-1630 # 80014190 <cons>
    800007f6:	0987a783          	lw	a5,152(a5)
    800007fa:	0807879b          	addiw	a5,a5,128
    800007fe:	2781                	sext.w	a5,a5
    80000800:	02f71b63          	bne	a4,a5,80000836 <consoleintr+0x24c>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000804:	00014797          	auipc	a5,0x14
    80000808:	98c78793          	addi	a5,a5,-1652 # 80014190 <cons>
    8000080c:	0a07a703          	lw	a4,160(a5)
    80000810:	00014797          	auipc	a5,0x14
    80000814:	98078793          	addi	a5,a5,-1664 # 80014190 <cons>
    80000818:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000081c:	00014517          	auipc	a0,0x14
    80000820:	a0c50513          	addi	a0,a0,-1524 # 80014228 <cons+0x98>
    80000824:	00003097          	auipc	ra,0x3
    80000828:	198080e7          	jalr	408(ra) # 800039bc <wakeup>
      }
    }
    break;
    8000082c:	a029                	j	80000836 <consoleintr+0x24c>
    break;
    8000082e:	0001                	nop
    80000830:	a021                	j	80000838 <consoleintr+0x24e>
    break;
    80000832:	0001                	nop
    80000834:	a011                	j	80000838 <consoleintr+0x24e>
    break;
    80000836:	0001                	nop
  }
  
  release(&cons.lock);
    80000838:	00014517          	auipc	a0,0x14
    8000083c:	95850513          	addi	a0,a0,-1704 # 80014190 <cons>
    80000840:	00001097          	auipc	ra,0x1
    80000844:	a92080e7          	jalr	-1390(ra) # 800012d2 <release>
}
    80000848:	0001                	nop
    8000084a:	60e2                	ld	ra,24(sp)
    8000084c:	6442                	ld	s0,16(sp)
    8000084e:	6105                	addi	sp,sp,32
    80000850:	8082                	ret

0000000080000852 <consoleinit>:

void
consoleinit(void)
{
    80000852:	1141                	addi	sp,sp,-16
    80000854:	e406                	sd	ra,8(sp)
    80000856:	e022                	sd	s0,0(sp)
    80000858:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    8000085a:	0000a597          	auipc	a1,0xa
    8000085e:	7a658593          	addi	a1,a1,1958 # 8000b000 <etext>
    80000862:	00014517          	auipc	a0,0x14
    80000866:	92e50513          	addi	a0,a0,-1746 # 80014190 <cons>
    8000086a:	00001097          	auipc	ra,0x1
    8000086e:	9d4080e7          	jalr	-1580(ra) # 8000123e <initlock>

  uartinit();
    80000872:	00000097          	auipc	ra,0x0
    80000876:	494080e7          	jalr	1172(ra) # 80000d06 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8000087a:	00024797          	auipc	a5,0x24
    8000087e:	2b678793          	addi	a5,a5,694 # 80024b30 <devsw>
    80000882:	00000717          	auipc	a4,0x0
    80000886:	bd270713          	addi	a4,a4,-1070 # 80000454 <consoleread>
    8000088a:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000088c:	00024797          	auipc	a5,0x24
    80000890:	2a478793          	addi	a5,a5,676 # 80024b30 <devsw>
    80000894:	00000717          	auipc	a4,0x0
    80000898:	b3870713          	addi	a4,a4,-1224 # 800003cc <consolewrite>
    8000089c:	ef98                	sd	a4,24(a5)
}
    8000089e:	0001                	nop
    800008a0:	60a2                	ld	ra,8(sp)
    800008a2:	6402                	ld	s0,0(sp)
    800008a4:	0141                	addi	sp,sp,16
    800008a6:	8082                	ret

00000000800008a8 <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    800008a8:	7139                	addi	sp,sp,-64
    800008aa:	fc06                	sd	ra,56(sp)
    800008ac:	f822                	sd	s0,48(sp)
    800008ae:	0080                	addi	s0,sp,64
    800008b0:	87aa                	mv	a5,a0
    800008b2:	86ae                	mv	a3,a1
    800008b4:	8732                	mv	a4,a2
    800008b6:	fcf42623          	sw	a5,-52(s0)
    800008ba:	87b6                	mv	a5,a3
    800008bc:	fcf42423          	sw	a5,-56(s0)
    800008c0:	87ba                	mv	a5,a4
    800008c2:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    800008c6:	fc442783          	lw	a5,-60(s0)
    800008ca:	2781                	sext.w	a5,a5
    800008cc:	c78d                	beqz	a5,800008f6 <printint+0x4e>
    800008ce:	fcc42783          	lw	a5,-52(s0)
    800008d2:	01f7d79b          	srliw	a5,a5,0x1f
    800008d6:	0ff7f793          	andi	a5,a5,255
    800008da:	fcf42223          	sw	a5,-60(s0)
    800008de:	fc442783          	lw	a5,-60(s0)
    800008e2:	2781                	sext.w	a5,a5
    800008e4:	cb89                	beqz	a5,800008f6 <printint+0x4e>
    x = -xx;
    800008e6:	fcc42783          	lw	a5,-52(s0)
    800008ea:	40f007bb          	negw	a5,a5
    800008ee:	2781                	sext.w	a5,a5
    800008f0:	fef42423          	sw	a5,-24(s0)
    800008f4:	a029                	j	800008fe <printint+0x56>
  else
    x = xx;
    800008f6:	fcc42783          	lw	a5,-52(s0)
    800008fa:	fef42423          	sw	a5,-24(s0)

  i = 0;
    800008fe:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    80000902:	fc842783          	lw	a5,-56(s0)
    80000906:	fe842703          	lw	a4,-24(s0)
    8000090a:	02f777bb          	remuw	a5,a4,a5
    8000090e:	0007861b          	sext.w	a2,a5
    80000912:	fec42783          	lw	a5,-20(s0)
    80000916:	0017871b          	addiw	a4,a5,1
    8000091a:	fee42623          	sw	a4,-20(s0)
    8000091e:	0000b697          	auipc	a3,0xb
    80000922:	e2268693          	addi	a3,a3,-478 # 8000b740 <digits>
    80000926:	02061713          	slli	a4,a2,0x20
    8000092a:	9301                	srli	a4,a4,0x20
    8000092c:	9736                	add	a4,a4,a3
    8000092e:	00074703          	lbu	a4,0(a4)
    80000932:	ff040693          	addi	a3,s0,-16
    80000936:	97b6                	add	a5,a5,a3
    80000938:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    8000093c:	fc842783          	lw	a5,-56(s0)
    80000940:	fe842703          	lw	a4,-24(s0)
    80000944:	02f757bb          	divuw	a5,a4,a5
    80000948:	fef42423          	sw	a5,-24(s0)
    8000094c:	fe842783          	lw	a5,-24(s0)
    80000950:	2781                	sext.w	a5,a5
    80000952:	fbc5                	bnez	a5,80000902 <printint+0x5a>

  if(sign)
    80000954:	fc442783          	lw	a5,-60(s0)
    80000958:	2781                	sext.w	a5,a5
    8000095a:	cf85                	beqz	a5,80000992 <printint+0xea>
    buf[i++] = '-';
    8000095c:	fec42783          	lw	a5,-20(s0)
    80000960:	0017871b          	addiw	a4,a5,1
    80000964:	fee42623          	sw	a4,-20(s0)
    80000968:	ff040713          	addi	a4,s0,-16
    8000096c:	97ba                	add	a5,a5,a4
    8000096e:	02d00713          	li	a4,45
    80000972:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    80000976:	a831                	j	80000992 <printint+0xea>
    consputc(buf[i]);
    80000978:	fec42783          	lw	a5,-20(s0)
    8000097c:	ff040713          	addi	a4,s0,-16
    80000980:	97ba                	add	a5,a5,a4
    80000982:	fe87c783          	lbu	a5,-24(a5)
    80000986:	2781                	sext.w	a5,a5
    80000988:	853e                	mv	a0,a5
    8000098a:	00000097          	auipc	ra,0x0
    8000098e:	9ea080e7          	jalr	-1558(ra) # 80000374 <consputc>
  while(--i >= 0)
    80000992:	fec42783          	lw	a5,-20(s0)
    80000996:	37fd                	addiw	a5,a5,-1
    80000998:	fef42623          	sw	a5,-20(s0)
    8000099c:	fec42783          	lw	a5,-20(s0)
    800009a0:	2781                	sext.w	a5,a5
    800009a2:	fc07dbe3          	bgez	a5,80000978 <printint+0xd0>
}
    800009a6:	0001                	nop
    800009a8:	0001                	nop
    800009aa:	70e2                	ld	ra,56(sp)
    800009ac:	7442                	ld	s0,48(sp)
    800009ae:	6121                	addi	sp,sp,64
    800009b0:	8082                	ret

00000000800009b2 <printptr>:

static void
printptr(uint64 x)
{
    800009b2:	7179                	addi	sp,sp,-48
    800009b4:	f406                	sd	ra,40(sp)
    800009b6:	f022                	sd	s0,32(sp)
    800009b8:	1800                	addi	s0,sp,48
    800009ba:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    800009be:	03000513          	li	a0,48
    800009c2:	00000097          	auipc	ra,0x0
    800009c6:	9b2080e7          	jalr	-1614(ra) # 80000374 <consputc>
  consputc('x');
    800009ca:	07800513          	li	a0,120
    800009ce:	00000097          	auipc	ra,0x0
    800009d2:	9a6080e7          	jalr	-1626(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009d6:	fe042623          	sw	zero,-20(s0)
    800009da:	a81d                	j	80000a10 <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    800009dc:	fd843783          	ld	a5,-40(s0)
    800009e0:	93f1                	srli	a5,a5,0x3c
    800009e2:	0000b717          	auipc	a4,0xb
    800009e6:	d5e70713          	addi	a4,a4,-674 # 8000b740 <digits>
    800009ea:	97ba                	add	a5,a5,a4
    800009ec:	0007c783          	lbu	a5,0(a5)
    800009f0:	2781                	sext.w	a5,a5
    800009f2:	853e                	mv	a0,a5
    800009f4:	00000097          	auipc	ra,0x0
    800009f8:	980080e7          	jalr	-1664(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009fc:	fec42783          	lw	a5,-20(s0)
    80000a00:	2785                	addiw	a5,a5,1
    80000a02:	fef42623          	sw	a5,-20(s0)
    80000a06:	fd843783          	ld	a5,-40(s0)
    80000a0a:	0792                	slli	a5,a5,0x4
    80000a0c:	fcf43c23          	sd	a5,-40(s0)
    80000a10:	fec42783          	lw	a5,-20(s0)
    80000a14:	873e                	mv	a4,a5
    80000a16:	47bd                	li	a5,15
    80000a18:	fce7f2e3          	bgeu	a5,a4,800009dc <printptr+0x2a>
}
    80000a1c:	0001                	nop
    80000a1e:	0001                	nop
    80000a20:	70a2                	ld	ra,40(sp)
    80000a22:	7402                	ld	s0,32(sp)
    80000a24:	6145                	addi	sp,sp,48
    80000a26:	8082                	ret

0000000080000a28 <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    80000a28:	7119                	addi	sp,sp,-128
    80000a2a:	fc06                	sd	ra,56(sp)
    80000a2c:	f822                	sd	s0,48(sp)
    80000a2e:	0080                	addi	s0,sp,64
    80000a30:	fca43423          	sd	a0,-56(s0)
    80000a34:	e40c                	sd	a1,8(s0)
    80000a36:	e810                	sd	a2,16(s0)
    80000a38:	ec14                	sd	a3,24(s0)
    80000a3a:	f018                	sd	a4,32(s0)
    80000a3c:	f41c                	sd	a5,40(s0)
    80000a3e:	03043823          	sd	a6,48(s0)
    80000a42:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a46:	00013797          	auipc	a5,0x13
    80000a4a:	7f278793          	addi	a5,a5,2034 # 80014238 <pr>
    80000a4e:	4f9c                	lw	a5,24(a5)
    80000a50:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a54:	fdc42783          	lw	a5,-36(s0)
    80000a58:	2781                	sext.w	a5,a5
    80000a5a:	cb89                	beqz	a5,80000a6c <printf+0x44>
    acquire(&pr.lock);
    80000a5c:	00013517          	auipc	a0,0x13
    80000a60:	7dc50513          	addi	a0,a0,2012 # 80014238 <pr>
    80000a64:	00001097          	auipc	ra,0x1
    80000a68:	80a080e7          	jalr	-2038(ra) # 8000126e <acquire>

  if (fmt == 0)
    80000a6c:	fc843783          	ld	a5,-56(s0)
    80000a70:	eb89                	bnez	a5,80000a82 <printf+0x5a>
    panic("null fmt");
    80000a72:	0000a517          	auipc	a0,0xa
    80000a76:	59650513          	addi	a0,a0,1430 # 8000b008 <etext+0x8>
    80000a7a:	00000097          	auipc	ra,0x0
    80000a7e:	204080e7          	jalr	516(ra) # 80000c7e <panic>

  va_start(ap, fmt);
    80000a82:	04040793          	addi	a5,s0,64
    80000a86:	fcf43023          	sd	a5,-64(s0)
    80000a8a:	fc043783          	ld	a5,-64(s0)
    80000a8e:	fc878793          	addi	a5,a5,-56
    80000a92:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000a96:	fe042623          	sw	zero,-20(s0)
    80000a9a:	a24d                	j	80000c3c <printf+0x214>
    if(c != '%'){
    80000a9c:	fd842783          	lw	a5,-40(s0)
    80000aa0:	0007871b          	sext.w	a4,a5
    80000aa4:	02500793          	li	a5,37
    80000aa8:	00f70a63          	beq	a4,a5,80000abc <printf+0x94>
      consputc(c);
    80000aac:	fd842783          	lw	a5,-40(s0)
    80000ab0:	853e                	mv	a0,a5
    80000ab2:	00000097          	auipc	ra,0x0
    80000ab6:	8c2080e7          	jalr	-1854(ra) # 80000374 <consputc>
      continue;
    80000aba:	aaa5                	j	80000c32 <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000abc:	fec42783          	lw	a5,-20(s0)
    80000ac0:	2785                	addiw	a5,a5,1
    80000ac2:	fef42623          	sw	a5,-20(s0)
    80000ac6:	fec42783          	lw	a5,-20(s0)
    80000aca:	fc843703          	ld	a4,-56(s0)
    80000ace:	97ba                	add	a5,a5,a4
    80000ad0:	0007c783          	lbu	a5,0(a5)
    80000ad4:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000ad8:	fd842783          	lw	a5,-40(s0)
    80000adc:	2781                	sext.w	a5,a5
    80000ade:	16078e63          	beqz	a5,80000c5a <printf+0x232>
      break;
    switch(c){
    80000ae2:	fd842783          	lw	a5,-40(s0)
    80000ae6:	0007871b          	sext.w	a4,a5
    80000aea:	07800793          	li	a5,120
    80000aee:	08f70963          	beq	a4,a5,80000b80 <printf+0x158>
    80000af2:	fd842783          	lw	a5,-40(s0)
    80000af6:	0007871b          	sext.w	a4,a5
    80000afa:	07800793          	li	a5,120
    80000afe:	10e7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b02:	fd842783          	lw	a5,-40(s0)
    80000b06:	0007871b          	sext.w	a4,a5
    80000b0a:	07300793          	li	a5,115
    80000b0e:	0af70563          	beq	a4,a5,80000bb8 <printf+0x190>
    80000b12:	fd842783          	lw	a5,-40(s0)
    80000b16:	0007871b          	sext.w	a4,a5
    80000b1a:	07300793          	li	a5,115
    80000b1e:	0ee7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b22:	fd842783          	lw	a5,-40(s0)
    80000b26:	0007871b          	sext.w	a4,a5
    80000b2a:	07000793          	li	a5,112
    80000b2e:	06f70863          	beq	a4,a5,80000b9e <printf+0x176>
    80000b32:	fd842783          	lw	a5,-40(s0)
    80000b36:	0007871b          	sext.w	a4,a5
    80000b3a:	07000793          	li	a5,112
    80000b3e:	0ce7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b42:	fd842783          	lw	a5,-40(s0)
    80000b46:	0007871b          	sext.w	a4,a5
    80000b4a:	02500793          	li	a5,37
    80000b4e:	0af70d63          	beq	a4,a5,80000c08 <printf+0x1e0>
    80000b52:	fd842783          	lw	a5,-40(s0)
    80000b56:	0007871b          	sext.w	a4,a5
    80000b5a:	06400793          	li	a5,100
    80000b5e:	0af71c63          	bne	a4,a5,80000c16 <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000b62:	fd043783          	ld	a5,-48(s0)
    80000b66:	00878713          	addi	a4,a5,8
    80000b6a:	fce43823          	sd	a4,-48(s0)
    80000b6e:	439c                	lw	a5,0(a5)
    80000b70:	4605                	li	a2,1
    80000b72:	45a9                	li	a1,10
    80000b74:	853e                	mv	a0,a5
    80000b76:	00000097          	auipc	ra,0x0
    80000b7a:	d32080e7          	jalr	-718(ra) # 800008a8 <printint>
      break;
    80000b7e:	a855                	j	80000c32 <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000b80:	fd043783          	ld	a5,-48(s0)
    80000b84:	00878713          	addi	a4,a5,8
    80000b88:	fce43823          	sd	a4,-48(s0)
    80000b8c:	439c                	lw	a5,0(a5)
    80000b8e:	4605                	li	a2,1
    80000b90:	45c1                	li	a1,16
    80000b92:	853e                	mv	a0,a5
    80000b94:	00000097          	auipc	ra,0x0
    80000b98:	d14080e7          	jalr	-748(ra) # 800008a8 <printint>
      break;
    80000b9c:	a859                	j	80000c32 <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000b9e:	fd043783          	ld	a5,-48(s0)
    80000ba2:	00878713          	addi	a4,a5,8
    80000ba6:	fce43823          	sd	a4,-48(s0)
    80000baa:	639c                	ld	a5,0(a5)
    80000bac:	853e                	mv	a0,a5
    80000bae:	00000097          	auipc	ra,0x0
    80000bb2:	e04080e7          	jalr	-508(ra) # 800009b2 <printptr>
      break;
    80000bb6:	a8b5                	j	80000c32 <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000bb8:	fd043783          	ld	a5,-48(s0)
    80000bbc:	00878713          	addi	a4,a5,8
    80000bc0:	fce43823          	sd	a4,-48(s0)
    80000bc4:	639c                	ld	a5,0(a5)
    80000bc6:	fef43023          	sd	a5,-32(s0)
    80000bca:	fe043783          	ld	a5,-32(s0)
    80000bce:	e79d                	bnez	a5,80000bfc <printf+0x1d4>
        s = "(null)";
    80000bd0:	0000a797          	auipc	a5,0xa
    80000bd4:	44878793          	addi	a5,a5,1096 # 8000b018 <etext+0x18>
    80000bd8:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000bdc:	a005                	j	80000bfc <printf+0x1d4>
        consputc(*s);
    80000bde:	fe043783          	ld	a5,-32(s0)
    80000be2:	0007c783          	lbu	a5,0(a5)
    80000be6:	2781                	sext.w	a5,a5
    80000be8:	853e                	mv	a0,a5
    80000bea:	fffff097          	auipc	ra,0xfffff
    80000bee:	78a080e7          	jalr	1930(ra) # 80000374 <consputc>
      for(; *s; s++)
    80000bf2:	fe043783          	ld	a5,-32(s0)
    80000bf6:	0785                	addi	a5,a5,1
    80000bf8:	fef43023          	sd	a5,-32(s0)
    80000bfc:	fe043783          	ld	a5,-32(s0)
    80000c00:	0007c783          	lbu	a5,0(a5)
    80000c04:	ffe9                	bnez	a5,80000bde <printf+0x1b6>
      break;
    80000c06:	a035                	j	80000c32 <printf+0x20a>
    case '%':
      consputc('%');
    80000c08:	02500513          	li	a0,37
    80000c0c:	fffff097          	auipc	ra,0xfffff
    80000c10:	768080e7          	jalr	1896(ra) # 80000374 <consputc>
      break;
    80000c14:	a839                	j	80000c32 <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000c16:	02500513          	li	a0,37
    80000c1a:	fffff097          	auipc	ra,0xfffff
    80000c1e:	75a080e7          	jalr	1882(ra) # 80000374 <consputc>
      consputc(c);
    80000c22:	fd842783          	lw	a5,-40(s0)
    80000c26:	853e                	mv	a0,a5
    80000c28:	fffff097          	auipc	ra,0xfffff
    80000c2c:	74c080e7          	jalr	1868(ra) # 80000374 <consputc>
      break;
    80000c30:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c32:	fec42783          	lw	a5,-20(s0)
    80000c36:	2785                	addiw	a5,a5,1
    80000c38:	fef42623          	sw	a5,-20(s0)
    80000c3c:	fec42783          	lw	a5,-20(s0)
    80000c40:	fc843703          	ld	a4,-56(s0)
    80000c44:	97ba                	add	a5,a5,a4
    80000c46:	0007c783          	lbu	a5,0(a5)
    80000c4a:	fcf42c23          	sw	a5,-40(s0)
    80000c4e:	fd842783          	lw	a5,-40(s0)
    80000c52:	2781                	sext.w	a5,a5
    80000c54:	e40794e3          	bnez	a5,80000a9c <printf+0x74>
    80000c58:	a011                	j	80000c5c <printf+0x234>
      break;
    80000c5a:	0001                	nop
    }
  }

  if(locking)
    80000c5c:	fdc42783          	lw	a5,-36(s0)
    80000c60:	2781                	sext.w	a5,a5
    80000c62:	cb89                	beqz	a5,80000c74 <printf+0x24c>
    release(&pr.lock);
    80000c64:	00013517          	auipc	a0,0x13
    80000c68:	5d450513          	addi	a0,a0,1492 # 80014238 <pr>
    80000c6c:	00000097          	auipc	ra,0x0
    80000c70:	666080e7          	jalr	1638(ra) # 800012d2 <release>
}
    80000c74:	0001                	nop
    80000c76:	70e2                	ld	ra,56(sp)
    80000c78:	7442                	ld	s0,48(sp)
    80000c7a:	6109                	addi	sp,sp,128
    80000c7c:	8082                	ret

0000000080000c7e <panic>:

void
panic(char *s)
{
    80000c7e:	1101                	addi	sp,sp,-32
    80000c80:	ec06                	sd	ra,24(sp)
    80000c82:	e822                	sd	s0,16(sp)
    80000c84:	1000                	addi	s0,sp,32
    80000c86:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000c8a:	00013797          	auipc	a5,0x13
    80000c8e:	5ae78793          	addi	a5,a5,1454 # 80014238 <pr>
    80000c92:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000c96:	0000a517          	auipc	a0,0xa
    80000c9a:	38a50513          	addi	a0,a0,906 # 8000b020 <etext+0x20>
    80000c9e:	00000097          	auipc	ra,0x0
    80000ca2:	d8a080e7          	jalr	-630(ra) # 80000a28 <printf>
  printf(s);
    80000ca6:	fe843503          	ld	a0,-24(s0)
    80000caa:	00000097          	auipc	ra,0x0
    80000cae:	d7e080e7          	jalr	-642(ra) # 80000a28 <printf>
  printf("\n");
    80000cb2:	0000a517          	auipc	a0,0xa
    80000cb6:	37650513          	addi	a0,a0,886 # 8000b028 <etext+0x28>
    80000cba:	00000097          	auipc	ra,0x0
    80000cbe:	d6e080e7          	jalr	-658(ra) # 80000a28 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000cc2:	0000b797          	auipc	a5,0xb
    80000cc6:	33e78793          	addi	a5,a5,830 # 8000c000 <panicked>
    80000cca:	4705                	li	a4,1
    80000ccc:	c398                	sw	a4,0(a5)
  for(;;)
    80000cce:	a001                	j	80000cce <panic+0x50>

0000000080000cd0 <printfinit>:
    ;
}

void
printfinit(void)
{
    80000cd0:	1141                	addi	sp,sp,-16
    80000cd2:	e406                	sd	ra,8(sp)
    80000cd4:	e022                	sd	s0,0(sp)
    80000cd6:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000cd8:	0000a597          	auipc	a1,0xa
    80000cdc:	35858593          	addi	a1,a1,856 # 8000b030 <etext+0x30>
    80000ce0:	00013517          	auipc	a0,0x13
    80000ce4:	55850513          	addi	a0,a0,1368 # 80014238 <pr>
    80000ce8:	00000097          	auipc	ra,0x0
    80000cec:	556080e7          	jalr	1366(ra) # 8000123e <initlock>
  pr.locking = 1;
    80000cf0:	00013797          	auipc	a5,0x13
    80000cf4:	54878793          	addi	a5,a5,1352 # 80014238 <pr>
    80000cf8:	4705                	li	a4,1
    80000cfa:	cf98                	sw	a4,24(a5)
}
    80000cfc:	0001                	nop
    80000cfe:	60a2                	ld	ra,8(sp)
    80000d00:	6402                	ld	s0,0(sp)
    80000d02:	0141                	addi	sp,sp,16
    80000d04:	8082                	ret

0000000080000d06 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000d06:	1141                	addi	sp,sp,-16
    80000d08:	e406                	sd	ra,8(sp)
    80000d0a:	e022                	sd	s0,0(sp)
    80000d0c:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000d0e:	100007b7          	lui	a5,0x10000
    80000d12:	0785                	addi	a5,a5,1
    80000d14:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000d18:	100007b7          	lui	a5,0x10000
    80000d1c:	078d                	addi	a5,a5,3
    80000d1e:	f8000713          	li	a4,-128
    80000d22:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000d26:	100007b7          	lui	a5,0x10000
    80000d2a:	470d                	li	a4,3
    80000d2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000d30:	100007b7          	lui	a5,0x10000
    80000d34:	0785                	addi	a5,a5,1
    80000d36:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000d3a:	100007b7          	lui	a5,0x10000
    80000d3e:	078d                	addi	a5,a5,3
    80000d40:	470d                	li	a4,3
    80000d42:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000d46:	100007b7          	lui	a5,0x10000
    80000d4a:	0789                	addi	a5,a5,2
    80000d4c:	471d                	li	a4,7
    80000d4e:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000d52:	100007b7          	lui	a5,0x10000
    80000d56:	0785                	addi	a5,a5,1
    80000d58:	470d                	li	a4,3
    80000d5a:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  initlock(&uart_tx_lock, "uart");
    80000d5e:	0000a597          	auipc	a1,0xa
    80000d62:	2da58593          	addi	a1,a1,730 # 8000b038 <etext+0x38>
    80000d66:	00013517          	auipc	a0,0x13
    80000d6a:	4f250513          	addi	a0,a0,1266 # 80014258 <uart_tx_lock>
    80000d6e:	00000097          	auipc	ra,0x0
    80000d72:	4d0080e7          	jalr	1232(ra) # 8000123e <initlock>
}
    80000d76:	0001                	nop
    80000d78:	60a2                	ld	ra,8(sp)
    80000d7a:	6402                	ld	s0,0(sp)
    80000d7c:	0141                	addi	sp,sp,16
    80000d7e:	8082                	ret

0000000080000d80 <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000d80:	1101                	addi	sp,sp,-32
    80000d82:	ec06                	sd	ra,24(sp)
    80000d84:	e822                	sd	s0,16(sp)
    80000d86:	1000                	addi	s0,sp,32
    80000d88:	87aa                	mv	a5,a0
    80000d8a:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000d8e:	00013517          	auipc	a0,0x13
    80000d92:	4ca50513          	addi	a0,a0,1226 # 80014258 <uart_tx_lock>
    80000d96:	00000097          	auipc	ra,0x0
    80000d9a:	4d8080e7          	jalr	1240(ra) # 8000126e <acquire>

  if(panicked){
    80000d9e:	0000b797          	auipc	a5,0xb
    80000da2:	26278793          	addi	a5,a5,610 # 8000c000 <panicked>
    80000da6:	439c                	lw	a5,0(a5)
    80000da8:	2781                	sext.w	a5,a5
    80000daa:	c391                	beqz	a5,80000dae <uartputc+0x2e>
    for(;;)
    80000dac:	a001                	j	80000dac <uartputc+0x2c>
      ;
  }

  while(1){
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000dae:	0000b797          	auipc	a5,0xb
    80000db2:	26278793          	addi	a5,a5,610 # 8000c010 <uart_tx_r>
    80000db6:	639c                	ld	a5,0(a5)
    80000db8:	02078713          	addi	a4,a5,32
    80000dbc:	0000b797          	auipc	a5,0xb
    80000dc0:	24c78793          	addi	a5,a5,588 # 8000c008 <uart_tx_w>
    80000dc4:	639c                	ld	a5,0(a5)
    80000dc6:	00f71f63          	bne	a4,a5,80000de4 <uartputc+0x64>
      // buffer is full.
      // wait for uartstart() to open up space in the buffer.
      sleep(&uart_tx_r, &uart_tx_lock);
    80000dca:	00013597          	auipc	a1,0x13
    80000dce:	48e58593          	addi	a1,a1,1166 # 80014258 <uart_tx_lock>
    80000dd2:	0000b517          	auipc	a0,0xb
    80000dd6:	23e50513          	addi	a0,a0,574 # 8000c010 <uart_tx_r>
    80000dda:	00003097          	auipc	ra,0x3
    80000dde:	b66080e7          	jalr	-1178(ra) # 80003940 <sleep>
    80000de2:	b7f1                	j	80000dae <uartputc+0x2e>
    } else {
      uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000de4:	0000b797          	auipc	a5,0xb
    80000de8:	22478793          	addi	a5,a5,548 # 8000c008 <uart_tx_w>
    80000dec:	639c                	ld	a5,0(a5)
    80000dee:	8bfd                	andi	a5,a5,31
    80000df0:	fec42703          	lw	a4,-20(s0)
    80000df4:	0ff77713          	andi	a4,a4,255
    80000df8:	00013697          	auipc	a3,0x13
    80000dfc:	47868693          	addi	a3,a3,1144 # 80014270 <uart_tx_buf>
    80000e00:	97b6                	add	a5,a5,a3
    80000e02:	00e78023          	sb	a4,0(a5)
      uart_tx_w += 1;
    80000e06:	0000b797          	auipc	a5,0xb
    80000e0a:	20278793          	addi	a5,a5,514 # 8000c008 <uart_tx_w>
    80000e0e:	639c                	ld	a5,0(a5)
    80000e10:	00178713          	addi	a4,a5,1
    80000e14:	0000b797          	auipc	a5,0xb
    80000e18:	1f478793          	addi	a5,a5,500 # 8000c008 <uart_tx_w>
    80000e1c:	e398                	sd	a4,0(a5)
      uartstart();
    80000e1e:	00000097          	auipc	ra,0x0
    80000e22:	084080e7          	jalr	132(ra) # 80000ea2 <uartstart>
      release(&uart_tx_lock);
    80000e26:	00013517          	auipc	a0,0x13
    80000e2a:	43250513          	addi	a0,a0,1074 # 80014258 <uart_tx_lock>
    80000e2e:	00000097          	auipc	ra,0x0
    80000e32:	4a4080e7          	jalr	1188(ra) # 800012d2 <release>
      return;
    80000e36:	0001                	nop
    }
  }
}
    80000e38:	60e2                	ld	ra,24(sp)
    80000e3a:	6442                	ld	s0,16(sp)
    80000e3c:	6105                	addi	sp,sp,32
    80000e3e:	8082                	ret

0000000080000e40 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000e40:	1101                	addi	sp,sp,-32
    80000e42:	ec06                	sd	ra,24(sp)
    80000e44:	e822                	sd	s0,16(sp)
    80000e46:	1000                	addi	s0,sp,32
    80000e48:	87aa                	mv	a5,a0
    80000e4a:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000e4e:	00000097          	auipc	ra,0x0
    80000e52:	51e080e7          	jalr	1310(ra) # 8000136c <push_off>

  if(panicked){
    80000e56:	0000b797          	auipc	a5,0xb
    80000e5a:	1aa78793          	addi	a5,a5,426 # 8000c000 <panicked>
    80000e5e:	439c                	lw	a5,0(a5)
    80000e60:	2781                	sext.w	a5,a5
    80000e62:	c391                	beqz	a5,80000e66 <uartputc_sync+0x26>
    for(;;)
    80000e64:	a001                	j	80000e64 <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000e66:	0001                	nop
    80000e68:	100007b7          	lui	a5,0x10000
    80000e6c:	0795                	addi	a5,a5,5
    80000e6e:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000e72:	0ff7f793          	andi	a5,a5,255
    80000e76:	2781                	sext.w	a5,a5
    80000e78:	0207f793          	andi	a5,a5,32
    80000e7c:	2781                	sext.w	a5,a5
    80000e7e:	d7ed                	beqz	a5,80000e68 <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    80000e80:	100007b7          	lui	a5,0x10000
    80000e84:	fec42703          	lw	a4,-20(s0)
    80000e88:	0ff77713          	andi	a4,a4,255
    80000e8c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000e90:	00000097          	auipc	ra,0x0
    80000e94:	534080e7          	jalr	1332(ra) # 800013c4 <pop_off>
}
    80000e98:	0001                	nop
    80000e9a:	60e2                	ld	ra,24(sp)
    80000e9c:	6442                	ld	s0,16(sp)
    80000e9e:	6105                	addi	sp,sp,32
    80000ea0:	8082                	ret

0000000080000ea2 <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000ea2:	1101                	addi	sp,sp,-32
    80000ea4:	ec06                	sd	ra,24(sp)
    80000ea6:	e822                	sd	s0,16(sp)
    80000ea8:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000eaa:	0000b797          	auipc	a5,0xb
    80000eae:	15e78793          	addi	a5,a5,350 # 8000c008 <uart_tx_w>
    80000eb2:	6398                	ld	a4,0(a5)
    80000eb4:	0000b797          	auipc	a5,0xb
    80000eb8:	15c78793          	addi	a5,a5,348 # 8000c010 <uart_tx_r>
    80000ebc:	639c                	ld	a5,0(a5)
    80000ebe:	06f70a63          	beq	a4,a5,80000f32 <uartstart+0x90>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000ec2:	100007b7          	lui	a5,0x10000
    80000ec6:	0795                	addi	a5,a5,5
    80000ec8:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000ecc:	0ff7f793          	andi	a5,a5,255
    80000ed0:	2781                	sext.w	a5,a5
    80000ed2:	0207f793          	andi	a5,a5,32
    80000ed6:	2781                	sext.w	a5,a5
    80000ed8:	cfb9                	beqz	a5,80000f36 <uartstart+0x94>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    80000eda:	0000b797          	auipc	a5,0xb
    80000ede:	13678793          	addi	a5,a5,310 # 8000c010 <uart_tx_r>
    80000ee2:	639c                	ld	a5,0(a5)
    80000ee4:	8bfd                	andi	a5,a5,31
    80000ee6:	00013717          	auipc	a4,0x13
    80000eea:	38a70713          	addi	a4,a4,906 # 80014270 <uart_tx_buf>
    80000eee:	97ba                	add	a5,a5,a4
    80000ef0:	0007c783          	lbu	a5,0(a5)
    80000ef4:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000ef8:	0000b797          	auipc	a5,0xb
    80000efc:	11878793          	addi	a5,a5,280 # 8000c010 <uart_tx_r>
    80000f00:	639c                	ld	a5,0(a5)
    80000f02:	00178713          	addi	a4,a5,1
    80000f06:	0000b797          	auipc	a5,0xb
    80000f0a:	10a78793          	addi	a5,a5,266 # 8000c010 <uart_tx_r>
    80000f0e:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000f10:	0000b517          	auipc	a0,0xb
    80000f14:	10050513          	addi	a0,a0,256 # 8000c010 <uart_tx_r>
    80000f18:	00003097          	auipc	ra,0x3
    80000f1c:	aa4080e7          	jalr	-1372(ra) # 800039bc <wakeup>
    
    WriteReg(THR, c);
    80000f20:	100007b7          	lui	a5,0x10000
    80000f24:	fec42703          	lw	a4,-20(s0)
    80000f28:	0ff77713          	andi	a4,a4,255
    80000f2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000f30:	bfad                	j	80000eaa <uartstart+0x8>
      return;
    80000f32:	0001                	nop
    80000f34:	a011                	j	80000f38 <uartstart+0x96>
      return;
    80000f36:	0001                	nop
  }
}
    80000f38:	60e2                	ld	ra,24(sp)
    80000f3a:	6442                	ld	s0,16(sp)
    80000f3c:	6105                	addi	sp,sp,32
    80000f3e:	8082                	ret

0000000080000f40 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000f40:	1141                	addi	sp,sp,-16
    80000f42:	e422                	sd	s0,8(sp)
    80000f44:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80000f46:	100007b7          	lui	a5,0x10000
    80000f4a:	0795                	addi	a5,a5,5
    80000f4c:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f50:	0ff7f793          	andi	a5,a5,255
    80000f54:	2781                	sext.w	a5,a5
    80000f56:	8b85                	andi	a5,a5,1
    80000f58:	2781                	sext.w	a5,a5
    80000f5a:	cb89                	beqz	a5,80000f6c <uartgetc+0x2c>
    // input data is ready.
    return ReadReg(RHR);
    80000f5c:	100007b7          	lui	a5,0x10000
    80000f60:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f64:	0ff7f793          	andi	a5,a5,255
    80000f68:	2781                	sext.w	a5,a5
    80000f6a:	a011                	j	80000f6e <uartgetc+0x2e>
  } else {
    return -1;
    80000f6c:	57fd                	li	a5,-1
  }
}
    80000f6e:	853e                	mv	a0,a5
    80000f70:	6422                	ld	s0,8(sp)
    80000f72:	0141                	addi	sp,sp,16
    80000f74:	8082                	ret

0000000080000f76 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80000f76:	1101                	addi	sp,sp,-32
    80000f78:	ec06                	sd	ra,24(sp)
    80000f7a:	e822                	sd	s0,16(sp)
    80000f7c:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    80000f7e:	00000097          	auipc	ra,0x0
    80000f82:	fc2080e7          	jalr	-62(ra) # 80000f40 <uartgetc>
    80000f86:	87aa                	mv	a5,a0
    80000f88:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    80000f8c:	fec42783          	lw	a5,-20(s0)
    80000f90:	0007871b          	sext.w	a4,a5
    80000f94:	57fd                	li	a5,-1
    80000f96:	00f70a63          	beq	a4,a5,80000faa <uartintr+0x34>
      break;
    consoleintr(c);
    80000f9a:	fec42783          	lw	a5,-20(s0)
    80000f9e:	853e                	mv	a0,a5
    80000fa0:	fffff097          	auipc	ra,0xfffff
    80000fa4:	64a080e7          	jalr	1610(ra) # 800005ea <consoleintr>
  while(1){
    80000fa8:	bfd9                	j	80000f7e <uartintr+0x8>
      break;
    80000faa:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80000fac:	00013517          	auipc	a0,0x13
    80000fb0:	2ac50513          	addi	a0,a0,684 # 80014258 <uart_tx_lock>
    80000fb4:	00000097          	auipc	ra,0x0
    80000fb8:	2ba080e7          	jalr	698(ra) # 8000126e <acquire>
  uartstart();
    80000fbc:	00000097          	auipc	ra,0x0
    80000fc0:	ee6080e7          	jalr	-282(ra) # 80000ea2 <uartstart>
  release(&uart_tx_lock);
    80000fc4:	00013517          	auipc	a0,0x13
    80000fc8:	29450513          	addi	a0,a0,660 # 80014258 <uart_tx_lock>
    80000fcc:	00000097          	auipc	ra,0x0
    80000fd0:	306080e7          	jalr	774(ra) # 800012d2 <release>
}
    80000fd4:	0001                	nop
    80000fd6:	60e2                	ld	ra,24(sp)
    80000fd8:	6442                	ld	s0,16(sp)
    80000fda:	6105                	addi	sp,sp,32
    80000fdc:	8082                	ret

0000000080000fde <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    80000fde:	1141                	addi	sp,sp,-16
    80000fe0:	e406                	sd	ra,8(sp)
    80000fe2:	e022                	sd	s0,0(sp)
    80000fe4:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    80000fe6:	0000a597          	auipc	a1,0xa
    80000fea:	05a58593          	addi	a1,a1,90 # 8000b040 <etext+0x40>
    80000fee:	00013517          	auipc	a0,0x13
    80000ff2:	2a250513          	addi	a0,a0,674 # 80014290 <kmem>
    80000ff6:	00000097          	auipc	ra,0x0
    80000ffa:	248080e7          	jalr	584(ra) # 8000123e <initlock>
  freerange(end, (void*)PHYSTOP);
    80000ffe:	47c5                	li	a5,17
    80001000:	01b79593          	slli	a1,a5,0x1b
    80001004:	00028517          	auipc	a0,0x28
    80001008:	ffc50513          	addi	a0,a0,-4 # 80029000 <end>
    8000100c:	00000097          	auipc	ra,0x0
    80001010:	012080e7          	jalr	18(ra) # 8000101e <freerange>
}
    80001014:	0001                	nop
    80001016:	60a2                	ld	ra,8(sp)
    80001018:	6402                	ld	s0,0(sp)
    8000101a:	0141                	addi	sp,sp,16
    8000101c:	8082                	ret

000000008000101e <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    8000101e:	7179                	addi	sp,sp,-48
    80001020:	f406                	sd	ra,40(sp)
    80001022:	f022                	sd	s0,32(sp)
    80001024:	1800                	addi	s0,sp,48
    80001026:	fca43c23          	sd	a0,-40(s0)
    8000102a:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    8000102e:	fd843703          	ld	a4,-40(s0)
    80001032:	6785                	lui	a5,0x1
    80001034:	17fd                	addi	a5,a5,-1
    80001036:	973e                	add	a4,a4,a5
    80001038:	77fd                	lui	a5,0xfffff
    8000103a:	8ff9                	and	a5,a5,a4
    8000103c:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001040:	a829                	j	8000105a <freerange+0x3c>
    kfree(p);
    80001042:	fe843503          	ld	a0,-24(s0)
    80001046:	00000097          	auipc	ra,0x0
    8000104a:	030080e7          	jalr	48(ra) # 80001076 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    8000104e:	fe843703          	ld	a4,-24(s0)
    80001052:	6785                	lui	a5,0x1
    80001054:	97ba                	add	a5,a5,a4
    80001056:	fef43423          	sd	a5,-24(s0)
    8000105a:	fe843703          	ld	a4,-24(s0)
    8000105e:	6785                	lui	a5,0x1
    80001060:	97ba                	add	a5,a5,a4
    80001062:	fd043703          	ld	a4,-48(s0)
    80001066:	fcf77ee3          	bgeu	a4,a5,80001042 <freerange+0x24>
}
    8000106a:	0001                	nop
    8000106c:	0001                	nop
    8000106e:	70a2                	ld	ra,40(sp)
    80001070:	7402                	ld	s0,32(sp)
    80001072:	6145                	addi	sp,sp,48
    80001074:	8082                	ret

0000000080001076 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80001076:	7179                	addi	sp,sp,-48
    80001078:	f406                	sd	ra,40(sp)
    8000107a:	f022                	sd	s0,32(sp)
    8000107c:	1800                	addi	s0,sp,48
    8000107e:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    80001082:	fd843703          	ld	a4,-40(s0)
    80001086:	6785                	lui	a5,0x1
    80001088:	17fd                	addi	a5,a5,-1
    8000108a:	8ff9                	and	a5,a5,a4
    8000108c:	ef99                	bnez	a5,800010aa <kfree+0x34>
    8000108e:	fd843703          	ld	a4,-40(s0)
    80001092:	00028797          	auipc	a5,0x28
    80001096:	f6e78793          	addi	a5,a5,-146 # 80029000 <end>
    8000109a:	00f76863          	bltu	a4,a5,800010aa <kfree+0x34>
    8000109e:	fd843703          	ld	a4,-40(s0)
    800010a2:	47c5                	li	a5,17
    800010a4:	07ee                	slli	a5,a5,0x1b
    800010a6:	00f76a63          	bltu	a4,a5,800010ba <kfree+0x44>
    panic("kfree");
    800010aa:	0000a517          	auipc	a0,0xa
    800010ae:	f9e50513          	addi	a0,a0,-98 # 8000b048 <etext+0x48>
    800010b2:	00000097          	auipc	ra,0x0
    800010b6:	bcc080e7          	jalr	-1076(ra) # 80000c7e <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    800010ba:	6605                	lui	a2,0x1
    800010bc:	4585                	li	a1,1
    800010be:	fd843503          	ld	a0,-40(s0)
    800010c2:	00000097          	auipc	ra,0x0
    800010c6:	380080e7          	jalr	896(ra) # 80001442 <memset>

  r = (struct run*)pa;
    800010ca:	fd843783          	ld	a5,-40(s0)
    800010ce:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    800010d2:	00013517          	auipc	a0,0x13
    800010d6:	1be50513          	addi	a0,a0,446 # 80014290 <kmem>
    800010da:	00000097          	auipc	ra,0x0
    800010de:	194080e7          	jalr	404(ra) # 8000126e <acquire>
  r->next = kmem.freelist;
    800010e2:	00013797          	auipc	a5,0x13
    800010e6:	1ae78793          	addi	a5,a5,430 # 80014290 <kmem>
    800010ea:	6f98                	ld	a4,24(a5)
    800010ec:	fe843783          	ld	a5,-24(s0)
    800010f0:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800010f2:	00013797          	auipc	a5,0x13
    800010f6:	19e78793          	addi	a5,a5,414 # 80014290 <kmem>
    800010fa:	fe843703          	ld	a4,-24(s0)
    800010fe:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001100:	00013517          	auipc	a0,0x13
    80001104:	19050513          	addi	a0,a0,400 # 80014290 <kmem>
    80001108:	00000097          	auipc	ra,0x0
    8000110c:	1ca080e7          	jalr	458(ra) # 800012d2 <release>
}
    80001110:	0001                	nop
    80001112:	70a2                	ld	ra,40(sp)
    80001114:	7402                	ld	s0,32(sp)
    80001116:	6145                	addi	sp,sp,48
    80001118:	8082                	ret

000000008000111a <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    8000111a:	1101                	addi	sp,sp,-32
    8000111c:	ec06                	sd	ra,24(sp)
    8000111e:	e822                	sd	s0,16(sp)
    80001120:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80001122:	00013517          	auipc	a0,0x13
    80001126:	16e50513          	addi	a0,a0,366 # 80014290 <kmem>
    8000112a:	00000097          	auipc	ra,0x0
    8000112e:	144080e7          	jalr	324(ra) # 8000126e <acquire>
  r = kmem.freelist;
    80001132:	00013797          	auipc	a5,0x13
    80001136:	15e78793          	addi	a5,a5,350 # 80014290 <kmem>
    8000113a:	6f9c                	ld	a5,24(a5)
    8000113c:	fef43423          	sd	a5,-24(s0)
  if(r)
    80001140:	fe843783          	ld	a5,-24(s0)
    80001144:	cb89                	beqz	a5,80001156 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001146:	fe843783          	ld	a5,-24(s0)
    8000114a:	6398                	ld	a4,0(a5)
    8000114c:	00013797          	auipc	a5,0x13
    80001150:	14478793          	addi	a5,a5,324 # 80014290 <kmem>
    80001154:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001156:	00013517          	auipc	a0,0x13
    8000115a:	13a50513          	addi	a0,a0,314 # 80014290 <kmem>
    8000115e:	00000097          	auipc	ra,0x0
    80001162:	174080e7          	jalr	372(ra) # 800012d2 <release>

  if(r)
    80001166:	fe843783          	ld	a5,-24(s0)
    8000116a:	cb89                	beqz	a5,8000117c <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    8000116c:	6605                	lui	a2,0x1
    8000116e:	4595                	li	a1,5
    80001170:	fe843503          	ld	a0,-24(s0)
    80001174:	00000097          	auipc	ra,0x0
    80001178:	2ce080e7          	jalr	718(ra) # 80001442 <memset>
  return (void*)r;
    8000117c:	fe843783          	ld	a5,-24(s0)
}
    80001180:	853e                	mv	a0,a5
    80001182:	60e2                	ld	ra,24(sp)
    80001184:	6442                	ld	s0,16(sp)
    80001186:	6105                	addi	sp,sp,32
    80001188:	8082                	ret

000000008000118a <r_sstatus>:
{
    8000118a:	1101                	addi	sp,sp,-32
    8000118c:	ec22                	sd	s0,24(sp)
    8000118e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80001190:	100027f3          	csrr	a5,sstatus
    80001194:	fef43423          	sd	a5,-24(s0)
  return x;
    80001198:	fe843783          	ld	a5,-24(s0)
}
    8000119c:	853e                	mv	a0,a5
    8000119e:	6462                	ld	s0,24(sp)
    800011a0:	6105                	addi	sp,sp,32
    800011a2:	8082                	ret

00000000800011a4 <w_sstatus>:
{
    800011a4:	1101                	addi	sp,sp,-32
    800011a6:	ec22                	sd	s0,24(sp)
    800011a8:	1000                	addi	s0,sp,32
    800011aa:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800011ae:	fe843783          	ld	a5,-24(s0)
    800011b2:	10079073          	csrw	sstatus,a5
}
    800011b6:	0001                	nop
    800011b8:	6462                	ld	s0,24(sp)
    800011ba:	6105                	addi	sp,sp,32
    800011bc:	8082                	ret

00000000800011be <intr_on>:
{
    800011be:	1141                	addi	sp,sp,-16
    800011c0:	e406                	sd	ra,8(sp)
    800011c2:	e022                	sd	s0,0(sp)
    800011c4:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800011c6:	00000097          	auipc	ra,0x0
    800011ca:	fc4080e7          	jalr	-60(ra) # 8000118a <r_sstatus>
    800011ce:	87aa                	mv	a5,a0
    800011d0:	0027e793          	ori	a5,a5,2
    800011d4:	853e                	mv	a0,a5
    800011d6:	00000097          	auipc	ra,0x0
    800011da:	fce080e7          	jalr	-50(ra) # 800011a4 <w_sstatus>
}
    800011de:	0001                	nop
    800011e0:	60a2                	ld	ra,8(sp)
    800011e2:	6402                	ld	s0,0(sp)
    800011e4:	0141                	addi	sp,sp,16
    800011e6:	8082                	ret

00000000800011e8 <intr_off>:
{
    800011e8:	1141                	addi	sp,sp,-16
    800011ea:	e406                	sd	ra,8(sp)
    800011ec:	e022                	sd	s0,0(sp)
    800011ee:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800011f0:	00000097          	auipc	ra,0x0
    800011f4:	f9a080e7          	jalr	-102(ra) # 8000118a <r_sstatus>
    800011f8:	87aa                	mv	a5,a0
    800011fa:	9bf5                	andi	a5,a5,-3
    800011fc:	853e                	mv	a0,a5
    800011fe:	00000097          	auipc	ra,0x0
    80001202:	fa6080e7          	jalr	-90(ra) # 800011a4 <w_sstatus>
}
    80001206:	0001                	nop
    80001208:	60a2                	ld	ra,8(sp)
    8000120a:	6402                	ld	s0,0(sp)
    8000120c:	0141                	addi	sp,sp,16
    8000120e:	8082                	ret

0000000080001210 <intr_get>:
{
    80001210:	1101                	addi	sp,sp,-32
    80001212:	ec06                	sd	ra,24(sp)
    80001214:	e822                	sd	s0,16(sp)
    80001216:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80001218:	00000097          	auipc	ra,0x0
    8000121c:	f72080e7          	jalr	-142(ra) # 8000118a <r_sstatus>
    80001220:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80001224:	fe843783          	ld	a5,-24(s0)
    80001228:	8b89                	andi	a5,a5,2
    8000122a:	00f037b3          	snez	a5,a5
    8000122e:	0ff7f793          	andi	a5,a5,255
    80001232:	2781                	sext.w	a5,a5
}
    80001234:	853e                	mv	a0,a5
    80001236:	60e2                	ld	ra,24(sp)
    80001238:	6442                	ld	s0,16(sp)
    8000123a:	6105                	addi	sp,sp,32
    8000123c:	8082                	ret

000000008000123e <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    8000123e:	1101                	addi	sp,sp,-32
    80001240:	ec22                	sd	s0,24(sp)
    80001242:	1000                	addi	s0,sp,32
    80001244:	fea43423          	sd	a0,-24(s0)
    80001248:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    8000124c:	fe843783          	ld	a5,-24(s0)
    80001250:	fe043703          	ld	a4,-32(s0)
    80001254:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001256:	fe843783          	ld	a5,-24(s0)
    8000125a:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    8000125e:	fe843783          	ld	a5,-24(s0)
    80001262:	0007b823          	sd	zero,16(a5)
}
    80001266:	0001                	nop
    80001268:	6462                	ld	s0,24(sp)
    8000126a:	6105                	addi	sp,sp,32
    8000126c:	8082                	ret

000000008000126e <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    8000126e:	1101                	addi	sp,sp,-32
    80001270:	ec06                	sd	ra,24(sp)
    80001272:	e822                	sd	s0,16(sp)
    80001274:	1000                	addi	s0,sp,32
    80001276:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    8000127a:	00000097          	auipc	ra,0x0
    8000127e:	0f2080e7          	jalr	242(ra) # 8000136c <push_off>
  if(holding(lk))
    80001282:	fe843503          	ld	a0,-24(s0)
    80001286:	00000097          	auipc	ra,0x0
    8000128a:	0a2080e7          	jalr	162(ra) # 80001328 <holding>
    8000128e:	87aa                	mv	a5,a0
    80001290:	cb89                	beqz	a5,800012a2 <acquire+0x34>
    panic("acquire");
    80001292:	0000a517          	auipc	a0,0xa
    80001296:	dbe50513          	addi	a0,a0,-578 # 8000b050 <etext+0x50>
    8000129a:	00000097          	auipc	ra,0x0
    8000129e:	9e4080e7          	jalr	-1564(ra) # 80000c7e <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    800012a2:	0001                	nop
    800012a4:	fe843783          	ld	a5,-24(s0)
    800012a8:	4705                	li	a4,1
    800012aa:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    800012ae:	0007079b          	sext.w	a5,a4
    800012b2:	fbed                	bnez	a5,800012a4 <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800012b4:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    800012b8:	00001097          	auipc	ra,0x1
    800012bc:	522080e7          	jalr	1314(ra) # 800027da <mycpu>
    800012c0:	872a                	mv	a4,a0
    800012c2:	fe843783          	ld	a5,-24(s0)
    800012c6:	eb98                	sd	a4,16(a5)
}
    800012c8:	0001                	nop
    800012ca:	60e2                	ld	ra,24(sp)
    800012cc:	6442                	ld	s0,16(sp)
    800012ce:	6105                	addi	sp,sp,32
    800012d0:	8082                	ret

00000000800012d2 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    800012d2:	1101                	addi	sp,sp,-32
    800012d4:	ec06                	sd	ra,24(sp)
    800012d6:	e822                	sd	s0,16(sp)
    800012d8:	1000                	addi	s0,sp,32
    800012da:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800012de:	fe843503          	ld	a0,-24(s0)
    800012e2:	00000097          	auipc	ra,0x0
    800012e6:	046080e7          	jalr	70(ra) # 80001328 <holding>
    800012ea:	87aa                	mv	a5,a0
    800012ec:	eb89                	bnez	a5,800012fe <release+0x2c>
    panic("release");
    800012ee:	0000a517          	auipc	a0,0xa
    800012f2:	d6a50513          	addi	a0,a0,-662 # 8000b058 <etext+0x58>
    800012f6:	00000097          	auipc	ra,0x0
    800012fa:	988080e7          	jalr	-1656(ra) # 80000c7e <panic>

  lk->cpu = 0;
    800012fe:	fe843783          	ld	a5,-24(s0)
    80001302:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001306:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    8000130a:	fe843783          	ld	a5,-24(s0)
    8000130e:	0f50000f          	fence	iorw,ow
    80001312:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    80001316:	00000097          	auipc	ra,0x0
    8000131a:	0ae080e7          	jalr	174(ra) # 800013c4 <pop_off>
}
    8000131e:	0001                	nop
    80001320:	60e2                	ld	ra,24(sp)
    80001322:	6442                	ld	s0,16(sp)
    80001324:	6105                	addi	sp,sp,32
    80001326:	8082                	ret

0000000080001328 <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    80001328:	7139                	addi	sp,sp,-64
    8000132a:	fc06                	sd	ra,56(sp)
    8000132c:	f822                	sd	s0,48(sp)
    8000132e:	f426                	sd	s1,40(sp)
    80001330:	0080                	addi	s0,sp,64
    80001332:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80001336:	fc843783          	ld	a5,-56(s0)
    8000133a:	439c                	lw	a5,0(a5)
    8000133c:	cf89                	beqz	a5,80001356 <holding+0x2e>
    8000133e:	fc843783          	ld	a5,-56(s0)
    80001342:	6b84                	ld	s1,16(a5)
    80001344:	00001097          	auipc	ra,0x1
    80001348:	496080e7          	jalr	1174(ra) # 800027da <mycpu>
    8000134c:	87aa                	mv	a5,a0
    8000134e:	00f49463          	bne	s1,a5,80001356 <holding+0x2e>
    80001352:	4785                	li	a5,1
    80001354:	a011                	j	80001358 <holding+0x30>
    80001356:	4781                	li	a5,0
    80001358:	fcf42e23          	sw	a5,-36(s0)
  return r;
    8000135c:	fdc42783          	lw	a5,-36(s0)
}
    80001360:	853e                	mv	a0,a5
    80001362:	70e2                	ld	ra,56(sp)
    80001364:	7442                	ld	s0,48(sp)
    80001366:	74a2                	ld	s1,40(sp)
    80001368:	6121                	addi	sp,sp,64
    8000136a:	8082                	ret

000000008000136c <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    8000136c:	1101                	addi	sp,sp,-32
    8000136e:	ec06                	sd	ra,24(sp)
    80001370:	e822                	sd	s0,16(sp)
    80001372:	1000                	addi	s0,sp,32
  int old = intr_get();
    80001374:	00000097          	auipc	ra,0x0
    80001378:	e9c080e7          	jalr	-356(ra) # 80001210 <intr_get>
    8000137c:	87aa                	mv	a5,a0
    8000137e:	fef42623          	sw	a5,-20(s0)

  intr_off();
    80001382:	00000097          	auipc	ra,0x0
    80001386:	e66080e7          	jalr	-410(ra) # 800011e8 <intr_off>
  if(mycpu()->noff == 0)
    8000138a:	00001097          	auipc	ra,0x1
    8000138e:	450080e7          	jalr	1104(ra) # 800027da <mycpu>
    80001392:	87aa                	mv	a5,a0
    80001394:	5fbc                	lw	a5,120(a5)
    80001396:	eb89                	bnez	a5,800013a8 <push_off+0x3c>
    mycpu()->intena = old;
    80001398:	00001097          	auipc	ra,0x1
    8000139c:	442080e7          	jalr	1090(ra) # 800027da <mycpu>
    800013a0:	872a                	mv	a4,a0
    800013a2:	fec42783          	lw	a5,-20(s0)
    800013a6:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800013a8:	00001097          	auipc	ra,0x1
    800013ac:	432080e7          	jalr	1074(ra) # 800027da <mycpu>
    800013b0:	87aa                	mv	a5,a0
    800013b2:	5fb8                	lw	a4,120(a5)
    800013b4:	2705                	addiw	a4,a4,1
    800013b6:	2701                	sext.w	a4,a4
    800013b8:	dfb8                	sw	a4,120(a5)
}
    800013ba:	0001                	nop
    800013bc:	60e2                	ld	ra,24(sp)
    800013be:	6442                	ld	s0,16(sp)
    800013c0:	6105                	addi	sp,sp,32
    800013c2:	8082                	ret

00000000800013c4 <pop_off>:

void
pop_off(void)
{
    800013c4:	1101                	addi	sp,sp,-32
    800013c6:	ec06                	sd	ra,24(sp)
    800013c8:	e822                	sd	s0,16(sp)
    800013ca:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    800013cc:	00001097          	auipc	ra,0x1
    800013d0:	40e080e7          	jalr	1038(ra) # 800027da <mycpu>
    800013d4:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    800013d8:	00000097          	auipc	ra,0x0
    800013dc:	e38080e7          	jalr	-456(ra) # 80001210 <intr_get>
    800013e0:	87aa                	mv	a5,a0
    800013e2:	cb89                	beqz	a5,800013f4 <pop_off+0x30>
    panic("pop_off - interruptible");
    800013e4:	0000a517          	auipc	a0,0xa
    800013e8:	c7c50513          	addi	a0,a0,-900 # 8000b060 <etext+0x60>
    800013ec:	00000097          	auipc	ra,0x0
    800013f0:	892080e7          	jalr	-1902(ra) # 80000c7e <panic>
  if(c->noff < 1)
    800013f4:	fe843783          	ld	a5,-24(s0)
    800013f8:	5fbc                	lw	a5,120(a5)
    800013fa:	00f04a63          	bgtz	a5,8000140e <pop_off+0x4a>
    panic("pop_off");
    800013fe:	0000a517          	auipc	a0,0xa
    80001402:	c7a50513          	addi	a0,a0,-902 # 8000b078 <etext+0x78>
    80001406:	00000097          	auipc	ra,0x0
    8000140a:	878080e7          	jalr	-1928(ra) # 80000c7e <panic>
  c->noff -= 1;
    8000140e:	fe843783          	ld	a5,-24(s0)
    80001412:	5fbc                	lw	a5,120(a5)
    80001414:	37fd                	addiw	a5,a5,-1
    80001416:	0007871b          	sext.w	a4,a5
    8000141a:	fe843783          	ld	a5,-24(s0)
    8000141e:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    80001420:	fe843783          	ld	a5,-24(s0)
    80001424:	5fbc                	lw	a5,120(a5)
    80001426:	eb89                	bnez	a5,80001438 <pop_off+0x74>
    80001428:	fe843783          	ld	a5,-24(s0)
    8000142c:	5ffc                	lw	a5,124(a5)
    8000142e:	c789                	beqz	a5,80001438 <pop_off+0x74>
    intr_on();
    80001430:	00000097          	auipc	ra,0x0
    80001434:	d8e080e7          	jalr	-626(ra) # 800011be <intr_on>
}
    80001438:	0001                	nop
    8000143a:	60e2                	ld	ra,24(sp)
    8000143c:	6442                	ld	s0,16(sp)
    8000143e:	6105                	addi	sp,sp,32
    80001440:	8082                	ret

0000000080001442 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80001442:	7179                	addi	sp,sp,-48
    80001444:	f422                	sd	s0,40(sp)
    80001446:	1800                	addi	s0,sp,48
    80001448:	fca43c23          	sd	a0,-40(s0)
    8000144c:	87ae                	mv	a5,a1
    8000144e:	8732                	mv	a4,a2
    80001450:	fcf42a23          	sw	a5,-44(s0)
    80001454:	87ba                	mv	a5,a4
    80001456:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    8000145a:	fd843783          	ld	a5,-40(s0)
    8000145e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    80001462:	fe042623          	sw	zero,-20(s0)
    80001466:	a00d                	j	80001488 <memset+0x46>
    cdst[i] = c;
    80001468:	fec42783          	lw	a5,-20(s0)
    8000146c:	fe043703          	ld	a4,-32(s0)
    80001470:	97ba                	add	a5,a5,a4
    80001472:	fd442703          	lw	a4,-44(s0)
    80001476:	0ff77713          	andi	a4,a4,255
    8000147a:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    8000147e:	fec42783          	lw	a5,-20(s0)
    80001482:	2785                	addiw	a5,a5,1
    80001484:	fef42623          	sw	a5,-20(s0)
    80001488:	fec42703          	lw	a4,-20(s0)
    8000148c:	fd042783          	lw	a5,-48(s0)
    80001490:	2781                	sext.w	a5,a5
    80001492:	fcf76be3          	bltu	a4,a5,80001468 <memset+0x26>
  }
  return dst;
    80001496:	fd843783          	ld	a5,-40(s0)
}
    8000149a:	853e                	mv	a0,a5
    8000149c:	7422                	ld	s0,40(sp)
    8000149e:	6145                	addi	sp,sp,48
    800014a0:	8082                	ret

00000000800014a2 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    800014a2:	7139                	addi	sp,sp,-64
    800014a4:	fc22                	sd	s0,56(sp)
    800014a6:	0080                	addi	s0,sp,64
    800014a8:	fca43c23          	sd	a0,-40(s0)
    800014ac:	fcb43823          	sd	a1,-48(s0)
    800014b0:	87b2                	mv	a5,a2
    800014b2:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    800014b6:	fd843783          	ld	a5,-40(s0)
    800014ba:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    800014be:	fd043783          	ld	a5,-48(s0)
    800014c2:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800014c6:	a0a1                	j	8000150e <memcmp+0x6c>
    if(*s1 != *s2)
    800014c8:	fe843783          	ld	a5,-24(s0)
    800014cc:	0007c703          	lbu	a4,0(a5)
    800014d0:	fe043783          	ld	a5,-32(s0)
    800014d4:	0007c783          	lbu	a5,0(a5)
    800014d8:	02f70163          	beq	a4,a5,800014fa <memcmp+0x58>
      return *s1 - *s2;
    800014dc:	fe843783          	ld	a5,-24(s0)
    800014e0:	0007c783          	lbu	a5,0(a5)
    800014e4:	0007871b          	sext.w	a4,a5
    800014e8:	fe043783          	ld	a5,-32(s0)
    800014ec:	0007c783          	lbu	a5,0(a5)
    800014f0:	2781                	sext.w	a5,a5
    800014f2:	40f707bb          	subw	a5,a4,a5
    800014f6:	2781                	sext.w	a5,a5
    800014f8:	a01d                	j	8000151e <memcmp+0x7c>
    s1++, s2++;
    800014fa:	fe843783          	ld	a5,-24(s0)
    800014fe:	0785                	addi	a5,a5,1
    80001500:	fef43423          	sd	a5,-24(s0)
    80001504:	fe043783          	ld	a5,-32(s0)
    80001508:	0785                	addi	a5,a5,1
    8000150a:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    8000150e:	fcc42783          	lw	a5,-52(s0)
    80001512:	fff7871b          	addiw	a4,a5,-1
    80001516:	fce42623          	sw	a4,-52(s0)
    8000151a:	f7dd                	bnez	a5,800014c8 <memcmp+0x26>
  }

  return 0;
    8000151c:	4781                	li	a5,0
}
    8000151e:	853e                	mv	a0,a5
    80001520:	7462                	ld	s0,56(sp)
    80001522:	6121                	addi	sp,sp,64
    80001524:	8082                	ret

0000000080001526 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    80001526:	7139                	addi	sp,sp,-64
    80001528:	fc22                	sd	s0,56(sp)
    8000152a:	0080                	addi	s0,sp,64
    8000152c:	fca43c23          	sd	a0,-40(s0)
    80001530:	fcb43823          	sd	a1,-48(s0)
    80001534:	87b2                	mv	a5,a2
    80001536:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    8000153a:	fcc42783          	lw	a5,-52(s0)
    8000153e:	2781                	sext.w	a5,a5
    80001540:	e781                	bnez	a5,80001548 <memmove+0x22>
    return dst;
    80001542:	fd843783          	ld	a5,-40(s0)
    80001546:	a855                	j	800015fa <memmove+0xd4>
  
  s = src;
    80001548:	fd043783          	ld	a5,-48(s0)
    8000154c:	fef43423          	sd	a5,-24(s0)
  d = dst;
    80001550:	fd843783          	ld	a5,-40(s0)
    80001554:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    80001558:	fe843703          	ld	a4,-24(s0)
    8000155c:	fe043783          	ld	a5,-32(s0)
    80001560:	08f77463          	bgeu	a4,a5,800015e8 <memmove+0xc2>
    80001564:	fcc46783          	lwu	a5,-52(s0)
    80001568:	fe843703          	ld	a4,-24(s0)
    8000156c:	97ba                	add	a5,a5,a4
    8000156e:	fe043703          	ld	a4,-32(s0)
    80001572:	06f77b63          	bgeu	a4,a5,800015e8 <memmove+0xc2>
    s += n;
    80001576:	fcc46783          	lwu	a5,-52(s0)
    8000157a:	fe843703          	ld	a4,-24(s0)
    8000157e:	97ba                	add	a5,a5,a4
    80001580:	fef43423          	sd	a5,-24(s0)
    d += n;
    80001584:	fcc46783          	lwu	a5,-52(s0)
    80001588:	fe043703          	ld	a4,-32(s0)
    8000158c:	97ba                	add	a5,a5,a4
    8000158e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    80001592:	a01d                	j	800015b8 <memmove+0x92>
      *--d = *--s;
    80001594:	fe843783          	ld	a5,-24(s0)
    80001598:	17fd                	addi	a5,a5,-1
    8000159a:	fef43423          	sd	a5,-24(s0)
    8000159e:	fe043783          	ld	a5,-32(s0)
    800015a2:	17fd                	addi	a5,a5,-1
    800015a4:	fef43023          	sd	a5,-32(s0)
    800015a8:	fe843783          	ld	a5,-24(s0)
    800015ac:	0007c703          	lbu	a4,0(a5)
    800015b0:	fe043783          	ld	a5,-32(s0)
    800015b4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015b8:	fcc42783          	lw	a5,-52(s0)
    800015bc:	fff7871b          	addiw	a4,a5,-1
    800015c0:	fce42623          	sw	a4,-52(s0)
    800015c4:	fbe1                	bnez	a5,80001594 <memmove+0x6e>
  if(s < d && s + n > d){
    800015c6:	a805                	j	800015f6 <memmove+0xd0>
  } else
    while(n-- > 0)
      *d++ = *s++;
    800015c8:	fe843703          	ld	a4,-24(s0)
    800015cc:	00170793          	addi	a5,a4,1
    800015d0:	fef43423          	sd	a5,-24(s0)
    800015d4:	fe043783          	ld	a5,-32(s0)
    800015d8:	00178693          	addi	a3,a5,1
    800015dc:	fed43023          	sd	a3,-32(s0)
    800015e0:	00074703          	lbu	a4,0(a4)
    800015e4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015e8:	fcc42783          	lw	a5,-52(s0)
    800015ec:	fff7871b          	addiw	a4,a5,-1
    800015f0:	fce42623          	sw	a4,-52(s0)
    800015f4:	fbf1                	bnez	a5,800015c8 <memmove+0xa2>

  return dst;
    800015f6:	fd843783          	ld	a5,-40(s0)
}
    800015fa:	853e                	mv	a0,a5
    800015fc:	7462                	ld	s0,56(sp)
    800015fe:	6121                	addi	sp,sp,64
    80001600:	8082                	ret

0000000080001602 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80001602:	7179                	addi	sp,sp,-48
    80001604:	f406                	sd	ra,40(sp)
    80001606:	f022                	sd	s0,32(sp)
    80001608:	1800                	addi	s0,sp,48
    8000160a:	fea43423          	sd	a0,-24(s0)
    8000160e:	feb43023          	sd	a1,-32(s0)
    80001612:	87b2                	mv	a5,a2
    80001614:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    80001618:	fdc42783          	lw	a5,-36(s0)
    8000161c:	863e                	mv	a2,a5
    8000161e:	fe043583          	ld	a1,-32(s0)
    80001622:	fe843503          	ld	a0,-24(s0)
    80001626:	00000097          	auipc	ra,0x0
    8000162a:	f00080e7          	jalr	-256(ra) # 80001526 <memmove>
    8000162e:	87aa                	mv	a5,a0
}
    80001630:	853e                	mv	a0,a5
    80001632:	70a2                	ld	ra,40(sp)
    80001634:	7402                	ld	s0,32(sp)
    80001636:	6145                	addi	sp,sp,48
    80001638:	8082                	ret

000000008000163a <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8000163a:	7179                	addi	sp,sp,-48
    8000163c:	f422                	sd	s0,40(sp)
    8000163e:	1800                	addi	s0,sp,48
    80001640:	fea43423          	sd	a0,-24(s0)
    80001644:	feb43023          	sd	a1,-32(s0)
    80001648:	87b2                	mv	a5,a2
    8000164a:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    8000164e:	a005                	j	8000166e <strncmp+0x34>
    n--, p++, q++;
    80001650:	fdc42783          	lw	a5,-36(s0)
    80001654:	37fd                	addiw	a5,a5,-1
    80001656:	fcf42e23          	sw	a5,-36(s0)
    8000165a:	fe843783          	ld	a5,-24(s0)
    8000165e:	0785                	addi	a5,a5,1
    80001660:	fef43423          	sd	a5,-24(s0)
    80001664:	fe043783          	ld	a5,-32(s0)
    80001668:	0785                	addi	a5,a5,1
    8000166a:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    8000166e:	fdc42783          	lw	a5,-36(s0)
    80001672:	2781                	sext.w	a5,a5
    80001674:	c385                	beqz	a5,80001694 <strncmp+0x5a>
    80001676:	fe843783          	ld	a5,-24(s0)
    8000167a:	0007c783          	lbu	a5,0(a5)
    8000167e:	cb99                	beqz	a5,80001694 <strncmp+0x5a>
    80001680:	fe843783          	ld	a5,-24(s0)
    80001684:	0007c703          	lbu	a4,0(a5)
    80001688:	fe043783          	ld	a5,-32(s0)
    8000168c:	0007c783          	lbu	a5,0(a5)
    80001690:	fcf700e3          	beq	a4,a5,80001650 <strncmp+0x16>
  if(n == 0)
    80001694:	fdc42783          	lw	a5,-36(s0)
    80001698:	2781                	sext.w	a5,a5
    8000169a:	e399                	bnez	a5,800016a0 <strncmp+0x66>
    return 0;
    8000169c:	4781                	li	a5,0
    8000169e:	a839                	j	800016bc <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    800016a0:	fe843783          	ld	a5,-24(s0)
    800016a4:	0007c783          	lbu	a5,0(a5)
    800016a8:	0007871b          	sext.w	a4,a5
    800016ac:	fe043783          	ld	a5,-32(s0)
    800016b0:	0007c783          	lbu	a5,0(a5)
    800016b4:	2781                	sext.w	a5,a5
    800016b6:	40f707bb          	subw	a5,a4,a5
    800016ba:	2781                	sext.w	a5,a5
}
    800016bc:	853e                	mv	a0,a5
    800016be:	7422                	ld	s0,40(sp)
    800016c0:	6145                	addi	sp,sp,48
    800016c2:	8082                	ret

00000000800016c4 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    800016c4:	7139                	addi	sp,sp,-64
    800016c6:	fc22                	sd	s0,56(sp)
    800016c8:	0080                	addi	s0,sp,64
    800016ca:	fca43c23          	sd	a0,-40(s0)
    800016ce:	fcb43823          	sd	a1,-48(s0)
    800016d2:	87b2                	mv	a5,a2
    800016d4:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800016d8:	fd843783          	ld	a5,-40(s0)
    800016dc:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800016e0:	0001                	nop
    800016e2:	fcc42783          	lw	a5,-52(s0)
    800016e6:	fff7871b          	addiw	a4,a5,-1
    800016ea:	fce42623          	sw	a4,-52(s0)
    800016ee:	02f05e63          	blez	a5,8000172a <strncpy+0x66>
    800016f2:	fd043703          	ld	a4,-48(s0)
    800016f6:	00170793          	addi	a5,a4,1
    800016fa:	fcf43823          	sd	a5,-48(s0)
    800016fe:	fd843783          	ld	a5,-40(s0)
    80001702:	00178693          	addi	a3,a5,1
    80001706:	fcd43c23          	sd	a3,-40(s0)
    8000170a:	00074703          	lbu	a4,0(a4)
    8000170e:	00e78023          	sb	a4,0(a5)
    80001712:	0007c783          	lbu	a5,0(a5)
    80001716:	f7f1                	bnez	a5,800016e2 <strncpy+0x1e>
    ;
  while(n-- > 0)
    80001718:	a809                	j	8000172a <strncpy+0x66>
    *s++ = 0;
    8000171a:	fd843783          	ld	a5,-40(s0)
    8000171e:	00178713          	addi	a4,a5,1
    80001722:	fce43c23          	sd	a4,-40(s0)
    80001726:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    8000172a:	fcc42783          	lw	a5,-52(s0)
    8000172e:	fff7871b          	addiw	a4,a5,-1
    80001732:	fce42623          	sw	a4,-52(s0)
    80001736:	fef042e3          	bgtz	a5,8000171a <strncpy+0x56>
  return os;
    8000173a:	fe843783          	ld	a5,-24(s0)
}
    8000173e:	853e                	mv	a0,a5
    80001740:	7462                	ld	s0,56(sp)
    80001742:	6121                	addi	sp,sp,64
    80001744:	8082                	ret

0000000080001746 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001746:	7139                	addi	sp,sp,-64
    80001748:	fc22                	sd	s0,56(sp)
    8000174a:	0080                	addi	s0,sp,64
    8000174c:	fca43c23          	sd	a0,-40(s0)
    80001750:	fcb43823          	sd	a1,-48(s0)
    80001754:	87b2                	mv	a5,a2
    80001756:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    8000175a:	fd843783          	ld	a5,-40(s0)
    8000175e:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    80001762:	fcc42783          	lw	a5,-52(s0)
    80001766:	2781                	sext.w	a5,a5
    80001768:	00f04563          	bgtz	a5,80001772 <safestrcpy+0x2c>
    return os;
    8000176c:	fe843783          	ld	a5,-24(s0)
    80001770:	a0a1                	j	800017b8 <safestrcpy+0x72>
  while(--n > 0 && (*s++ = *t++) != 0)
    80001772:	fcc42783          	lw	a5,-52(s0)
    80001776:	37fd                	addiw	a5,a5,-1
    80001778:	fcf42623          	sw	a5,-52(s0)
    8000177c:	fcc42783          	lw	a5,-52(s0)
    80001780:	2781                	sext.w	a5,a5
    80001782:	02f05563          	blez	a5,800017ac <safestrcpy+0x66>
    80001786:	fd043703          	ld	a4,-48(s0)
    8000178a:	00170793          	addi	a5,a4,1
    8000178e:	fcf43823          	sd	a5,-48(s0)
    80001792:	fd843783          	ld	a5,-40(s0)
    80001796:	00178693          	addi	a3,a5,1
    8000179a:	fcd43c23          	sd	a3,-40(s0)
    8000179e:	00074703          	lbu	a4,0(a4)
    800017a2:	00e78023          	sb	a4,0(a5)
    800017a6:	0007c783          	lbu	a5,0(a5)
    800017aa:	f7e1                	bnez	a5,80001772 <safestrcpy+0x2c>
    ;
  *s = 0;
    800017ac:	fd843783          	ld	a5,-40(s0)
    800017b0:	00078023          	sb	zero,0(a5)
  return os;
    800017b4:	fe843783          	ld	a5,-24(s0)
}
    800017b8:	853e                	mv	a0,a5
    800017ba:	7462                	ld	s0,56(sp)
    800017bc:	6121                	addi	sp,sp,64
    800017be:	8082                	ret

00000000800017c0 <strlen>:

int
strlen(const char *s)
{
    800017c0:	7179                	addi	sp,sp,-48
    800017c2:	f422                	sd	s0,40(sp)
    800017c4:	1800                	addi	s0,sp,48
    800017c6:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    800017ca:	fe042623          	sw	zero,-20(s0)
    800017ce:	a031                	j	800017da <strlen+0x1a>
    800017d0:	fec42783          	lw	a5,-20(s0)
    800017d4:	2785                	addiw	a5,a5,1
    800017d6:	fef42623          	sw	a5,-20(s0)
    800017da:	fec42783          	lw	a5,-20(s0)
    800017de:	fd843703          	ld	a4,-40(s0)
    800017e2:	97ba                	add	a5,a5,a4
    800017e4:	0007c783          	lbu	a5,0(a5)
    800017e8:	f7e5                	bnez	a5,800017d0 <strlen+0x10>
    ;
  return n;
    800017ea:	fec42783          	lw	a5,-20(s0)
}
    800017ee:	853e                	mv	a0,a5
    800017f0:	7422                	ld	s0,40(sp)
    800017f2:	6145                	addi	sp,sp,48
    800017f4:	8082                	ret

00000000800017f6 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800017f6:	1141                	addi	sp,sp,-16
    800017f8:	e406                	sd	ra,8(sp)
    800017fa:	e022                	sd	s0,0(sp)
    800017fc:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    800017fe:	00001097          	auipc	ra,0x1
    80001802:	fb8080e7          	jalr	-72(ra) # 800027b6 <cpuid>
    80001806:	87aa                	mv	a5,a0
    80001808:	efd5                	bnez	a5,800018c4 <main+0xce>
    consoleinit();
    8000180a:	fffff097          	auipc	ra,0xfffff
    8000180e:	048080e7          	jalr	72(ra) # 80000852 <consoleinit>
    printfinit();
    80001812:	fffff097          	auipc	ra,0xfffff
    80001816:	4be080e7          	jalr	1214(ra) # 80000cd0 <printfinit>
    printf("\n");
    8000181a:	0000a517          	auipc	a0,0xa
    8000181e:	86650513          	addi	a0,a0,-1946 # 8000b080 <etext+0x80>
    80001822:	fffff097          	auipc	ra,0xfffff
    80001826:	206080e7          	jalr	518(ra) # 80000a28 <printf>
    printf("xv6 kernel is booting\n");
    8000182a:	0000a517          	auipc	a0,0xa
    8000182e:	85e50513          	addi	a0,a0,-1954 # 8000b088 <etext+0x88>
    80001832:	fffff097          	auipc	ra,0xfffff
    80001836:	1f6080e7          	jalr	502(ra) # 80000a28 <printf>
    printf("\n");
    8000183a:	0000a517          	auipc	a0,0xa
    8000183e:	84650513          	addi	a0,a0,-1978 # 8000b080 <etext+0x80>
    80001842:	fffff097          	auipc	ra,0xfffff
    80001846:	1e6080e7          	jalr	486(ra) # 80000a28 <printf>
    kinit();         // physical page allocator
    8000184a:	fffff097          	auipc	ra,0xfffff
    8000184e:	794080e7          	jalr	1940(ra) # 80000fde <kinit>
    kvminit();       // create kernel page table
    80001852:	00000097          	auipc	ra,0x0
    80001856:	1f4080e7          	jalr	500(ra) # 80001a46 <kvminit>
    kvminithart();   // turn on paging
    8000185a:	00000097          	auipc	ra,0x0
    8000185e:	212080e7          	jalr	530(ra) # 80001a6c <kvminithart>
    procinit();      // process table
    80001862:	00001097          	auipc	ra,0x1
    80001866:	e8e080e7          	jalr	-370(ra) # 800026f0 <procinit>
    trapinit();      // trap vectors
    8000186a:	00002097          	auipc	ra,0x2
    8000186e:	68e080e7          	jalr	1678(ra) # 80003ef8 <trapinit>
    trapinithart();  // install kernel trap vector
    80001872:	00002097          	auipc	ra,0x2
    80001876:	6b0080e7          	jalr	1712(ra) # 80003f22 <trapinithart>
    plicinit();      // set up interrupt controller
    8000187a:	00007097          	auipc	ra,0x7
    8000187e:	6b0080e7          	jalr	1712(ra) # 80008f2a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001882:	00007097          	auipc	ra,0x7
    80001886:	6cc080e7          	jalr	1740(ra) # 80008f4e <plicinithart>
    binit();         // buffer cache
    8000188a:	00003097          	auipc	ra,0x3
    8000188e:	2c8080e7          	jalr	712(ra) # 80004b52 <binit>
    iinit();         // inode table
    80001892:	00004097          	auipc	ra,0x4
    80001896:	b14080e7          	jalr	-1260(ra) # 800053a6 <iinit>
    fileinit();      // file table
    8000189a:	00005097          	auipc	ra,0x5
    8000189e:	4b6080e7          	jalr	1206(ra) # 80006d50 <fileinit>
    virtio_disk_init(); // emulated hard disk
    800018a2:	00007097          	auipc	ra,0x7
    800018a6:	780080e7          	jalr	1920(ra) # 80009022 <virtio_disk_init>
    userinit();      // first user process
    800018aa:	00001097          	auipc	ra,0x1
    800018ae:	31a080e7          	jalr	794(ra) # 80002bc4 <userinit>
    __sync_synchronize();
    800018b2:	0ff0000f          	fence
    started = 1;
    800018b6:	00013797          	auipc	a5,0x13
    800018ba:	9fa78793          	addi	a5,a5,-1542 # 800142b0 <started>
    800018be:	4705                	li	a4,1
    800018c0:	c398                	sw	a4,0(a5)
    800018c2:	a0a9                	j	8000190c <main+0x116>
  } else {
    while(started == 0)
    800018c4:	0001                	nop
    800018c6:	00013797          	auipc	a5,0x13
    800018ca:	9ea78793          	addi	a5,a5,-1558 # 800142b0 <started>
    800018ce:	439c                	lw	a5,0(a5)
    800018d0:	2781                	sext.w	a5,a5
    800018d2:	dbf5                	beqz	a5,800018c6 <main+0xd0>
      ;
    __sync_synchronize();
    800018d4:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800018d8:	00001097          	auipc	ra,0x1
    800018dc:	ede080e7          	jalr	-290(ra) # 800027b6 <cpuid>
    800018e0:	87aa                	mv	a5,a0
    800018e2:	85be                	mv	a1,a5
    800018e4:	00009517          	auipc	a0,0x9
    800018e8:	7bc50513          	addi	a0,a0,1980 # 8000b0a0 <etext+0xa0>
    800018ec:	fffff097          	auipc	ra,0xfffff
    800018f0:	13c080e7          	jalr	316(ra) # 80000a28 <printf>
    kvminithart();    // turn on paging
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	178080e7          	jalr	376(ra) # 80001a6c <kvminithart>
    trapinithart();   // install kernel trap vector
    800018fc:	00002097          	auipc	ra,0x2
    80001900:	626080e7          	jalr	1574(ra) # 80003f22 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001904:	00007097          	auipc	ra,0x7
    80001908:	64a080e7          	jalr	1610(ra) # 80008f4e <plicinithart>
  }

  scheduler();        
    8000190c:	00002097          	auipc	ra,0x2
    80001910:	98e080e7          	jalr	-1650(ra) # 8000329a <scheduler>

0000000080001914 <w_satp>:
{
    80001914:	1101                	addi	sp,sp,-32
    80001916:	ec22                	sd	s0,24(sp)
    80001918:	1000                	addi	s0,sp,32
    8000191a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    8000191e:	fe843783          	ld	a5,-24(s0)
    80001922:	18079073          	csrw	satp,a5
}
    80001926:	0001                	nop
    80001928:	6462                	ld	s0,24(sp)
    8000192a:	6105                	addi	sp,sp,32
    8000192c:	8082                	ret

000000008000192e <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    8000192e:	1141                	addi	sp,sp,-16
    80001930:	e422                	sd	s0,8(sp)
    80001932:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001934:	12000073          	sfence.vma
}
    80001938:	0001                	nop
    8000193a:	6422                	ld	s0,8(sp)
    8000193c:	0141                	addi	sp,sp,16
    8000193e:	8082                	ret

0000000080001940 <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001940:	1101                	addi	sp,sp,-32
    80001942:	ec06                	sd	ra,24(sp)
    80001944:	e822                	sd	s0,16(sp)
    80001946:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001948:	fffff097          	auipc	ra,0xfffff
    8000194c:	7d2080e7          	jalr	2002(ra) # 8000111a <kalloc>
    80001950:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001954:	6605                	lui	a2,0x1
    80001956:	4581                	li	a1,0
    80001958:	fe843503          	ld	a0,-24(s0)
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	ae6080e7          	jalr	-1306(ra) # 80001442 <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001964:	4719                	li	a4,6
    80001966:	6685                	lui	a3,0x1
    80001968:	10000637          	lui	a2,0x10000
    8000196c:	100005b7          	lui	a1,0x10000
    80001970:	fe843503          	ld	a0,-24(s0)
    80001974:	00000097          	auipc	ra,0x0
    80001978:	298080e7          	jalr	664(ra) # 80001c0c <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    8000197c:	4719                	li	a4,6
    8000197e:	6685                	lui	a3,0x1
    80001980:	10001637          	lui	a2,0x10001
    80001984:	100015b7          	lui	a1,0x10001
    80001988:	fe843503          	ld	a0,-24(s0)
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	280080e7          	jalr	640(ra) # 80001c0c <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001994:	4719                	li	a4,6
    80001996:	004006b7          	lui	a3,0x400
    8000199a:	0c000637          	lui	a2,0xc000
    8000199e:	0c0005b7          	lui	a1,0xc000
    800019a2:	fe843503          	ld	a0,-24(s0)
    800019a6:	00000097          	auipc	ra,0x0
    800019aa:	266080e7          	jalr	614(ra) # 80001c0c <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    800019ae:	00009717          	auipc	a4,0x9
    800019b2:	65270713          	addi	a4,a4,1618 # 8000b000 <etext>
    800019b6:	800007b7          	lui	a5,0x80000
    800019ba:	97ba                	add	a5,a5,a4
    800019bc:	4729                	li	a4,10
    800019be:	86be                	mv	a3,a5
    800019c0:	4785                	li	a5,1
    800019c2:	01f79613          	slli	a2,a5,0x1f
    800019c6:	4785                	li	a5,1
    800019c8:	01f79593          	slli	a1,a5,0x1f
    800019cc:	fe843503          	ld	a0,-24(s0)
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	23c080e7          	jalr	572(ra) # 80001c0c <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    800019d8:	00009597          	auipc	a1,0x9
    800019dc:	62858593          	addi	a1,a1,1576 # 8000b000 <etext>
    800019e0:	00009617          	auipc	a2,0x9
    800019e4:	62060613          	addi	a2,a2,1568 # 8000b000 <etext>
    800019e8:	00009797          	auipc	a5,0x9
    800019ec:	61878793          	addi	a5,a5,1560 # 8000b000 <etext>
    800019f0:	4745                	li	a4,17
    800019f2:	076e                	slli	a4,a4,0x1b
    800019f4:	40f707b3          	sub	a5,a4,a5
    800019f8:	4719                	li	a4,6
    800019fa:	86be                	mv	a3,a5
    800019fc:	fe843503          	ld	a0,-24(s0)
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	20c080e7          	jalr	524(ra) # 80001c0c <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001a08:	00008797          	auipc	a5,0x8
    80001a0c:	5f878793          	addi	a5,a5,1528 # 8000a000 <_trampoline>
    80001a10:	4729                	li	a4,10
    80001a12:	6685                	lui	a3,0x1
    80001a14:	863e                	mv	a2,a5
    80001a16:	040007b7          	lui	a5,0x4000
    80001a1a:	17fd                	addi	a5,a5,-1
    80001a1c:	00c79593          	slli	a1,a5,0xc
    80001a20:	fe843503          	ld	a0,-24(s0)
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	1e8080e7          	jalr	488(ra) # 80001c0c <kvmmap>

  // map kernel stacks
  proc_mapstacks(kpgtbl);
    80001a2c:	fe843503          	ld	a0,-24(s0)
    80001a30:	00001097          	auipc	ra,0x1
    80001a34:	c04080e7          	jalr	-1020(ra) # 80002634 <proc_mapstacks>
  
  return kpgtbl;
    80001a38:	fe843783          	ld	a5,-24(s0)
}
    80001a3c:	853e                	mv	a0,a5
    80001a3e:	60e2                	ld	ra,24(sp)
    80001a40:	6442                	ld	s0,16(sp)
    80001a42:	6105                	addi	sp,sp,32
    80001a44:	8082                	ret

0000000080001a46 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001a46:	1141                	addi	sp,sp,-16
    80001a48:	e406                	sd	ra,8(sp)
    80001a4a:	e022                	sd	s0,0(sp)
    80001a4c:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001a4e:	00000097          	auipc	ra,0x0
    80001a52:	ef2080e7          	jalr	-270(ra) # 80001940 <kvmmake>
    80001a56:	872a                	mv	a4,a0
    80001a58:	0000a797          	auipc	a5,0xa
    80001a5c:	5c078793          	addi	a5,a5,1472 # 8000c018 <kernel_pagetable>
    80001a60:	e398                	sd	a4,0(a5)
}
    80001a62:	0001                	nop
    80001a64:	60a2                	ld	ra,8(sp)
    80001a66:	6402                	ld	s0,0(sp)
    80001a68:	0141                	addi	sp,sp,16
    80001a6a:	8082                	ret

0000000080001a6c <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001a6c:	1141                	addi	sp,sp,-16
    80001a6e:	e406                	sd	ra,8(sp)
    80001a70:	e022                	sd	s0,0(sp)
    80001a72:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80001a74:	0000a797          	auipc	a5,0xa
    80001a78:	5a478793          	addi	a5,a5,1444 # 8000c018 <kernel_pagetable>
    80001a7c:	639c                	ld	a5,0(a5)
    80001a7e:	00c7d713          	srli	a4,a5,0xc
    80001a82:	57fd                	li	a5,-1
    80001a84:	17fe                	slli	a5,a5,0x3f
    80001a86:	8fd9                	or	a5,a5,a4
    80001a88:	853e                	mv	a0,a5
    80001a8a:	00000097          	auipc	ra,0x0
    80001a8e:	e8a080e7          	jalr	-374(ra) # 80001914 <w_satp>
  sfence_vma();
    80001a92:	00000097          	auipc	ra,0x0
    80001a96:	e9c080e7          	jalr	-356(ra) # 8000192e <sfence_vma>
}
    80001a9a:	0001                	nop
    80001a9c:	60a2                	ld	ra,8(sp)
    80001a9e:	6402                	ld	s0,0(sp)
    80001aa0:	0141                	addi	sp,sp,16
    80001aa2:	8082                	ret

0000000080001aa4 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001aa4:	7139                	addi	sp,sp,-64
    80001aa6:	fc06                	sd	ra,56(sp)
    80001aa8:	f822                	sd	s0,48(sp)
    80001aaa:	0080                	addi	s0,sp,64
    80001aac:	fca43c23          	sd	a0,-40(s0)
    80001ab0:	fcb43823          	sd	a1,-48(s0)
    80001ab4:	87b2                	mv	a5,a2
    80001ab6:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001aba:	fd043703          	ld	a4,-48(s0)
    80001abe:	57fd                	li	a5,-1
    80001ac0:	83e9                	srli	a5,a5,0x1a
    80001ac2:	00e7fa63          	bgeu	a5,a4,80001ad6 <walk+0x32>
    panic("walk");
    80001ac6:	00009517          	auipc	a0,0x9
    80001aca:	5f250513          	addi	a0,a0,1522 # 8000b0b8 <etext+0xb8>
    80001ace:	fffff097          	auipc	ra,0xfffff
    80001ad2:	1b0080e7          	jalr	432(ra) # 80000c7e <panic>

  for(int level = 2; level > 0; level--) {
    80001ad6:	4789                	li	a5,2
    80001ad8:	fef42623          	sw	a5,-20(s0)
    80001adc:	a849                	j	80001b6e <walk+0xca>
    pte_t *pte = &pagetable[PX(level, va)];
    80001ade:	fec42703          	lw	a4,-20(s0)
    80001ae2:	87ba                	mv	a5,a4
    80001ae4:	0037979b          	slliw	a5,a5,0x3
    80001ae8:	9fb9                	addw	a5,a5,a4
    80001aea:	2781                	sext.w	a5,a5
    80001aec:	27b1                	addiw	a5,a5,12
    80001aee:	2781                	sext.w	a5,a5
    80001af0:	873e                	mv	a4,a5
    80001af2:	fd043783          	ld	a5,-48(s0)
    80001af6:	00e7d7b3          	srl	a5,a5,a4
    80001afa:	1ff7f793          	andi	a5,a5,511
    80001afe:	078e                	slli	a5,a5,0x3
    80001b00:	fd843703          	ld	a4,-40(s0)
    80001b04:	97ba                	add	a5,a5,a4
    80001b06:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001b0a:	fe043783          	ld	a5,-32(s0)
    80001b0e:	639c                	ld	a5,0(a5)
    80001b10:	8b85                	andi	a5,a5,1
    80001b12:	cb89                	beqz	a5,80001b24 <walk+0x80>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001b14:	fe043783          	ld	a5,-32(s0)
    80001b18:	639c                	ld	a5,0(a5)
    80001b1a:	83a9                	srli	a5,a5,0xa
    80001b1c:	07b2                	slli	a5,a5,0xc
    80001b1e:	fcf43c23          	sd	a5,-40(s0)
    80001b22:	a089                	j	80001b64 <walk+0xc0>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001b24:	fcc42783          	lw	a5,-52(s0)
    80001b28:	2781                	sext.w	a5,a5
    80001b2a:	cb91                	beqz	a5,80001b3e <walk+0x9a>
    80001b2c:	fffff097          	auipc	ra,0xfffff
    80001b30:	5ee080e7          	jalr	1518(ra) # 8000111a <kalloc>
    80001b34:	fca43c23          	sd	a0,-40(s0)
    80001b38:	fd843783          	ld	a5,-40(s0)
    80001b3c:	e399                	bnez	a5,80001b42 <walk+0x9e>
        return 0;
    80001b3e:	4781                	li	a5,0
    80001b40:	a0a9                	j	80001b8a <walk+0xe6>
      memset(pagetable, 0, PGSIZE);
    80001b42:	6605                	lui	a2,0x1
    80001b44:	4581                	li	a1,0
    80001b46:	fd843503          	ld	a0,-40(s0)
    80001b4a:	00000097          	auipc	ra,0x0
    80001b4e:	8f8080e7          	jalr	-1800(ra) # 80001442 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001b52:	fd843783          	ld	a5,-40(s0)
    80001b56:	83b1                	srli	a5,a5,0xc
    80001b58:	07aa                	slli	a5,a5,0xa
    80001b5a:	0017e713          	ori	a4,a5,1
    80001b5e:	fe043783          	ld	a5,-32(s0)
    80001b62:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001b64:	fec42783          	lw	a5,-20(s0)
    80001b68:	37fd                	addiw	a5,a5,-1
    80001b6a:	fef42623          	sw	a5,-20(s0)
    80001b6e:	fec42783          	lw	a5,-20(s0)
    80001b72:	2781                	sext.w	a5,a5
    80001b74:	f6f045e3          	bgtz	a5,80001ade <walk+0x3a>
    }
  }
  return &pagetable[PX(0, va)];
    80001b78:	fd043783          	ld	a5,-48(s0)
    80001b7c:	83b1                	srli	a5,a5,0xc
    80001b7e:	1ff7f793          	andi	a5,a5,511
    80001b82:	078e                	slli	a5,a5,0x3
    80001b84:	fd843703          	ld	a4,-40(s0)
    80001b88:	97ba                	add	a5,a5,a4
}
    80001b8a:	853e                	mv	a0,a5
    80001b8c:	70e2                	ld	ra,56(sp)
    80001b8e:	7442                	ld	s0,48(sp)
    80001b90:	6121                	addi	sp,sp,64
    80001b92:	8082                	ret

0000000080001b94 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001b94:	7179                	addi	sp,sp,-48
    80001b96:	f406                	sd	ra,40(sp)
    80001b98:	f022                	sd	s0,32(sp)
    80001b9a:	1800                	addi	s0,sp,48
    80001b9c:	fca43c23          	sd	a0,-40(s0)
    80001ba0:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001ba4:	fd043703          	ld	a4,-48(s0)
    80001ba8:	57fd                	li	a5,-1
    80001baa:	83e9                	srli	a5,a5,0x1a
    80001bac:	00e7f463          	bgeu	a5,a4,80001bb4 <walkaddr+0x20>
    return 0;
    80001bb0:	4781                	li	a5,0
    80001bb2:	a881                	j	80001c02 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001bb4:	4601                	li	a2,0
    80001bb6:	fd043583          	ld	a1,-48(s0)
    80001bba:	fd843503          	ld	a0,-40(s0)
    80001bbe:	00000097          	auipc	ra,0x0
    80001bc2:	ee6080e7          	jalr	-282(ra) # 80001aa4 <walk>
    80001bc6:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001bca:	fe843783          	ld	a5,-24(s0)
    80001bce:	e399                	bnez	a5,80001bd4 <walkaddr+0x40>
    return 0;
    80001bd0:	4781                	li	a5,0
    80001bd2:	a805                	j	80001c02 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001bd4:	fe843783          	ld	a5,-24(s0)
    80001bd8:	639c                	ld	a5,0(a5)
    80001bda:	8b85                	andi	a5,a5,1
    80001bdc:	e399                	bnez	a5,80001be2 <walkaddr+0x4e>
    return 0;
    80001bde:	4781                	li	a5,0
    80001be0:	a00d                	j	80001c02 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001be2:	fe843783          	ld	a5,-24(s0)
    80001be6:	639c                	ld	a5,0(a5)
    80001be8:	8bc1                	andi	a5,a5,16
    80001bea:	e399                	bnez	a5,80001bf0 <walkaddr+0x5c>
    return 0;
    80001bec:	4781                	li	a5,0
    80001bee:	a811                	j	80001c02 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001bf0:	fe843783          	ld	a5,-24(s0)
    80001bf4:	639c                	ld	a5,0(a5)
    80001bf6:	83a9                	srli	a5,a5,0xa
    80001bf8:	07b2                	slli	a5,a5,0xc
    80001bfa:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001bfe:	fe043783          	ld	a5,-32(s0)
}
    80001c02:	853e                	mv	a0,a5
    80001c04:	70a2                	ld	ra,40(sp)
    80001c06:	7402                	ld	s0,32(sp)
    80001c08:	6145                	addi	sp,sp,48
    80001c0a:	8082                	ret

0000000080001c0c <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001c0c:	7139                	addi	sp,sp,-64
    80001c0e:	fc06                	sd	ra,56(sp)
    80001c10:	f822                	sd	s0,48(sp)
    80001c12:	0080                	addi	s0,sp,64
    80001c14:	fea43423          	sd	a0,-24(s0)
    80001c18:	feb43023          	sd	a1,-32(s0)
    80001c1c:	fcc43c23          	sd	a2,-40(s0)
    80001c20:	fcd43823          	sd	a3,-48(s0)
    80001c24:	87ba                	mv	a5,a4
    80001c26:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001c2a:	fcc42783          	lw	a5,-52(s0)
    80001c2e:	873e                	mv	a4,a5
    80001c30:	fd843683          	ld	a3,-40(s0)
    80001c34:	fd043603          	ld	a2,-48(s0)
    80001c38:	fe043583          	ld	a1,-32(s0)
    80001c3c:	fe843503          	ld	a0,-24(s0)
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	026080e7          	jalr	38(ra) # 80001c66 <mappages>
    80001c48:	87aa                	mv	a5,a0
    80001c4a:	cb89                	beqz	a5,80001c5c <kvmmap+0x50>
    panic("kvmmap");
    80001c4c:	00009517          	auipc	a0,0x9
    80001c50:	47450513          	addi	a0,a0,1140 # 8000b0c0 <etext+0xc0>
    80001c54:	fffff097          	auipc	ra,0xfffff
    80001c58:	02a080e7          	jalr	42(ra) # 80000c7e <panic>
}
    80001c5c:	0001                	nop
    80001c5e:	70e2                	ld	ra,56(sp)
    80001c60:	7442                	ld	s0,48(sp)
    80001c62:	6121                	addi	sp,sp,64
    80001c64:	8082                	ret

0000000080001c66 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001c66:	711d                	addi	sp,sp,-96
    80001c68:	ec86                	sd	ra,88(sp)
    80001c6a:	e8a2                	sd	s0,80(sp)
    80001c6c:	1080                	addi	s0,sp,96
    80001c6e:	fca43423          	sd	a0,-56(s0)
    80001c72:	fcb43023          	sd	a1,-64(s0)
    80001c76:	fac43c23          	sd	a2,-72(s0)
    80001c7a:	fad43823          	sd	a3,-80(s0)
    80001c7e:	87ba                	mv	a5,a4
    80001c80:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001c84:	fb843783          	ld	a5,-72(s0)
    80001c88:	eb89                	bnez	a5,80001c9a <mappages+0x34>
    panic("mappages: size");
    80001c8a:	00009517          	auipc	a0,0x9
    80001c8e:	43e50513          	addi	a0,a0,1086 # 8000b0c8 <etext+0xc8>
    80001c92:	fffff097          	auipc	ra,0xfffff
    80001c96:	fec080e7          	jalr	-20(ra) # 80000c7e <panic>
  
  a = PGROUNDDOWN(va);
    80001c9a:	fc043703          	ld	a4,-64(s0)
    80001c9e:	77fd                	lui	a5,0xfffff
    80001ca0:	8ff9                	and	a5,a5,a4
    80001ca2:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001ca6:	fc043703          	ld	a4,-64(s0)
    80001caa:	fb843783          	ld	a5,-72(s0)
    80001cae:	97ba                	add	a5,a5,a4
    80001cb0:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffd5fff>
    80001cb4:	77fd                	lui	a5,0xfffff
    80001cb6:	8ff9                	and	a5,a5,a4
    80001cb8:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001cbc:	4605                	li	a2,1
    80001cbe:	fe843583          	ld	a1,-24(s0)
    80001cc2:	fc843503          	ld	a0,-56(s0)
    80001cc6:	00000097          	auipc	ra,0x0
    80001cca:	dde080e7          	jalr	-546(ra) # 80001aa4 <walk>
    80001cce:	fca43c23          	sd	a0,-40(s0)
    80001cd2:	fd843783          	ld	a5,-40(s0)
    80001cd6:	e399                	bnez	a5,80001cdc <mappages+0x76>
      return -1;
    80001cd8:	57fd                	li	a5,-1
    80001cda:	a085                	j	80001d3a <mappages+0xd4>
    if(*pte & PTE_V)
    80001cdc:	fd843783          	ld	a5,-40(s0)
    80001ce0:	639c                	ld	a5,0(a5)
    80001ce2:	8b85                	andi	a5,a5,1
    80001ce4:	cb89                	beqz	a5,80001cf6 <mappages+0x90>
      panic("mappages: remap");
    80001ce6:	00009517          	auipc	a0,0x9
    80001cea:	3f250513          	addi	a0,a0,1010 # 8000b0d8 <etext+0xd8>
    80001cee:	fffff097          	auipc	ra,0xfffff
    80001cf2:	f90080e7          	jalr	-112(ra) # 80000c7e <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001cf6:	fb043783          	ld	a5,-80(s0)
    80001cfa:	83b1                	srli	a5,a5,0xc
    80001cfc:	00a79713          	slli	a4,a5,0xa
    80001d00:	fac42783          	lw	a5,-84(s0)
    80001d04:	8fd9                	or	a5,a5,a4
    80001d06:	0017e713          	ori	a4,a5,1
    80001d0a:	fd843783          	ld	a5,-40(s0)
    80001d0e:	e398                	sd	a4,0(a5)
    if(a == last)
    80001d10:	fe843703          	ld	a4,-24(s0)
    80001d14:	fe043783          	ld	a5,-32(s0)
    80001d18:	00f70f63          	beq	a4,a5,80001d36 <mappages+0xd0>
      break;
    a += PGSIZE;
    80001d1c:	fe843703          	ld	a4,-24(s0)
    80001d20:	6785                	lui	a5,0x1
    80001d22:	97ba                	add	a5,a5,a4
    80001d24:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001d28:	fb043703          	ld	a4,-80(s0)
    80001d2c:	6785                	lui	a5,0x1
    80001d2e:	97ba                	add	a5,a5,a4
    80001d30:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001d34:	b761                	j	80001cbc <mappages+0x56>
      break;
    80001d36:	0001                	nop
  }
  return 0;
    80001d38:	4781                	li	a5,0
}
    80001d3a:	853e                	mv	a0,a5
    80001d3c:	60e6                	ld	ra,88(sp)
    80001d3e:	6446                	ld	s0,80(sp)
    80001d40:	6125                	addi	sp,sp,96
    80001d42:	8082                	ret

0000000080001d44 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001d44:	715d                	addi	sp,sp,-80
    80001d46:	e486                	sd	ra,72(sp)
    80001d48:	e0a2                	sd	s0,64(sp)
    80001d4a:	0880                	addi	s0,sp,80
    80001d4c:	fca43423          	sd	a0,-56(s0)
    80001d50:	fcb43023          	sd	a1,-64(s0)
    80001d54:	fac43c23          	sd	a2,-72(s0)
    80001d58:	87b6                	mv	a5,a3
    80001d5a:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001d5e:	fc043703          	ld	a4,-64(s0)
    80001d62:	6785                	lui	a5,0x1
    80001d64:	17fd                	addi	a5,a5,-1
    80001d66:	8ff9                	and	a5,a5,a4
    80001d68:	cb89                	beqz	a5,80001d7a <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001d6a:	00009517          	auipc	a0,0x9
    80001d6e:	37e50513          	addi	a0,a0,894 # 8000b0e8 <etext+0xe8>
    80001d72:	fffff097          	auipc	ra,0xfffff
    80001d76:	f0c080e7          	jalr	-244(ra) # 80000c7e <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001d7a:	fc043783          	ld	a5,-64(s0)
    80001d7e:	fef43423          	sd	a5,-24(s0)
    80001d82:	a045                	j	80001e22 <uvmunmap+0xde>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001d84:	4601                	li	a2,0
    80001d86:	fe843583          	ld	a1,-24(s0)
    80001d8a:	fc843503          	ld	a0,-56(s0)
    80001d8e:	00000097          	auipc	ra,0x0
    80001d92:	d16080e7          	jalr	-746(ra) # 80001aa4 <walk>
    80001d96:	fea43023          	sd	a0,-32(s0)
    80001d9a:	fe043783          	ld	a5,-32(s0)
    80001d9e:	eb89                	bnez	a5,80001db0 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001da0:	00009517          	auipc	a0,0x9
    80001da4:	36050513          	addi	a0,a0,864 # 8000b100 <etext+0x100>
    80001da8:	fffff097          	auipc	ra,0xfffff
    80001dac:	ed6080e7          	jalr	-298(ra) # 80000c7e <panic>
    if((*pte & PTE_V) == 0)
    80001db0:	fe043783          	ld	a5,-32(s0)
    80001db4:	639c                	ld	a5,0(a5)
    80001db6:	8b85                	andi	a5,a5,1
    80001db8:	eb89                	bnez	a5,80001dca <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80001dba:	00009517          	auipc	a0,0x9
    80001dbe:	35650513          	addi	a0,a0,854 # 8000b110 <etext+0x110>
    80001dc2:	fffff097          	auipc	ra,0xfffff
    80001dc6:	ebc080e7          	jalr	-324(ra) # 80000c7e <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001dca:	fe043783          	ld	a5,-32(s0)
    80001dce:	639c                	ld	a5,0(a5)
    80001dd0:	3ff7f713          	andi	a4,a5,1023
    80001dd4:	4785                	li	a5,1
    80001dd6:	00f71a63          	bne	a4,a5,80001dea <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80001dda:	00009517          	auipc	a0,0x9
    80001dde:	34e50513          	addi	a0,a0,846 # 8000b128 <etext+0x128>
    80001de2:	fffff097          	auipc	ra,0xfffff
    80001de6:	e9c080e7          	jalr	-356(ra) # 80000c7e <panic>
    if(do_free){
    80001dea:	fb442783          	lw	a5,-76(s0)
    80001dee:	2781                	sext.w	a5,a5
    80001df0:	cf99                	beqz	a5,80001e0e <uvmunmap+0xca>
      uint64 pa = PTE2PA(*pte);
    80001df2:	fe043783          	ld	a5,-32(s0)
    80001df6:	639c                	ld	a5,0(a5)
    80001df8:	83a9                	srli	a5,a5,0xa
    80001dfa:	07b2                	slli	a5,a5,0xc
    80001dfc:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80001e00:	fd843783          	ld	a5,-40(s0)
    80001e04:	853e                	mv	a0,a5
    80001e06:	fffff097          	auipc	ra,0xfffff
    80001e0a:	270080e7          	jalr	624(ra) # 80001076 <kfree>
    }
    *pte = 0;
    80001e0e:	fe043783          	ld	a5,-32(s0)
    80001e12:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001e16:	fe843703          	ld	a4,-24(s0)
    80001e1a:	6785                	lui	a5,0x1
    80001e1c:	97ba                	add	a5,a5,a4
    80001e1e:	fef43423          	sd	a5,-24(s0)
    80001e22:	fb843783          	ld	a5,-72(s0)
    80001e26:	00c79713          	slli	a4,a5,0xc
    80001e2a:	fc043783          	ld	a5,-64(s0)
    80001e2e:	97ba                	add	a5,a5,a4
    80001e30:	fe843703          	ld	a4,-24(s0)
    80001e34:	f4f768e3          	bltu	a4,a5,80001d84 <uvmunmap+0x40>
  }
}
    80001e38:	0001                	nop
    80001e3a:	0001                	nop
    80001e3c:	60a6                	ld	ra,72(sp)
    80001e3e:	6406                	ld	s0,64(sp)
    80001e40:	6161                	addi	sp,sp,80
    80001e42:	8082                	ret

0000000080001e44 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80001e44:	1101                	addi	sp,sp,-32
    80001e46:	ec06                	sd	ra,24(sp)
    80001e48:	e822                	sd	s0,16(sp)
    80001e4a:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80001e4c:	fffff097          	auipc	ra,0xfffff
    80001e50:	2ce080e7          	jalr	718(ra) # 8000111a <kalloc>
    80001e54:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80001e58:	fe843783          	ld	a5,-24(s0)
    80001e5c:	e399                	bnez	a5,80001e62 <uvmcreate+0x1e>
    return 0;
    80001e5e:	4781                	li	a5,0
    80001e60:	a819                	j	80001e76 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80001e62:	6605                	lui	a2,0x1
    80001e64:	4581                	li	a1,0
    80001e66:	fe843503          	ld	a0,-24(s0)
    80001e6a:	fffff097          	auipc	ra,0xfffff
    80001e6e:	5d8080e7          	jalr	1496(ra) # 80001442 <memset>
  return pagetable;
    80001e72:	fe843783          	ld	a5,-24(s0)
}
    80001e76:	853e                	mv	a0,a5
    80001e78:	60e2                	ld	ra,24(sp)
    80001e7a:	6442                	ld	s0,16(sp)
    80001e7c:	6105                	addi	sp,sp,32
    80001e7e:	8082                	ret

0000000080001e80 <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, uchar *src, uint sz)
{
    80001e80:	7139                	addi	sp,sp,-64
    80001e82:	fc06                	sd	ra,56(sp)
    80001e84:	f822                	sd	s0,48(sp)
    80001e86:	0080                	addi	s0,sp,64
    80001e88:	fca43c23          	sd	a0,-40(s0)
    80001e8c:	fcb43823          	sd	a1,-48(s0)
    80001e90:	87b2                	mv	a5,a2
    80001e92:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80001e96:	fcc42783          	lw	a5,-52(s0)
    80001e9a:	0007871b          	sext.w	a4,a5
    80001e9e:	6785                	lui	a5,0x1
    80001ea0:	00f76a63          	bltu	a4,a5,80001eb4 <uvminit+0x34>
    panic("inituvm: more than a page");
    80001ea4:	00009517          	auipc	a0,0x9
    80001ea8:	29c50513          	addi	a0,a0,668 # 8000b140 <etext+0x140>
    80001eac:	fffff097          	auipc	ra,0xfffff
    80001eb0:	dd2080e7          	jalr	-558(ra) # 80000c7e <panic>
  mem = kalloc();
    80001eb4:	fffff097          	auipc	ra,0xfffff
    80001eb8:	266080e7          	jalr	614(ra) # 8000111a <kalloc>
    80001ebc:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80001ec0:	6605                	lui	a2,0x1
    80001ec2:	4581                	li	a1,0
    80001ec4:	fe843503          	ld	a0,-24(s0)
    80001ec8:	fffff097          	auipc	ra,0xfffff
    80001ecc:	57a080e7          	jalr	1402(ra) # 80001442 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80001ed0:	fe843783          	ld	a5,-24(s0)
    80001ed4:	4779                	li	a4,30
    80001ed6:	86be                	mv	a3,a5
    80001ed8:	6605                	lui	a2,0x1
    80001eda:	4581                	li	a1,0
    80001edc:	fd843503          	ld	a0,-40(s0)
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	d86080e7          	jalr	-634(ra) # 80001c66 <mappages>
  memmove(mem, src, sz);
    80001ee8:	fcc42783          	lw	a5,-52(s0)
    80001eec:	863e                	mv	a2,a5
    80001eee:	fd043583          	ld	a1,-48(s0)
    80001ef2:	fe843503          	ld	a0,-24(s0)
    80001ef6:	fffff097          	auipc	ra,0xfffff
    80001efa:	630080e7          	jalr	1584(ra) # 80001526 <memmove>
}
    80001efe:	0001                	nop
    80001f00:	70e2                	ld	ra,56(sp)
    80001f02:	7442                	ld	s0,48(sp)
    80001f04:	6121                	addi	sp,sp,64
    80001f06:	8082                	ret

0000000080001f08 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001f08:	7139                	addi	sp,sp,-64
    80001f0a:	fc06                	sd	ra,56(sp)
    80001f0c:	f822                	sd	s0,48(sp)
    80001f0e:	0080                	addi	s0,sp,64
    80001f10:	fca43c23          	sd	a0,-40(s0)
    80001f14:	fcb43823          	sd	a1,-48(s0)
    80001f18:	fcc43423          	sd	a2,-56(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80001f1c:	fc843703          	ld	a4,-56(s0)
    80001f20:	fd043783          	ld	a5,-48(s0)
    80001f24:	00f77563          	bgeu	a4,a5,80001f2e <uvmalloc+0x26>
    return oldsz;
    80001f28:	fd043783          	ld	a5,-48(s0)
    80001f2c:	a85d                	j	80001fe2 <uvmalloc+0xda>

  oldsz = PGROUNDUP(oldsz);
    80001f2e:	fd043703          	ld	a4,-48(s0)
    80001f32:	6785                	lui	a5,0x1
    80001f34:	17fd                	addi	a5,a5,-1
    80001f36:	973e                	add	a4,a4,a5
    80001f38:	77fd                	lui	a5,0xfffff
    80001f3a:	8ff9                	and	a5,a5,a4
    80001f3c:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001f40:	fd043783          	ld	a5,-48(s0)
    80001f44:	fef43423          	sd	a5,-24(s0)
    80001f48:	a069                	j	80001fd2 <uvmalloc+0xca>
    mem = kalloc();
    80001f4a:	fffff097          	auipc	ra,0xfffff
    80001f4e:	1d0080e7          	jalr	464(ra) # 8000111a <kalloc>
    80001f52:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80001f56:	fe043783          	ld	a5,-32(s0)
    80001f5a:	ef89                	bnez	a5,80001f74 <uvmalloc+0x6c>
      uvmdealloc(pagetable, a, oldsz);
    80001f5c:	fd043603          	ld	a2,-48(s0)
    80001f60:	fe843583          	ld	a1,-24(s0)
    80001f64:	fd843503          	ld	a0,-40(s0)
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	084080e7          	jalr	132(ra) # 80001fec <uvmdealloc>
      return 0;
    80001f70:	4781                	li	a5,0
    80001f72:	a885                	j	80001fe2 <uvmalloc+0xda>
    }
    memset(mem, 0, PGSIZE);
    80001f74:	6605                	lui	a2,0x1
    80001f76:	4581                	li	a1,0
    80001f78:	fe043503          	ld	a0,-32(s0)
    80001f7c:	fffff097          	auipc	ra,0xfffff
    80001f80:	4c6080e7          	jalr	1222(ra) # 80001442 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0){
    80001f84:	fe043783          	ld	a5,-32(s0)
    80001f88:	4779                	li	a4,30
    80001f8a:	86be                	mv	a3,a5
    80001f8c:	6605                	lui	a2,0x1
    80001f8e:	fe843583          	ld	a1,-24(s0)
    80001f92:	fd843503          	ld	a0,-40(s0)
    80001f96:	00000097          	auipc	ra,0x0
    80001f9a:	cd0080e7          	jalr	-816(ra) # 80001c66 <mappages>
    80001f9e:	87aa                	mv	a5,a0
    80001fa0:	c39d                	beqz	a5,80001fc6 <uvmalloc+0xbe>
      kfree(mem);
    80001fa2:	fe043503          	ld	a0,-32(s0)
    80001fa6:	fffff097          	auipc	ra,0xfffff
    80001faa:	0d0080e7          	jalr	208(ra) # 80001076 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80001fae:	fd043603          	ld	a2,-48(s0)
    80001fb2:	fe843583          	ld	a1,-24(s0)
    80001fb6:	fd843503          	ld	a0,-40(s0)
    80001fba:	00000097          	auipc	ra,0x0
    80001fbe:	032080e7          	jalr	50(ra) # 80001fec <uvmdealloc>
      return 0;
    80001fc2:	4781                	li	a5,0
    80001fc4:	a839                	j	80001fe2 <uvmalloc+0xda>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001fc6:	fe843703          	ld	a4,-24(s0)
    80001fca:	6785                	lui	a5,0x1
    80001fcc:	97ba                	add	a5,a5,a4
    80001fce:	fef43423          	sd	a5,-24(s0)
    80001fd2:	fe843703          	ld	a4,-24(s0)
    80001fd6:	fc843783          	ld	a5,-56(s0)
    80001fda:	f6f768e3          	bltu	a4,a5,80001f4a <uvmalloc+0x42>
    }
  }
  return newsz;
    80001fde:	fc843783          	ld	a5,-56(s0)
}
    80001fe2:	853e                	mv	a0,a5
    80001fe4:	70e2                	ld	ra,56(sp)
    80001fe6:	7442                	ld	s0,48(sp)
    80001fe8:	6121                	addi	sp,sp,64
    80001fea:	8082                	ret

0000000080001fec <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001fec:	7139                	addi	sp,sp,-64
    80001fee:	fc06                	sd	ra,56(sp)
    80001ff0:	f822                	sd	s0,48(sp)
    80001ff2:	0080                	addi	s0,sp,64
    80001ff4:	fca43c23          	sd	a0,-40(s0)
    80001ff8:	fcb43823          	sd	a1,-48(s0)
    80001ffc:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80002000:	fc843703          	ld	a4,-56(s0)
    80002004:	fd043783          	ld	a5,-48(s0)
    80002008:	00f76563          	bltu	a4,a5,80002012 <uvmdealloc+0x26>
    return oldsz;
    8000200c:	fd043783          	ld	a5,-48(s0)
    80002010:	a885                	j	80002080 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80002012:	fc843703          	ld	a4,-56(s0)
    80002016:	6785                	lui	a5,0x1
    80002018:	17fd                	addi	a5,a5,-1
    8000201a:	973e                	add	a4,a4,a5
    8000201c:	77fd                	lui	a5,0xfffff
    8000201e:	8f7d                	and	a4,a4,a5
    80002020:	fd043683          	ld	a3,-48(s0)
    80002024:	6785                	lui	a5,0x1
    80002026:	17fd                	addi	a5,a5,-1
    80002028:	96be                	add	a3,a3,a5
    8000202a:	77fd                	lui	a5,0xfffff
    8000202c:	8ff5                	and	a5,a5,a3
    8000202e:	04f77763          	bgeu	a4,a5,8000207c <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002032:	fd043703          	ld	a4,-48(s0)
    80002036:	6785                	lui	a5,0x1
    80002038:	17fd                	addi	a5,a5,-1
    8000203a:	973e                	add	a4,a4,a5
    8000203c:	77fd                	lui	a5,0xfffff
    8000203e:	8f7d                	and	a4,a4,a5
    80002040:	fc843683          	ld	a3,-56(s0)
    80002044:	6785                	lui	a5,0x1
    80002046:	17fd                	addi	a5,a5,-1
    80002048:	96be                	add	a3,a3,a5
    8000204a:	77fd                	lui	a5,0xfffff
    8000204c:	8ff5                	and	a5,a5,a3
    8000204e:	40f707b3          	sub	a5,a4,a5
    80002052:	83b1                	srli	a5,a5,0xc
    80002054:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80002058:	fc843703          	ld	a4,-56(s0)
    8000205c:	6785                	lui	a5,0x1
    8000205e:	17fd                	addi	a5,a5,-1
    80002060:	973e                	add	a4,a4,a5
    80002062:	77fd                	lui	a5,0xfffff
    80002064:	8ff9                	and	a5,a5,a4
    80002066:	fec42703          	lw	a4,-20(s0)
    8000206a:	4685                	li	a3,1
    8000206c:	863a                	mv	a2,a4
    8000206e:	85be                	mv	a1,a5
    80002070:	fd843503          	ld	a0,-40(s0)
    80002074:	00000097          	auipc	ra,0x0
    80002078:	cd0080e7          	jalr	-816(ra) # 80001d44 <uvmunmap>
  }

  return newsz;
    8000207c:	fc843783          	ld	a5,-56(s0)
}
    80002080:	853e                	mv	a0,a5
    80002082:	70e2                	ld	ra,56(sp)
    80002084:	7442                	ld	s0,48(sp)
    80002086:	6121                	addi	sp,sp,64
    80002088:	8082                	ret

000000008000208a <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8000208a:	7139                	addi	sp,sp,-64
    8000208c:	fc06                	sd	ra,56(sp)
    8000208e:	f822                	sd	s0,48(sp)
    80002090:	0080                	addi	s0,sp,64
    80002092:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002096:	fe042623          	sw	zero,-20(s0)
    8000209a:	a88d                	j	8000210c <freewalk+0x82>
    pte_t pte = pagetable[i];
    8000209c:	fec42783          	lw	a5,-20(s0)
    800020a0:	078e                	slli	a5,a5,0x3
    800020a2:	fc843703          	ld	a4,-56(s0)
    800020a6:	97ba                	add	a5,a5,a4
    800020a8:	639c                	ld	a5,0(a5)
    800020aa:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020ae:	fe043783          	ld	a5,-32(s0)
    800020b2:	8b85                	andi	a5,a5,1
    800020b4:	cb9d                	beqz	a5,800020ea <freewalk+0x60>
    800020b6:	fe043783          	ld	a5,-32(s0)
    800020ba:	8bb9                	andi	a5,a5,14
    800020bc:	e79d                	bnez	a5,800020ea <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800020be:	fe043783          	ld	a5,-32(s0)
    800020c2:	83a9                	srli	a5,a5,0xa
    800020c4:	07b2                	slli	a5,a5,0xc
    800020c6:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800020ca:	fd843783          	ld	a5,-40(s0)
    800020ce:	853e                	mv	a0,a5
    800020d0:	00000097          	auipc	ra,0x0
    800020d4:	fba080e7          	jalr	-70(ra) # 8000208a <freewalk>
      pagetable[i] = 0;
    800020d8:	fec42783          	lw	a5,-20(s0)
    800020dc:	078e                	slli	a5,a5,0x3
    800020de:	fc843703          	ld	a4,-56(s0)
    800020e2:	97ba                	add	a5,a5,a4
    800020e4:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffd6000>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020e8:	a829                	j	80002102 <freewalk+0x78>
    } else if(pte & PTE_V){
    800020ea:	fe043783          	ld	a5,-32(s0)
    800020ee:	8b85                	andi	a5,a5,1
    800020f0:	cb89                	beqz	a5,80002102 <freewalk+0x78>
      panic("freewalk: leaf");
    800020f2:	00009517          	auipc	a0,0x9
    800020f6:	06e50513          	addi	a0,a0,110 # 8000b160 <etext+0x160>
    800020fa:	fffff097          	auipc	ra,0xfffff
    800020fe:	b84080e7          	jalr	-1148(ra) # 80000c7e <panic>
  for(int i = 0; i < 512; i++){
    80002102:	fec42783          	lw	a5,-20(s0)
    80002106:	2785                	addiw	a5,a5,1
    80002108:	fef42623          	sw	a5,-20(s0)
    8000210c:	fec42783          	lw	a5,-20(s0)
    80002110:	0007871b          	sext.w	a4,a5
    80002114:	1ff00793          	li	a5,511
    80002118:	f8e7d2e3          	bge	a5,a4,8000209c <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    8000211c:	fc843503          	ld	a0,-56(s0)
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	f56080e7          	jalr	-170(ra) # 80001076 <kfree>
}
    80002128:	0001                	nop
    8000212a:	70e2                	ld	ra,56(sp)
    8000212c:	7442                	ld	s0,48(sp)
    8000212e:	6121                	addi	sp,sp,64
    80002130:	8082                	ret

0000000080002132 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002132:	1101                	addi	sp,sp,-32
    80002134:	ec06                	sd	ra,24(sp)
    80002136:	e822                	sd	s0,16(sp)
    80002138:	1000                	addi	s0,sp,32
    8000213a:	fea43423          	sd	a0,-24(s0)
    8000213e:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    80002142:	fe043783          	ld	a5,-32(s0)
    80002146:	c385                	beqz	a5,80002166 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002148:	fe043703          	ld	a4,-32(s0)
    8000214c:	6785                	lui	a5,0x1
    8000214e:	17fd                	addi	a5,a5,-1
    80002150:	97ba                	add	a5,a5,a4
    80002152:	83b1                	srli	a5,a5,0xc
    80002154:	4685                	li	a3,1
    80002156:	863e                	mv	a2,a5
    80002158:	4581                	li	a1,0
    8000215a:	fe843503          	ld	a0,-24(s0)
    8000215e:	00000097          	auipc	ra,0x0
    80002162:	be6080e7          	jalr	-1050(ra) # 80001d44 <uvmunmap>
  freewalk(pagetable);
    80002166:	fe843503          	ld	a0,-24(s0)
    8000216a:	00000097          	auipc	ra,0x0
    8000216e:	f20080e7          	jalr	-224(ra) # 8000208a <freewalk>
}
    80002172:	0001                	nop
    80002174:	60e2                	ld	ra,24(sp)
    80002176:	6442                	ld	s0,16(sp)
    80002178:	6105                	addi	sp,sp,32
    8000217a:	8082                	ret

000000008000217c <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    8000217c:	711d                	addi	sp,sp,-96
    8000217e:	ec86                	sd	ra,88(sp)
    80002180:	e8a2                	sd	s0,80(sp)
    80002182:	1080                	addi	s0,sp,96
    80002184:	faa43c23          	sd	a0,-72(s0)
    80002188:	fab43823          	sd	a1,-80(s0)
    8000218c:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80002190:	fe043423          	sd	zero,-24(s0)
    80002194:	a0d9                	j	8000225a <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002196:	4601                	li	a2,0
    80002198:	fe843583          	ld	a1,-24(s0)
    8000219c:	fb843503          	ld	a0,-72(s0)
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	904080e7          	jalr	-1788(ra) # 80001aa4 <walk>
    800021a8:	fea43023          	sd	a0,-32(s0)
    800021ac:	fe043783          	ld	a5,-32(s0)
    800021b0:	eb89                	bnez	a5,800021c2 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    800021b2:	00009517          	auipc	a0,0x9
    800021b6:	fbe50513          	addi	a0,a0,-66 # 8000b170 <etext+0x170>
    800021ba:	fffff097          	auipc	ra,0xfffff
    800021be:	ac4080e7          	jalr	-1340(ra) # 80000c7e <panic>
    if((*pte & PTE_V) == 0)
    800021c2:	fe043783          	ld	a5,-32(s0)
    800021c6:	639c                	ld	a5,0(a5)
    800021c8:	8b85                	andi	a5,a5,1
    800021ca:	eb89                	bnez	a5,800021dc <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800021cc:	00009517          	auipc	a0,0x9
    800021d0:	fc450513          	addi	a0,a0,-60 # 8000b190 <etext+0x190>
    800021d4:	fffff097          	auipc	ra,0xfffff
    800021d8:	aaa080e7          	jalr	-1366(ra) # 80000c7e <panic>
    pa = PTE2PA(*pte);
    800021dc:	fe043783          	ld	a5,-32(s0)
    800021e0:	639c                	ld	a5,0(a5)
    800021e2:	83a9                	srli	a5,a5,0xa
    800021e4:	07b2                	slli	a5,a5,0xc
    800021e6:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800021ea:	fe043783          	ld	a5,-32(s0)
    800021ee:	639c                	ld	a5,0(a5)
    800021f0:	2781                	sext.w	a5,a5
    800021f2:	3ff7f793          	andi	a5,a5,1023
    800021f6:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800021fa:	fffff097          	auipc	ra,0xfffff
    800021fe:	f20080e7          	jalr	-224(ra) # 8000111a <kalloc>
    80002202:	fca43423          	sd	a0,-56(s0)
    80002206:	fc843783          	ld	a5,-56(s0)
    8000220a:	c3a5                	beqz	a5,8000226a <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    8000220c:	fd843783          	ld	a5,-40(s0)
    80002210:	6605                	lui	a2,0x1
    80002212:	85be                	mv	a1,a5
    80002214:	fc843503          	ld	a0,-56(s0)
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	30e080e7          	jalr	782(ra) # 80001526 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002220:	fc843783          	ld	a5,-56(s0)
    80002224:	fd442703          	lw	a4,-44(s0)
    80002228:	86be                	mv	a3,a5
    8000222a:	6605                	lui	a2,0x1
    8000222c:	fe843583          	ld	a1,-24(s0)
    80002230:	fb043503          	ld	a0,-80(s0)
    80002234:	00000097          	auipc	ra,0x0
    80002238:	a32080e7          	jalr	-1486(ra) # 80001c66 <mappages>
    8000223c:	87aa                	mv	a5,a0
    8000223e:	cb81                	beqz	a5,8000224e <uvmcopy+0xd2>
      kfree(mem);
    80002240:	fc843503          	ld	a0,-56(s0)
    80002244:	fffff097          	auipc	ra,0xfffff
    80002248:	e32080e7          	jalr	-462(ra) # 80001076 <kfree>
      goto err;
    8000224c:	a005                	j	8000226c <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    8000224e:	fe843703          	ld	a4,-24(s0)
    80002252:	6785                	lui	a5,0x1
    80002254:	97ba                	add	a5,a5,a4
    80002256:	fef43423          	sd	a5,-24(s0)
    8000225a:	fe843703          	ld	a4,-24(s0)
    8000225e:	fa843783          	ld	a5,-88(s0)
    80002262:	f2f76ae3          	bltu	a4,a5,80002196 <uvmcopy+0x1a>
    }
  }
  return 0;
    80002266:	4781                	li	a5,0
    80002268:	a839                	j	80002286 <uvmcopy+0x10a>
      goto err;
    8000226a:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    8000226c:	fe843783          	ld	a5,-24(s0)
    80002270:	83b1                	srli	a5,a5,0xc
    80002272:	4685                	li	a3,1
    80002274:	863e                	mv	a2,a5
    80002276:	4581                	li	a1,0
    80002278:	fb043503          	ld	a0,-80(s0)
    8000227c:	00000097          	auipc	ra,0x0
    80002280:	ac8080e7          	jalr	-1336(ra) # 80001d44 <uvmunmap>
  return -1;
    80002284:	57fd                	li	a5,-1
}
    80002286:	853e                	mv	a0,a5
    80002288:	60e6                	ld	ra,88(sp)
    8000228a:	6446                	ld	s0,80(sp)
    8000228c:	6125                	addi	sp,sp,96
    8000228e:	8082                	ret

0000000080002290 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002290:	7179                	addi	sp,sp,-48
    80002292:	f406                	sd	ra,40(sp)
    80002294:	f022                	sd	s0,32(sp)
    80002296:	1800                	addi	s0,sp,48
    80002298:	fca43c23          	sd	a0,-40(s0)
    8000229c:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    800022a0:	4601                	li	a2,0
    800022a2:	fd043583          	ld	a1,-48(s0)
    800022a6:	fd843503          	ld	a0,-40(s0)
    800022aa:	fffff097          	auipc	ra,0xfffff
    800022ae:	7fa080e7          	jalr	2042(ra) # 80001aa4 <walk>
    800022b2:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800022b6:	fe843783          	ld	a5,-24(s0)
    800022ba:	eb89                	bnez	a5,800022cc <uvmclear+0x3c>
    panic("uvmclear");
    800022bc:	00009517          	auipc	a0,0x9
    800022c0:	ef450513          	addi	a0,a0,-268 # 8000b1b0 <etext+0x1b0>
    800022c4:	fffff097          	auipc	ra,0xfffff
    800022c8:	9ba080e7          	jalr	-1606(ra) # 80000c7e <panic>
  *pte &= ~PTE_U;
    800022cc:	fe843783          	ld	a5,-24(s0)
    800022d0:	639c                	ld	a5,0(a5)
    800022d2:	fef7f713          	andi	a4,a5,-17
    800022d6:	fe843783          	ld	a5,-24(s0)
    800022da:	e398                	sd	a4,0(a5)
}
    800022dc:	0001                	nop
    800022de:	70a2                	ld	ra,40(sp)
    800022e0:	7402                	ld	s0,32(sp)
    800022e2:	6145                	addi	sp,sp,48
    800022e4:	8082                	ret

00000000800022e6 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    800022e6:	715d                	addi	sp,sp,-80
    800022e8:	e486                	sd	ra,72(sp)
    800022ea:	e0a2                	sd	s0,64(sp)
    800022ec:	0880                	addi	s0,sp,80
    800022ee:	fca43423          	sd	a0,-56(s0)
    800022f2:	fcb43023          	sd	a1,-64(s0)
    800022f6:	fac43c23          	sd	a2,-72(s0)
    800022fa:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800022fe:	a055                	j	800023a2 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    80002300:	fc043703          	ld	a4,-64(s0)
    80002304:	77fd                	lui	a5,0xfffff
    80002306:	8ff9                	and	a5,a5,a4
    80002308:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    8000230c:	fe043583          	ld	a1,-32(s0)
    80002310:	fc843503          	ld	a0,-56(s0)
    80002314:	00000097          	auipc	ra,0x0
    80002318:	880080e7          	jalr	-1920(ra) # 80001b94 <walkaddr>
    8000231c:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002320:	fd843783          	ld	a5,-40(s0)
    80002324:	e399                	bnez	a5,8000232a <copyout+0x44>
      return -1;
    80002326:	57fd                	li	a5,-1
    80002328:	a049                	j	800023aa <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    8000232a:	fe043703          	ld	a4,-32(s0)
    8000232e:	fc043783          	ld	a5,-64(s0)
    80002332:	8f1d                	sub	a4,a4,a5
    80002334:	6785                	lui	a5,0x1
    80002336:	97ba                	add	a5,a5,a4
    80002338:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000233c:	fe843703          	ld	a4,-24(s0)
    80002340:	fb043783          	ld	a5,-80(s0)
    80002344:	00e7f663          	bgeu	a5,a4,80002350 <copyout+0x6a>
      n = len;
    80002348:	fb043783          	ld	a5,-80(s0)
    8000234c:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80002350:	fc043703          	ld	a4,-64(s0)
    80002354:	fe043783          	ld	a5,-32(s0)
    80002358:	8f1d                	sub	a4,a4,a5
    8000235a:	fd843783          	ld	a5,-40(s0)
    8000235e:	97ba                	add	a5,a5,a4
    80002360:	873e                	mv	a4,a5
    80002362:	fe843783          	ld	a5,-24(s0)
    80002366:	2781                	sext.w	a5,a5
    80002368:	863e                	mv	a2,a5
    8000236a:	fb843583          	ld	a1,-72(s0)
    8000236e:	853a                	mv	a0,a4
    80002370:	fffff097          	auipc	ra,0xfffff
    80002374:	1b6080e7          	jalr	438(ra) # 80001526 <memmove>

    len -= n;
    80002378:	fb043703          	ld	a4,-80(s0)
    8000237c:	fe843783          	ld	a5,-24(s0)
    80002380:	40f707b3          	sub	a5,a4,a5
    80002384:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002388:	fb843703          	ld	a4,-72(s0)
    8000238c:	fe843783          	ld	a5,-24(s0)
    80002390:	97ba                	add	a5,a5,a4
    80002392:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002396:	fe043703          	ld	a4,-32(s0)
    8000239a:	6785                	lui	a5,0x1
    8000239c:	97ba                	add	a5,a5,a4
    8000239e:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    800023a2:	fb043783          	ld	a5,-80(s0)
    800023a6:	ffa9                	bnez	a5,80002300 <copyout+0x1a>
  }
  return 0;
    800023a8:	4781                	li	a5,0
}
    800023aa:	853e                	mv	a0,a5
    800023ac:	60a6                	ld	ra,72(sp)
    800023ae:	6406                	ld	s0,64(sp)
    800023b0:	6161                	addi	sp,sp,80
    800023b2:	8082                	ret

00000000800023b4 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800023b4:	715d                	addi	sp,sp,-80
    800023b6:	e486                	sd	ra,72(sp)
    800023b8:	e0a2                	sd	s0,64(sp)
    800023ba:	0880                	addi	s0,sp,80
    800023bc:	fca43423          	sd	a0,-56(s0)
    800023c0:	fcb43023          	sd	a1,-64(s0)
    800023c4:	fac43c23          	sd	a2,-72(s0)
    800023c8:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800023cc:	a055                	j	80002470 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800023ce:	fb843703          	ld	a4,-72(s0)
    800023d2:	77fd                	lui	a5,0xfffff
    800023d4:	8ff9                	and	a5,a5,a4
    800023d6:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800023da:	fe043583          	ld	a1,-32(s0)
    800023de:	fc843503          	ld	a0,-56(s0)
    800023e2:	fffff097          	auipc	ra,0xfffff
    800023e6:	7b2080e7          	jalr	1970(ra) # 80001b94 <walkaddr>
    800023ea:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800023ee:	fd843783          	ld	a5,-40(s0)
    800023f2:	e399                	bnez	a5,800023f8 <copyin+0x44>
      return -1;
    800023f4:	57fd                	li	a5,-1
    800023f6:	a049                	j	80002478 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800023f8:	fe043703          	ld	a4,-32(s0)
    800023fc:	fb843783          	ld	a5,-72(s0)
    80002400:	8f1d                	sub	a4,a4,a5
    80002402:	6785                	lui	a5,0x1
    80002404:	97ba                	add	a5,a5,a4
    80002406:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000240a:	fe843703          	ld	a4,-24(s0)
    8000240e:	fb043783          	ld	a5,-80(s0)
    80002412:	00e7f663          	bgeu	a5,a4,8000241e <copyin+0x6a>
      n = len;
    80002416:	fb043783          	ld	a5,-80(s0)
    8000241a:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8000241e:	fb843703          	ld	a4,-72(s0)
    80002422:	fe043783          	ld	a5,-32(s0)
    80002426:	8f1d                	sub	a4,a4,a5
    80002428:	fd843783          	ld	a5,-40(s0)
    8000242c:	97ba                	add	a5,a5,a4
    8000242e:	873e                	mv	a4,a5
    80002430:	fe843783          	ld	a5,-24(s0)
    80002434:	2781                	sext.w	a5,a5
    80002436:	863e                	mv	a2,a5
    80002438:	85ba                	mv	a1,a4
    8000243a:	fc043503          	ld	a0,-64(s0)
    8000243e:	fffff097          	auipc	ra,0xfffff
    80002442:	0e8080e7          	jalr	232(ra) # 80001526 <memmove>

    len -= n;
    80002446:	fb043703          	ld	a4,-80(s0)
    8000244a:	fe843783          	ld	a5,-24(s0)
    8000244e:	40f707b3          	sub	a5,a4,a5
    80002452:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002456:	fc043703          	ld	a4,-64(s0)
    8000245a:	fe843783          	ld	a5,-24(s0)
    8000245e:	97ba                	add	a5,a5,a4
    80002460:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002464:	fe043703          	ld	a4,-32(s0)
    80002468:	6785                	lui	a5,0x1
    8000246a:	97ba                	add	a5,a5,a4
    8000246c:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002470:	fb043783          	ld	a5,-80(s0)
    80002474:	ffa9                	bnez	a5,800023ce <copyin+0x1a>
  }
  return 0;
    80002476:	4781                	li	a5,0
}
    80002478:	853e                	mv	a0,a5
    8000247a:	60a6                	ld	ra,72(sp)
    8000247c:	6406                	ld	s0,64(sp)
    8000247e:	6161                	addi	sp,sp,80
    80002480:	8082                	ret

0000000080002482 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002482:	711d                	addi	sp,sp,-96
    80002484:	ec86                	sd	ra,88(sp)
    80002486:	e8a2                	sd	s0,80(sp)
    80002488:	1080                	addi	s0,sp,96
    8000248a:	faa43c23          	sd	a0,-72(s0)
    8000248e:	fab43823          	sd	a1,-80(s0)
    80002492:	fac43423          	sd	a2,-88(s0)
    80002496:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    8000249a:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    8000249e:	a0f1                	j	8000256a <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    800024a0:	fa843703          	ld	a4,-88(s0)
    800024a4:	77fd                	lui	a5,0xfffff
    800024a6:	8ff9                	and	a5,a5,a4
    800024a8:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    800024ac:	fd043583          	ld	a1,-48(s0)
    800024b0:	fb843503          	ld	a0,-72(s0)
    800024b4:	fffff097          	auipc	ra,0xfffff
    800024b8:	6e0080e7          	jalr	1760(ra) # 80001b94 <walkaddr>
    800024bc:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800024c0:	fc843783          	ld	a5,-56(s0)
    800024c4:	e399                	bnez	a5,800024ca <copyinstr+0x48>
      return -1;
    800024c6:	57fd                	li	a5,-1
    800024c8:	a87d                	j	80002586 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800024ca:	fd043703          	ld	a4,-48(s0)
    800024ce:	fa843783          	ld	a5,-88(s0)
    800024d2:	8f1d                	sub	a4,a4,a5
    800024d4:	6785                	lui	a5,0x1
    800024d6:	97ba                	add	a5,a5,a4
    800024d8:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800024dc:	fe843703          	ld	a4,-24(s0)
    800024e0:	fa043783          	ld	a5,-96(s0)
    800024e4:	00e7f663          	bgeu	a5,a4,800024f0 <copyinstr+0x6e>
      n = max;
    800024e8:	fa043783          	ld	a5,-96(s0)
    800024ec:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    800024f0:	fa843703          	ld	a4,-88(s0)
    800024f4:	fd043783          	ld	a5,-48(s0)
    800024f8:	8f1d                	sub	a4,a4,a5
    800024fa:	fc843783          	ld	a5,-56(s0)
    800024fe:	97ba                	add	a5,a5,a4
    80002500:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002504:	a891                	j	80002558 <copyinstr+0xd6>
      if(*p == '\0'){
    80002506:	fd843783          	ld	a5,-40(s0)
    8000250a:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    8000250e:	eb89                	bnez	a5,80002520 <copyinstr+0x9e>
        *dst = '\0';
    80002510:	fb043783          	ld	a5,-80(s0)
    80002514:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002518:	4785                	li	a5,1
    8000251a:	fef42223          	sw	a5,-28(s0)
        break;
    8000251e:	a081                	j	8000255e <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002520:	fd843783          	ld	a5,-40(s0)
    80002524:	0007c703          	lbu	a4,0(a5)
    80002528:	fb043783          	ld	a5,-80(s0)
    8000252c:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002530:	fe843783          	ld	a5,-24(s0)
    80002534:	17fd                	addi	a5,a5,-1
    80002536:	fef43423          	sd	a5,-24(s0)
      --max;
    8000253a:	fa043783          	ld	a5,-96(s0)
    8000253e:	17fd                	addi	a5,a5,-1
    80002540:	faf43023          	sd	a5,-96(s0)
      p++;
    80002544:	fd843783          	ld	a5,-40(s0)
    80002548:	0785                	addi	a5,a5,1
    8000254a:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    8000254e:	fb043783          	ld	a5,-80(s0)
    80002552:	0785                	addi	a5,a5,1
    80002554:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002558:	fe843783          	ld	a5,-24(s0)
    8000255c:	f7cd                	bnez	a5,80002506 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    8000255e:	fd043703          	ld	a4,-48(s0)
    80002562:	6785                	lui	a5,0x1
    80002564:	97ba                	add	a5,a5,a4
    80002566:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    8000256a:	fe442783          	lw	a5,-28(s0)
    8000256e:	2781                	sext.w	a5,a5
    80002570:	e781                	bnez	a5,80002578 <copyinstr+0xf6>
    80002572:	fa043783          	ld	a5,-96(s0)
    80002576:	f78d                	bnez	a5,800024a0 <copyinstr+0x1e>
  }
  if(got_null){
    80002578:	fe442783          	lw	a5,-28(s0)
    8000257c:	2781                	sext.w	a5,a5
    8000257e:	c399                	beqz	a5,80002584 <copyinstr+0x102>
    return 0;
    80002580:	4781                	li	a5,0
    80002582:	a011                	j	80002586 <copyinstr+0x104>
  } else {
    return -1;
    80002584:	57fd                	li	a5,-1
  }
}
    80002586:	853e                	mv	a0,a5
    80002588:	60e6                	ld	ra,88(sp)
    8000258a:	6446                	ld	s0,80(sp)
    8000258c:	6125                	addi	sp,sp,96
    8000258e:	8082                	ret

0000000080002590 <r_sstatus>:
{
    80002590:	1101                	addi	sp,sp,-32
    80002592:	ec22                	sd	s0,24(sp)
    80002594:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002596:	100027f3          	csrr	a5,sstatus
    8000259a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000259e:	fe843783          	ld	a5,-24(s0)
}
    800025a2:	853e                	mv	a0,a5
    800025a4:	6462                	ld	s0,24(sp)
    800025a6:	6105                	addi	sp,sp,32
    800025a8:	8082                	ret

00000000800025aa <w_sstatus>:
{
    800025aa:	1101                	addi	sp,sp,-32
    800025ac:	ec22                	sd	s0,24(sp)
    800025ae:	1000                	addi	s0,sp,32
    800025b0:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800025b4:	fe843783          	ld	a5,-24(s0)
    800025b8:	10079073          	csrw	sstatus,a5
}
    800025bc:	0001                	nop
    800025be:	6462                	ld	s0,24(sp)
    800025c0:	6105                	addi	sp,sp,32
    800025c2:	8082                	ret

00000000800025c4 <intr_on>:
{
    800025c4:	1141                	addi	sp,sp,-16
    800025c6:	e406                	sd	ra,8(sp)
    800025c8:	e022                	sd	s0,0(sp)
    800025ca:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800025cc:	00000097          	auipc	ra,0x0
    800025d0:	fc4080e7          	jalr	-60(ra) # 80002590 <r_sstatus>
    800025d4:	87aa                	mv	a5,a0
    800025d6:	0027e793          	ori	a5,a5,2
    800025da:	853e                	mv	a0,a5
    800025dc:	00000097          	auipc	ra,0x0
    800025e0:	fce080e7          	jalr	-50(ra) # 800025aa <w_sstatus>
}
    800025e4:	0001                	nop
    800025e6:	60a2                	ld	ra,8(sp)
    800025e8:	6402                	ld	s0,0(sp)
    800025ea:	0141                	addi	sp,sp,16
    800025ec:	8082                	ret

00000000800025ee <intr_get>:
{
    800025ee:	1101                	addi	sp,sp,-32
    800025f0:	ec06                	sd	ra,24(sp)
    800025f2:	e822                	sd	s0,16(sp)
    800025f4:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800025f6:	00000097          	auipc	ra,0x0
    800025fa:	f9a080e7          	jalr	-102(ra) # 80002590 <r_sstatus>
    800025fe:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80002602:	fe843783          	ld	a5,-24(s0)
    80002606:	8b89                	andi	a5,a5,2
    80002608:	00f037b3          	snez	a5,a5
    8000260c:	0ff7f793          	andi	a5,a5,255
    80002610:	2781                	sext.w	a5,a5
}
    80002612:	853e                	mv	a0,a5
    80002614:	60e2                	ld	ra,24(sp)
    80002616:	6442                	ld	s0,16(sp)
    80002618:	6105                	addi	sp,sp,32
    8000261a:	8082                	ret

000000008000261c <r_tp>:
{
    8000261c:	1101                	addi	sp,sp,-32
    8000261e:	ec22                	sd	s0,24(sp)
    80002620:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002622:	8792                	mv	a5,tp
    80002624:	fef43423          	sd	a5,-24(s0)
  return x;
    80002628:	fe843783          	ld	a5,-24(s0)
}
    8000262c:	853e                	mv	a0,a5
    8000262e:	6462                	ld	s0,24(sp)
    80002630:	6105                	addi	sp,sp,32
    80002632:	8082                	ret

0000000080002634 <proc_mapstacks>:

// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl) {
    80002634:	7139                	addi	sp,sp,-64
    80002636:	fc06                	sd	ra,56(sp)
    80002638:	f822                	sd	s0,48(sp)
    8000263a:	0080                	addi	s0,sp,64
    8000263c:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002640:	00012797          	auipc	a5,0x12
    80002644:	07878793          	addi	a5,a5,120 # 800146b8 <proc>
    80002648:	fef43423          	sd	a5,-24(s0)
    8000264c:	a061                	j	800026d4 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    8000264e:	fffff097          	auipc	ra,0xfffff
    80002652:	acc080e7          	jalr	-1332(ra) # 8000111a <kalloc>
    80002656:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000265a:	fe043783          	ld	a5,-32(s0)
    8000265e:	eb89                	bnez	a5,80002670 <proc_mapstacks+0x3c>
      panic("kalloc");
    80002660:	00009517          	auipc	a0,0x9
    80002664:	b6050513          	addi	a0,a0,-1184 # 8000b1c0 <etext+0x1c0>
    80002668:	ffffe097          	auipc	ra,0xffffe
    8000266c:	616080e7          	jalr	1558(ra) # 80000c7e <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002670:	fe843703          	ld	a4,-24(s0)
    80002674:	00012797          	auipc	a5,0x12
    80002678:	04478793          	addi	a5,a5,68 # 800146b8 <proc>
    8000267c:	40f707b3          	sub	a5,a4,a5
    80002680:	4037d713          	srai	a4,a5,0x3
    80002684:	00009797          	auipc	a5,0x9
    80002688:	c2c78793          	addi	a5,a5,-980 # 8000b2b0 <etext+0x2b0>
    8000268c:	639c                	ld	a5,0(a5)
    8000268e:	02f707b3          	mul	a5,a4,a5
    80002692:	2781                	sext.w	a5,a5
    80002694:	2785                	addiw	a5,a5,1
    80002696:	2781                	sext.w	a5,a5
    80002698:	00d7979b          	slliw	a5,a5,0xd
    8000269c:	2781                	sext.w	a5,a5
    8000269e:	873e                	mv	a4,a5
    800026a0:	040007b7          	lui	a5,0x4000
    800026a4:	17fd                	addi	a5,a5,-1
    800026a6:	07b2                	slli	a5,a5,0xc
    800026a8:	8f99                	sub	a5,a5,a4
    800026aa:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    800026ae:	fe043783          	ld	a5,-32(s0)
    800026b2:	4719                	li	a4,6
    800026b4:	6685                	lui	a3,0x1
    800026b6:	863e                	mv	a2,a5
    800026b8:	fd843583          	ld	a1,-40(s0)
    800026bc:	fc843503          	ld	a0,-56(s0)
    800026c0:	fffff097          	auipc	ra,0xfffff
    800026c4:	54c080e7          	jalr	1356(ra) # 80001c0c <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800026c8:	fe843783          	ld	a5,-24(s0)
    800026cc:	18878793          	addi	a5,a5,392 # 4000188 <_entry-0x7bfffe78>
    800026d0:	fef43423          	sd	a5,-24(s0)
    800026d4:	fe843703          	ld	a4,-24(s0)
    800026d8:	00018797          	auipc	a5,0x18
    800026dc:	1e078793          	addi	a5,a5,480 # 8001a8b8 <pid_lock>
    800026e0:	f6f767e3          	bltu	a4,a5,8000264e <proc_mapstacks+0x1a>
  }
}
    800026e4:	0001                	nop
    800026e6:	0001                	nop
    800026e8:	70e2                	ld	ra,56(sp)
    800026ea:	7442                	ld	s0,48(sp)
    800026ec:	6121                	addi	sp,sp,64
    800026ee:	8082                	ret

00000000800026f0 <procinit>:

// initialize the proc table at boot time.
void
procinit(void)
{
    800026f0:	1101                	addi	sp,sp,-32
    800026f2:	ec06                	sd	ra,24(sp)
    800026f4:	e822                	sd	s0,16(sp)
    800026f6:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    800026f8:	00009597          	auipc	a1,0x9
    800026fc:	ad058593          	addi	a1,a1,-1328 # 8000b1c8 <etext+0x1c8>
    80002700:	00018517          	auipc	a0,0x18
    80002704:	1b850513          	addi	a0,a0,440 # 8001a8b8 <pid_lock>
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	b36080e7          	jalr	-1226(ra) # 8000123e <initlock>
  initlock(&wait_lock, "wait_lock");
    80002710:	00009597          	auipc	a1,0x9
    80002714:	ac058593          	addi	a1,a1,-1344 # 8000b1d0 <etext+0x1d0>
    80002718:	00018517          	auipc	a0,0x18
    8000271c:	1b850513          	addi	a0,a0,440 # 8001a8d0 <wait_lock>
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	b1e080e7          	jalr	-1250(ra) # 8000123e <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002728:	00012797          	auipc	a5,0x12
    8000272c:	f9078793          	addi	a5,a5,-112 # 800146b8 <proc>
    80002730:	fef43423          	sd	a5,-24(s0)
    80002734:	a09d                	j	8000279a <procinit+0xaa>
      initlock(&p->lock, "proc");
    80002736:	fe843783          	ld	a5,-24(s0)
    8000273a:	00009597          	auipc	a1,0x9
    8000273e:	aa658593          	addi	a1,a1,-1370 # 8000b1e0 <etext+0x1e0>
    80002742:	853e                	mv	a0,a5
    80002744:	fffff097          	auipc	ra,0xfffff
    80002748:	afa080e7          	jalr	-1286(ra) # 8000123e <initlock>
      p->kstack = KSTACK((int) (p - proc));
    8000274c:	fe843703          	ld	a4,-24(s0)
    80002750:	00012797          	auipc	a5,0x12
    80002754:	f6878793          	addi	a5,a5,-152 # 800146b8 <proc>
    80002758:	40f707b3          	sub	a5,a4,a5
    8000275c:	4037d713          	srai	a4,a5,0x3
    80002760:	00009797          	auipc	a5,0x9
    80002764:	b5078793          	addi	a5,a5,-1200 # 8000b2b0 <etext+0x2b0>
    80002768:	639c                	ld	a5,0(a5)
    8000276a:	02f707b3          	mul	a5,a4,a5
    8000276e:	2781                	sext.w	a5,a5
    80002770:	2785                	addiw	a5,a5,1
    80002772:	2781                	sext.w	a5,a5
    80002774:	00d7979b          	slliw	a5,a5,0xd
    80002778:	2781                	sext.w	a5,a5
    8000277a:	873e                	mv	a4,a5
    8000277c:	040007b7          	lui	a5,0x4000
    80002780:	17fd                	addi	a5,a5,-1
    80002782:	07b2                	slli	a5,a5,0xc
    80002784:	8f99                	sub	a5,a5,a4
    80002786:	873e                	mv	a4,a5
    80002788:	fe843783          	ld	a5,-24(s0)
    8000278c:	f3b8                	sd	a4,96(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    8000278e:	fe843783          	ld	a5,-24(s0)
    80002792:	18878793          	addi	a5,a5,392 # 4000188 <_entry-0x7bfffe78>
    80002796:	fef43423          	sd	a5,-24(s0)
    8000279a:	fe843703          	ld	a4,-24(s0)
    8000279e:	00018797          	auipc	a5,0x18
    800027a2:	11a78793          	addi	a5,a5,282 # 8001a8b8 <pid_lock>
    800027a6:	f8f768e3          	bltu	a4,a5,80002736 <procinit+0x46>
  }
}
    800027aa:	0001                	nop
    800027ac:	0001                	nop
    800027ae:	60e2                	ld	ra,24(sp)
    800027b0:	6442                	ld	s0,16(sp)
    800027b2:	6105                	addi	sp,sp,32
    800027b4:	8082                	ret

00000000800027b6 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    800027b6:	1101                	addi	sp,sp,-32
    800027b8:	ec06                	sd	ra,24(sp)
    800027ba:	e822                	sd	s0,16(sp)
    800027bc:	1000                	addi	s0,sp,32
  int id = r_tp();
    800027be:	00000097          	auipc	ra,0x0
    800027c2:	e5e080e7          	jalr	-418(ra) # 8000261c <r_tp>
    800027c6:	87aa                	mv	a5,a0
    800027c8:	fef42623          	sw	a5,-20(s0)
  return id;
    800027cc:	fec42783          	lw	a5,-20(s0)
}
    800027d0:	853e                	mv	a0,a5
    800027d2:	60e2                	ld	ra,24(sp)
    800027d4:	6442                	ld	s0,16(sp)
    800027d6:	6105                	addi	sp,sp,32
    800027d8:	8082                	ret

00000000800027da <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void) {
    800027da:	1101                	addi	sp,sp,-32
    800027dc:	ec06                	sd	ra,24(sp)
    800027de:	e822                	sd	s0,16(sp)
    800027e0:	1000                	addi	s0,sp,32
  int id = cpuid();
    800027e2:	00000097          	auipc	ra,0x0
    800027e6:	fd4080e7          	jalr	-44(ra) # 800027b6 <cpuid>
    800027ea:	87aa                	mv	a5,a0
    800027ec:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    800027f0:	fec42783          	lw	a5,-20(s0)
    800027f4:	00779713          	slli	a4,a5,0x7
    800027f8:	00012797          	auipc	a5,0x12
    800027fc:	ac078793          	addi	a5,a5,-1344 # 800142b8 <cpus>
    80002800:	97ba                	add	a5,a5,a4
    80002802:	fef43023          	sd	a5,-32(s0)
  return c;
    80002806:	fe043783          	ld	a5,-32(s0)
}
    8000280a:	853e                	mv	a0,a5
    8000280c:	60e2                	ld	ra,24(sp)
    8000280e:	6442                	ld	s0,16(sp)
    80002810:	6105                	addi	sp,sp,32
    80002812:	8082                	ret

0000000080002814 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void) {
    80002814:	1101                	addi	sp,sp,-32
    80002816:	ec06                	sd	ra,24(sp)
    80002818:	e822                	sd	s0,16(sp)
    8000281a:	1000                	addi	s0,sp,32
  push_off();
    8000281c:	fffff097          	auipc	ra,0xfffff
    80002820:	b50080e7          	jalr	-1200(ra) # 8000136c <push_off>
  struct cpu *c = mycpu();
    80002824:	00000097          	auipc	ra,0x0
    80002828:	fb6080e7          	jalr	-74(ra) # 800027da <mycpu>
    8000282c:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002830:	fe843783          	ld	a5,-24(s0)
    80002834:	639c                	ld	a5,0(a5)
    80002836:	fef43023          	sd	a5,-32(s0)
  pop_off();
    8000283a:	fffff097          	auipc	ra,0xfffff
    8000283e:	b8a080e7          	jalr	-1142(ra) # 800013c4 <pop_off>
  return p;
    80002842:	fe043783          	ld	a5,-32(s0)
}
    80002846:	853e                	mv	a0,a5
    80002848:	60e2                	ld	ra,24(sp)
    8000284a:	6442                	ld	s0,16(sp)
    8000284c:	6105                	addi	sp,sp,32
    8000284e:	8082                	ret

0000000080002850 <allocpid>:

int
allocpid() {
    80002850:	1101                	addi	sp,sp,-32
    80002852:	ec06                	sd	ra,24(sp)
    80002854:	e822                	sd	s0,16(sp)
    80002856:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002858:	00018517          	auipc	a0,0x18
    8000285c:	06050513          	addi	a0,a0,96 # 8001a8b8 <pid_lock>
    80002860:	fffff097          	auipc	ra,0xfffff
    80002864:	a0e080e7          	jalr	-1522(ra) # 8000126e <acquire>
  pid = nextpid;
    80002868:	00009797          	auipc	a5,0x9
    8000286c:	ec878793          	addi	a5,a5,-312 # 8000b730 <nextpid>
    80002870:	439c                	lw	a5,0(a5)
    80002872:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002876:	00009797          	auipc	a5,0x9
    8000287a:	eba78793          	addi	a5,a5,-326 # 8000b730 <nextpid>
    8000287e:	439c                	lw	a5,0(a5)
    80002880:	2785                	addiw	a5,a5,1
    80002882:	0007871b          	sext.w	a4,a5
    80002886:	00009797          	auipc	a5,0x9
    8000288a:	eaa78793          	addi	a5,a5,-342 # 8000b730 <nextpid>
    8000288e:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002890:	00018517          	auipc	a0,0x18
    80002894:	02850513          	addi	a0,a0,40 # 8001a8b8 <pid_lock>
    80002898:	fffff097          	auipc	ra,0xfffff
    8000289c:	a3a080e7          	jalr	-1478(ra) # 800012d2 <release>

  return pid;
    800028a0:	fec42783          	lw	a5,-20(s0)
}
    800028a4:	853e                	mv	a0,a5
    800028a6:	60e2                	ld	ra,24(sp)
    800028a8:	6442                	ld	s0,16(sp)
    800028aa:	6105                	addi	sp,sp,32
    800028ac:	8082                	ret

00000000800028ae <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    800028ae:	1101                	addi	sp,sp,-32
    800028b0:	ec06                	sd	ra,24(sp)
    800028b2:	e822                	sd	s0,16(sp)
    800028b4:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800028b6:	00012797          	auipc	a5,0x12
    800028ba:	e0278793          	addi	a5,a5,-510 # 800146b8 <proc>
    800028be:	fef43423          	sd	a5,-24(s0)
    800028c2:	a80d                	j	800028f4 <allocproc+0x46>
    acquire(&p->lock);
    800028c4:	fe843783          	ld	a5,-24(s0)
    800028c8:	853e                	mv	a0,a5
    800028ca:	fffff097          	auipc	ra,0xfffff
    800028ce:	9a4080e7          	jalr	-1628(ra) # 8000126e <acquire>
    if(p->state == UNUSED) {
    800028d2:	fe843783          	ld	a5,-24(s0)
    800028d6:	4f9c                	lw	a5,24(a5)
    800028d8:	cb85                	beqz	a5,80002908 <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    800028da:	fe843783          	ld	a5,-24(s0)
    800028de:	853e                	mv	a0,a5
    800028e0:	fffff097          	auipc	ra,0xfffff
    800028e4:	9f2080e7          	jalr	-1550(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    800028e8:	fe843783          	ld	a5,-24(s0)
    800028ec:	18878793          	addi	a5,a5,392
    800028f0:	fef43423          	sd	a5,-24(s0)
    800028f4:	fe843703          	ld	a4,-24(s0)
    800028f8:	00018797          	auipc	a5,0x18
    800028fc:	fc078793          	addi	a5,a5,-64 # 8001a8b8 <pid_lock>
    80002900:	fcf762e3          	bltu	a4,a5,800028c4 <allocproc+0x16>
    }
  }
  return 0;
    80002904:	4781                	li	a5,0
    80002906:	a0e1                	j	800029ce <allocproc+0x120>
      goto found;
    80002908:	0001                	nop

found:
  p->pid = allocpid();
    8000290a:	00000097          	auipc	ra,0x0
    8000290e:	f46080e7          	jalr	-186(ra) # 80002850 <allocpid>
    80002912:	87aa                	mv	a5,a0
    80002914:	873e                	mv	a4,a5
    80002916:	fe843783          	ld	a5,-24(s0)
    8000291a:	db98                	sw	a4,48(a5)
  p->state = USED;
    8000291c:	fe843783          	ld	a5,-24(s0)
    80002920:	4705                	li	a4,1
    80002922:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002924:	ffffe097          	auipc	ra,0xffffe
    80002928:	7f6080e7          	jalr	2038(ra) # 8000111a <kalloc>
    8000292c:	872a                	mv	a4,a0
    8000292e:	fe843783          	ld	a5,-24(s0)
    80002932:	ffb8                	sd	a4,120(a5)
    80002934:	fe843783          	ld	a5,-24(s0)
    80002938:	7fbc                	ld	a5,120(a5)
    8000293a:	e385                	bnez	a5,8000295a <allocproc+0xac>
    freeproc(p);
    8000293c:	fe843503          	ld	a0,-24(s0)
    80002940:	00000097          	auipc	ra,0x0
    80002944:	098080e7          	jalr	152(ra) # 800029d8 <freeproc>
    release(&p->lock);
    80002948:	fe843783          	ld	a5,-24(s0)
    8000294c:	853e                	mv	a0,a5
    8000294e:	fffff097          	auipc	ra,0xfffff
    80002952:	984080e7          	jalr	-1660(ra) # 800012d2 <release>
    return 0;
    80002956:	4781                	li	a5,0
    80002958:	a89d                	j	800029ce <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    8000295a:	fe843503          	ld	a0,-24(s0)
    8000295e:	00000097          	auipc	ra,0x0
    80002962:	148080e7          	jalr	328(ra) # 80002aa6 <proc_pagetable>
    80002966:	872a                	mv	a4,a0
    80002968:	fe843783          	ld	a5,-24(s0)
    8000296c:	fbb8                	sd	a4,112(a5)
  if(p->pagetable == 0){
    8000296e:	fe843783          	ld	a5,-24(s0)
    80002972:	7bbc                	ld	a5,112(a5)
    80002974:	e385                	bnez	a5,80002994 <allocproc+0xe6>
    freeproc(p);
    80002976:	fe843503          	ld	a0,-24(s0)
    8000297a:	00000097          	auipc	ra,0x0
    8000297e:	05e080e7          	jalr	94(ra) # 800029d8 <freeproc>
    release(&p->lock);
    80002982:	fe843783          	ld	a5,-24(s0)
    80002986:	853e                	mv	a0,a5
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	94a080e7          	jalr	-1718(ra) # 800012d2 <release>
    return 0;
    80002990:	4781                	li	a5,0
    80002992:	a835                	j	800029ce <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002994:	fe843783          	ld	a5,-24(s0)
    80002998:	08078793          	addi	a5,a5,128
    8000299c:	07000613          	li	a2,112
    800029a0:	4581                	li	a1,0
    800029a2:	853e                	mv	a0,a5
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	a9e080e7          	jalr	-1378(ra) # 80001442 <memset>
  p->context.ra = (uint64)forkret;
    800029ac:	00001717          	auipc	a4,0x1
    800029b0:	f4470713          	addi	a4,a4,-188 # 800038f0 <forkret>
    800029b4:	fe843783          	ld	a5,-24(s0)
    800029b8:	e3d8                	sd	a4,128(a5)
  p->context.sp = p->kstack + PGSIZE;
    800029ba:	fe843783          	ld	a5,-24(s0)
    800029be:	73b8                	ld	a4,96(a5)
    800029c0:	6785                	lui	a5,0x1
    800029c2:	973e                	add	a4,a4,a5
    800029c4:	fe843783          	ld	a5,-24(s0)
    800029c8:	e7d8                	sd	a4,136(a5)

  return p;
    800029ca:	fe843783          	ld	a5,-24(s0)
}
    800029ce:	853e                	mv	a0,a5
    800029d0:	60e2                	ld	ra,24(sp)
    800029d2:	6442                	ld	s0,16(sp)
    800029d4:	6105                	addi	sp,sp,32
    800029d6:	8082                	ret

00000000800029d8 <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    800029d8:	1101                	addi	sp,sp,-32
    800029da:	ec06                	sd	ra,24(sp)
    800029dc:	e822                	sd	s0,16(sp)
    800029de:	1000                	addi	s0,sp,32
    800029e0:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    800029e4:	fe843783          	ld	a5,-24(s0)
    800029e8:	7fbc                	ld	a5,120(a5)
    800029ea:	cb89                	beqz	a5,800029fc <freeproc+0x24>
    kfree((void*)p->trapframe);
    800029ec:	fe843783          	ld	a5,-24(s0)
    800029f0:	7fbc                	ld	a5,120(a5)
    800029f2:	853e                	mv	a0,a5
    800029f4:	ffffe097          	auipc	ra,0xffffe
    800029f8:	682080e7          	jalr	1666(ra) # 80001076 <kfree>
  p->trapframe = 0;
    800029fc:	fe843783          	ld	a5,-24(s0)
    80002a00:	0607bc23          	sd	zero,120(a5) # 1078 <_entry-0x7fffef88>
  if(p->pagetable)
    80002a04:	fe843783          	ld	a5,-24(s0)
    80002a08:	7bbc                	ld	a5,112(a5)
    80002a0a:	cf89                	beqz	a5,80002a24 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002a0c:	fe843783          	ld	a5,-24(s0)
    80002a10:	7bb8                	ld	a4,112(a5)
    80002a12:	fe843783          	ld	a5,-24(s0)
    80002a16:	77bc                	ld	a5,104(a5)
    80002a18:	85be                	mv	a1,a5
    80002a1a:	853a                	mv	a0,a4
    80002a1c:	00000097          	auipc	ra,0x0
    80002a20:	14a080e7          	jalr	330(ra) # 80002b66 <proc_freepagetable>
  p->pagetable = 0;
    80002a24:	fe843783          	ld	a5,-24(s0)
    80002a28:	0607b823          	sd	zero,112(a5)
  p->sz = 0;
    80002a2c:	fe843783          	ld	a5,-24(s0)
    80002a30:	0607b423          	sd	zero,104(a5)
  p->pid = 0;
    80002a34:	fe843783          	ld	a5,-24(s0)
    80002a38:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002a3c:	fe843783          	ld	a5,-24(s0)
    80002a40:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002a44:	fe843783          	ld	a5,-24(s0)
    80002a48:	16078c23          	sb	zero,376(a5)
  p->chan = 0;
    80002a4c:	fe843783          	ld	a5,-24(s0)
    80002a50:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002a54:	fe843783          	ld	a5,-24(s0)
    80002a58:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002a5c:	fe843783          	ld	a5,-24(s0)
    80002a60:	0207a623          	sw	zero,44(a5)
  p->CPUtime = 0;
    80002a64:	fe843783          	ld	a5,-24(s0)
    80002a68:	0407a423          	sw	zero,72(a5)
  p-> SJBtimeN = 1;
    80002a6c:	fe843783          	ld	a5,-24(s0)
    80002a70:	4705                	li	a4,1
    80002a72:	cbb8                	sw	a4,80(a5)
  p->SJBtimeN1 =1;
    80002a74:	fe843783          	ld	a5,-24(s0)
    80002a78:	4705                	li	a4,1
    80002a7a:	cbf8                	sw	a4,84(a5)
  p-> CFStime = 0;
    80002a7c:	fe843783          	ld	a5,-24(s0)
    80002a80:	0407a623          	sw	zero,76(a5)
  p->next=0;
    80002a84:	fe843783          	ld	a5,-24(s0)
    80002a88:	0407b023          	sd	zero,64(a5)
  p->timeAfterSleep = 0;
    80002a8c:	fe843783          	ld	a5,-24(s0)
    80002a90:	0407ac23          	sw	zero,88(a5)
  p->state = UNUSED;
    80002a94:	fe843783          	ld	a5,-24(s0)
    80002a98:	0007ac23          	sw	zero,24(a5)
}
    80002a9c:	0001                	nop
    80002a9e:	60e2                	ld	ra,24(sp)
    80002aa0:	6442                	ld	s0,16(sp)
    80002aa2:	6105                	addi	sp,sp,32
    80002aa4:	8082                	ret

0000000080002aa6 <proc_pagetable>:

// Create a user page table for a given process,
// with no user memory, but with trampoline pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002aa6:	7179                	addi	sp,sp,-48
    80002aa8:	f406                	sd	ra,40(sp)
    80002aaa:	f022                	sd	s0,32(sp)
    80002aac:	1800                	addi	s0,sp,48
    80002aae:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002ab2:	fffff097          	auipc	ra,0xfffff
    80002ab6:	392080e7          	jalr	914(ra) # 80001e44 <uvmcreate>
    80002aba:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002abe:	fe843783          	ld	a5,-24(s0)
    80002ac2:	e399                	bnez	a5,80002ac8 <proc_pagetable+0x22>
    return 0;
    80002ac4:	4781                	li	a5,0
    80002ac6:	a859                	j	80002b5c <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002ac8:	00007797          	auipc	a5,0x7
    80002acc:	53878793          	addi	a5,a5,1336 # 8000a000 <_trampoline>
    80002ad0:	4729                	li	a4,10
    80002ad2:	86be                	mv	a3,a5
    80002ad4:	6605                	lui	a2,0x1
    80002ad6:	040007b7          	lui	a5,0x4000
    80002ada:	17fd                	addi	a5,a5,-1
    80002adc:	00c79593          	slli	a1,a5,0xc
    80002ae0:	fe843503          	ld	a0,-24(s0)
    80002ae4:	fffff097          	auipc	ra,0xfffff
    80002ae8:	182080e7          	jalr	386(ra) # 80001c66 <mappages>
    80002aec:	87aa                	mv	a5,a0
    80002aee:	0007db63          	bgez	a5,80002b04 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002af2:	4581                	li	a1,0
    80002af4:	fe843503          	ld	a0,-24(s0)
    80002af8:	fffff097          	auipc	ra,0xfffff
    80002afc:	63a080e7          	jalr	1594(ra) # 80002132 <uvmfree>
    return 0;
    80002b00:	4781                	li	a5,0
    80002b02:	a8a9                	j	80002b5c <proc_pagetable+0xb6>
  }

  // map the trapframe just below TRAMPOLINE, for trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002b04:	fd843783          	ld	a5,-40(s0)
    80002b08:	7fbc                	ld	a5,120(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002b0a:	4719                	li	a4,6
    80002b0c:	86be                	mv	a3,a5
    80002b0e:	6605                	lui	a2,0x1
    80002b10:	020007b7          	lui	a5,0x2000
    80002b14:	17fd                	addi	a5,a5,-1
    80002b16:	00d79593          	slli	a1,a5,0xd
    80002b1a:	fe843503          	ld	a0,-24(s0)
    80002b1e:	fffff097          	auipc	ra,0xfffff
    80002b22:	148080e7          	jalr	328(ra) # 80001c66 <mappages>
    80002b26:	87aa                	mv	a5,a0
    80002b28:	0207d863          	bgez	a5,80002b58 <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b2c:	4681                	li	a3,0
    80002b2e:	4605                	li	a2,1
    80002b30:	040007b7          	lui	a5,0x4000
    80002b34:	17fd                	addi	a5,a5,-1
    80002b36:	00c79593          	slli	a1,a5,0xc
    80002b3a:	fe843503          	ld	a0,-24(s0)
    80002b3e:	fffff097          	auipc	ra,0xfffff
    80002b42:	206080e7          	jalr	518(ra) # 80001d44 <uvmunmap>
    uvmfree(pagetable, 0);
    80002b46:	4581                	li	a1,0
    80002b48:	fe843503          	ld	a0,-24(s0)
    80002b4c:	fffff097          	auipc	ra,0xfffff
    80002b50:	5e6080e7          	jalr	1510(ra) # 80002132 <uvmfree>
    return 0;
    80002b54:	4781                	li	a5,0
    80002b56:	a019                	j	80002b5c <proc_pagetable+0xb6>
  }

  return pagetable;
    80002b58:	fe843783          	ld	a5,-24(s0)
}
    80002b5c:	853e                	mv	a0,a5
    80002b5e:	70a2                	ld	ra,40(sp)
    80002b60:	7402                	ld	s0,32(sp)
    80002b62:	6145                	addi	sp,sp,48
    80002b64:	8082                	ret

0000000080002b66 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002b66:	1101                	addi	sp,sp,-32
    80002b68:	ec06                	sd	ra,24(sp)
    80002b6a:	e822                	sd	s0,16(sp)
    80002b6c:	1000                	addi	s0,sp,32
    80002b6e:	fea43423          	sd	a0,-24(s0)
    80002b72:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b76:	4681                	li	a3,0
    80002b78:	4605                	li	a2,1
    80002b7a:	040007b7          	lui	a5,0x4000
    80002b7e:	17fd                	addi	a5,a5,-1
    80002b80:	00c79593          	slli	a1,a5,0xc
    80002b84:	fe843503          	ld	a0,-24(s0)
    80002b88:	fffff097          	auipc	ra,0xfffff
    80002b8c:	1bc080e7          	jalr	444(ra) # 80001d44 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002b90:	4681                	li	a3,0
    80002b92:	4605                	li	a2,1
    80002b94:	020007b7          	lui	a5,0x2000
    80002b98:	17fd                	addi	a5,a5,-1
    80002b9a:	00d79593          	slli	a1,a5,0xd
    80002b9e:	fe843503          	ld	a0,-24(s0)
    80002ba2:	fffff097          	auipc	ra,0xfffff
    80002ba6:	1a2080e7          	jalr	418(ra) # 80001d44 <uvmunmap>
  uvmfree(pagetable, sz);
    80002baa:	fe043583          	ld	a1,-32(s0)
    80002bae:	fe843503          	ld	a0,-24(s0)
    80002bb2:	fffff097          	auipc	ra,0xfffff
    80002bb6:	580080e7          	jalr	1408(ra) # 80002132 <uvmfree>
}
    80002bba:	0001                	nop
    80002bbc:	60e2                	ld	ra,24(sp)
    80002bbe:	6442                	ld	s0,16(sp)
    80002bc0:	6105                	addi	sp,sp,32
    80002bc2:	8082                	ret

0000000080002bc4 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002bc4:	1101                	addi	sp,sp,-32
    80002bc6:	ec06                	sd	ra,24(sp)
    80002bc8:	e822                	sd	s0,16(sp)
    80002bca:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002bcc:	00000097          	auipc	ra,0x0
    80002bd0:	ce2080e7          	jalr	-798(ra) # 800028ae <allocproc>
    80002bd4:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002bd8:	00009797          	auipc	a5,0x9
    80002bdc:	44878793          	addi	a5,a5,1096 # 8000c020 <initproc>
    80002be0:	fe843703          	ld	a4,-24(s0)
    80002be4:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy init's instructions
  // and data into it.
  uvminit(p->pagetable, initcode, sizeof(initcode));
    80002be6:	fe843783          	ld	a5,-24(s0)
    80002bea:	7bbc                	ld	a5,112(a5)
    80002bec:	03400613          	li	a2,52
    80002bf0:	00009597          	auipc	a1,0x9
    80002bf4:	b6858593          	addi	a1,a1,-1176 # 8000b758 <initcode>
    80002bf8:	853e                	mv	a0,a5
    80002bfa:	fffff097          	auipc	ra,0xfffff
    80002bfe:	286080e7          	jalr	646(ra) # 80001e80 <uvminit>
  p->sz = PGSIZE;
    80002c02:	fe843783          	ld	a5,-24(s0)
    80002c06:	6705                	lui	a4,0x1
    80002c08:	f7b8                	sd	a4,104(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002c0a:	fe843783          	ld	a5,-24(s0)
    80002c0e:	7fbc                	ld	a5,120(a5)
    80002c10:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002c14:	fe843783          	ld	a5,-24(s0)
    80002c18:	7fbc                	ld	a5,120(a5)
    80002c1a:	6705                	lui	a4,0x1
    80002c1c:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002c1e:	fe843783          	ld	a5,-24(s0)
    80002c22:	17878793          	addi	a5,a5,376
    80002c26:	4641                	li	a2,16
    80002c28:	00008597          	auipc	a1,0x8
    80002c2c:	5c058593          	addi	a1,a1,1472 # 8000b1e8 <etext+0x1e8>
    80002c30:	853e                	mv	a0,a5
    80002c32:	fffff097          	auipc	ra,0xfffff
    80002c36:	b14080e7          	jalr	-1260(ra) # 80001746 <safestrcpy>
  p->cwd = namei("/");
    80002c3a:	00008517          	auipc	a0,0x8
    80002c3e:	5be50513          	addi	a0,a0,1470 # 8000b1f8 <etext+0x1f8>
    80002c42:	00004097          	auipc	ra,0x4
    80002c46:	824080e7          	jalr	-2012(ra) # 80006466 <namei>
    80002c4a:	872a                	mv	a4,a0
    80002c4c:	fe843783          	ld	a5,-24(s0)
    80002c50:	16e7b823          	sd	a4,368(a5)

  put(p);
    80002c54:	fe843503          	ld	a0,-24(s0)
    80002c58:	00001097          	auipc	ra,0x1
    80002c5c:	a5a080e7          	jalr	-1446(ra) # 800036b2 <put>
  release(&p->lock);
    80002c60:	fe843783          	ld	a5,-24(s0)
    80002c64:	853e                	mv	a0,a5
    80002c66:	ffffe097          	auipc	ra,0xffffe
    80002c6a:	66c080e7          	jalr	1644(ra) # 800012d2 <release>
}
    80002c6e:	0001                	nop
    80002c70:	60e2                	ld	ra,24(sp)
    80002c72:	6442                	ld	s0,16(sp)
    80002c74:	6105                	addi	sp,sp,32
    80002c76:	8082                	ret

0000000080002c78 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002c78:	7179                	addi	sp,sp,-48
    80002c7a:	f406                	sd	ra,40(sp)
    80002c7c:	f022                	sd	s0,32(sp)
    80002c7e:	1800                	addi	s0,sp,48
    80002c80:	87aa                	mv	a5,a0
    80002c82:	fcf42e23          	sw	a5,-36(s0)
  uint sz;
  struct proc *p = myproc();
    80002c86:	00000097          	auipc	ra,0x0
    80002c8a:	b8e080e7          	jalr	-1138(ra) # 80002814 <myproc>
    80002c8e:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002c92:	fe043783          	ld	a5,-32(s0)
    80002c96:	77bc                	ld	a5,104(a5)
    80002c98:	fef42623          	sw	a5,-20(s0)
  if(n > 0){
    80002c9c:	fdc42783          	lw	a5,-36(s0)
    80002ca0:	2781                	sext.w	a5,a5
    80002ca2:	02f05e63          	blez	a5,80002cde <growproc+0x66>
    if((sz = uvmalloc(p->pagetable, sz, sz + n)) == 0) {
    80002ca6:	fe043783          	ld	a5,-32(s0)
    80002caa:	7bb4                	ld	a3,112(a5)
    80002cac:	fec46583          	lwu	a1,-20(s0)
    80002cb0:	fdc42783          	lw	a5,-36(s0)
    80002cb4:	fec42703          	lw	a4,-20(s0)
    80002cb8:	9fb9                	addw	a5,a5,a4
    80002cba:	2781                	sext.w	a5,a5
    80002cbc:	1782                	slli	a5,a5,0x20
    80002cbe:	9381                	srli	a5,a5,0x20
    80002cc0:	863e                	mv	a2,a5
    80002cc2:	8536                	mv	a0,a3
    80002cc4:	fffff097          	auipc	ra,0xfffff
    80002cc8:	244080e7          	jalr	580(ra) # 80001f08 <uvmalloc>
    80002ccc:	87aa                	mv	a5,a0
    80002cce:	fef42623          	sw	a5,-20(s0)
    80002cd2:	fec42783          	lw	a5,-20(s0)
    80002cd6:	2781                	sext.w	a5,a5
    80002cd8:	ef95                	bnez	a5,80002d14 <growproc+0x9c>
      return -1;
    80002cda:	57fd                	li	a5,-1
    80002cdc:	a091                	j	80002d20 <growproc+0xa8>
    }
  } else if(n < 0){
    80002cde:	fdc42783          	lw	a5,-36(s0)
    80002ce2:	2781                	sext.w	a5,a5
    80002ce4:	0207d863          	bgez	a5,80002d14 <growproc+0x9c>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002ce8:	fe043783          	ld	a5,-32(s0)
    80002cec:	7bb4                	ld	a3,112(a5)
    80002cee:	fec46583          	lwu	a1,-20(s0)
    80002cf2:	fdc42783          	lw	a5,-36(s0)
    80002cf6:	fec42703          	lw	a4,-20(s0)
    80002cfa:	9fb9                	addw	a5,a5,a4
    80002cfc:	2781                	sext.w	a5,a5
    80002cfe:	1782                	slli	a5,a5,0x20
    80002d00:	9381                	srli	a5,a5,0x20
    80002d02:	863e                	mv	a2,a5
    80002d04:	8536                	mv	a0,a3
    80002d06:	fffff097          	auipc	ra,0xfffff
    80002d0a:	2e6080e7          	jalr	742(ra) # 80001fec <uvmdealloc>
    80002d0e:	87aa                	mv	a5,a0
    80002d10:	fef42623          	sw	a5,-20(s0)
  }
  p->sz = sz;
    80002d14:	fec46703          	lwu	a4,-20(s0)
    80002d18:	fe043783          	ld	a5,-32(s0)
    80002d1c:	f7b8                	sd	a4,104(a5)
  return 0;
    80002d1e:	4781                	li	a5,0
}
    80002d20:	853e                	mv	a0,a5
    80002d22:	70a2                	ld	ra,40(sp)
    80002d24:	7402                	ld	s0,32(sp)
    80002d26:	6145                	addi	sp,sp,48
    80002d28:	8082                	ret

0000000080002d2a <change>:
// menja algoritam rasporedjivanja
void
change(int f, int alfa){
    80002d2a:	1101                	addi	sp,sp,-32
    80002d2c:	ec22                	sd	s0,24(sp)
    80002d2e:	1000                	addi	s0,sp,32
    80002d30:	87aa                	mv	a5,a0
    80002d32:	872e                	mv	a4,a1
    80002d34:	fef42623          	sw	a5,-20(s0)
    80002d38:	87ba                	mv	a5,a4
    80002d3a:	fef42423          	sw	a5,-24(s0)
    flag=f;
    80002d3e:	00009797          	auipc	a5,0x9
    80002d42:	2ee78793          	addi	a5,a5,750 # 8000c02c <flag>
    80002d46:	fec42703          	lw	a4,-20(s0)
    80002d4a:	c398                	sw	a4,0(a5)
    faktor=alfa;
    80002d4c:	00009797          	auipc	a5,0x9
    80002d50:	2e478793          	addi	a5,a5,740 # 8000c030 <faktor>
    80002d54:	fe842703          	lw	a4,-24(s0)
    80002d58:	c398                	sw	a4,0(a5)
    while(faktor>decimala){
    80002d5a:	a025                	j	80002d82 <change+0x58>
        decimala*=10;
    80002d5c:	00009797          	auipc	a5,0x9
    80002d60:	9d878793          	addi	a5,a5,-1576 # 8000b734 <decimala>
    80002d64:	439c                	lw	a5,0(a5)
    80002d66:	873e                	mv	a4,a5
    80002d68:	87ba                	mv	a5,a4
    80002d6a:	0027979b          	slliw	a5,a5,0x2
    80002d6e:	9fb9                	addw	a5,a5,a4
    80002d70:	0017979b          	slliw	a5,a5,0x1
    80002d74:	0007871b          	sext.w	a4,a5
    80002d78:	00009797          	auipc	a5,0x9
    80002d7c:	9bc78793          	addi	a5,a5,-1604 # 8000b734 <decimala>
    80002d80:	c398                	sw	a4,0(a5)
    while(faktor>decimala){
    80002d82:	00009797          	auipc	a5,0x9
    80002d86:	2ae78793          	addi	a5,a5,686 # 8000c030 <faktor>
    80002d8a:	4398                	lw	a4,0(a5)
    80002d8c:	00009797          	auipc	a5,0x9
    80002d90:	9a878793          	addi	a5,a5,-1624 # 8000b734 <decimala>
    80002d94:	439c                	lw	a5,0(a5)
    80002d96:	fce7c3e3          	blt	a5,a4,80002d5c <change+0x32>
    }
}
    80002d9a:	0001                	nop
    80002d9c:	0001                	nop
    80002d9e:	6462                	ld	s0,24(sp)
    80002da0:	6105                	addi	sp,sp,32
    80002da2:	8082                	ret

0000000080002da4 <fork>:
// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002da4:	7179                	addi	sp,sp,-48
    80002da6:	f406                	sd	ra,40(sp)
    80002da8:	f022                	sd	s0,32(sp)
    80002daa:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002dac:	00000097          	auipc	ra,0x0
    80002db0:	a68080e7          	jalr	-1432(ra) # 80002814 <myproc>
    80002db4:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002db8:	00000097          	auipc	ra,0x0
    80002dbc:	af6080e7          	jalr	-1290(ra) # 800028ae <allocproc>
    80002dc0:	fca43c23          	sd	a0,-40(s0)
    80002dc4:	fd843783          	ld	a5,-40(s0)
    80002dc8:	e399                	bnez	a5,80002dce <fork+0x2a>
    return -1;
    80002dca:	57fd                	li	a5,-1
    80002dcc:	aa69                	j	80002f66 <fork+0x1c2>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002dce:	fe043783          	ld	a5,-32(s0)
    80002dd2:	7bb8                	ld	a4,112(a5)
    80002dd4:	fd843783          	ld	a5,-40(s0)
    80002dd8:	7bb4                	ld	a3,112(a5)
    80002dda:	fe043783          	ld	a5,-32(s0)
    80002dde:	77bc                	ld	a5,104(a5)
    80002de0:	863e                	mv	a2,a5
    80002de2:	85b6                	mv	a1,a3
    80002de4:	853a                	mv	a0,a4
    80002de6:	fffff097          	auipc	ra,0xfffff
    80002dea:	396080e7          	jalr	918(ra) # 8000217c <uvmcopy>
    80002dee:	87aa                	mv	a5,a0
    80002df0:	0207d163          	bgez	a5,80002e12 <fork+0x6e>
    freeproc(np);
    80002df4:	fd843503          	ld	a0,-40(s0)
    80002df8:	00000097          	auipc	ra,0x0
    80002dfc:	be0080e7          	jalr	-1056(ra) # 800029d8 <freeproc>
    release(&np->lock);
    80002e00:	fd843783          	ld	a5,-40(s0)
    80002e04:	853e                	mv	a0,a5
    80002e06:	ffffe097          	auipc	ra,0xffffe
    80002e0a:	4cc080e7          	jalr	1228(ra) # 800012d2 <release>
    return -1;
    80002e0e:	57fd                	li	a5,-1
    80002e10:	aa99                	j	80002f66 <fork+0x1c2>
  }
  np->sz = p->sz;
    80002e12:	fe043783          	ld	a5,-32(s0)
    80002e16:	77b8                	ld	a4,104(a5)
    80002e18:	fd843783          	ld	a5,-40(s0)
    80002e1c:	f7b8                	sd	a4,104(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002e1e:	fe043783          	ld	a5,-32(s0)
    80002e22:	7fb8                	ld	a4,120(a5)
    80002e24:	fd843783          	ld	a5,-40(s0)
    80002e28:	7fbc                	ld	a5,120(a5)
    80002e2a:	86be                	mv	a3,a5
    80002e2c:	12000793          	li	a5,288
    80002e30:	863e                	mv	a2,a5
    80002e32:	85ba                	mv	a1,a4
    80002e34:	8536                	mv	a0,a3
    80002e36:	ffffe097          	auipc	ra,0xffffe
    80002e3a:	7cc080e7          	jalr	1996(ra) # 80001602 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002e3e:	fd843783          	ld	a5,-40(s0)
    80002e42:	7fbc                	ld	a5,120(a5)
    80002e44:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002e48:	fe042623          	sw	zero,-20(s0)
    80002e4c:	a0a9                	j	80002e96 <fork+0xf2>
    if(p->ofile[i])
    80002e4e:	fe043703          	ld	a4,-32(s0)
    80002e52:	fec42783          	lw	a5,-20(s0)
    80002e56:	07f9                	addi	a5,a5,30
    80002e58:	078e                	slli	a5,a5,0x3
    80002e5a:	97ba                	add	a5,a5,a4
    80002e5c:	639c                	ld	a5,0(a5)
    80002e5e:	c79d                	beqz	a5,80002e8c <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80002e60:	fe043703          	ld	a4,-32(s0)
    80002e64:	fec42783          	lw	a5,-20(s0)
    80002e68:	07f9                	addi	a5,a5,30
    80002e6a:	078e                	slli	a5,a5,0x3
    80002e6c:	97ba                	add	a5,a5,a4
    80002e6e:	639c                	ld	a5,0(a5)
    80002e70:	853e                	mv	a0,a5
    80002e72:	00004097          	auipc	ra,0x4
    80002e76:	f8c080e7          	jalr	-116(ra) # 80006dfe <filedup>
    80002e7a:	86aa                	mv	a3,a0
    80002e7c:	fd843703          	ld	a4,-40(s0)
    80002e80:	fec42783          	lw	a5,-20(s0)
    80002e84:	07f9                	addi	a5,a5,30
    80002e86:	078e                	slli	a5,a5,0x3
    80002e88:	97ba                	add	a5,a5,a4
    80002e8a:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002e8c:	fec42783          	lw	a5,-20(s0)
    80002e90:	2785                	addiw	a5,a5,1
    80002e92:	fef42623          	sw	a5,-20(s0)
    80002e96:	fec42783          	lw	a5,-20(s0)
    80002e9a:	0007871b          	sext.w	a4,a5
    80002e9e:	47bd                	li	a5,15
    80002ea0:	fae7d7e3          	bge	a5,a4,80002e4e <fork+0xaa>
  np->cwd = idup(p->cwd);
    80002ea4:	fe043783          	ld	a5,-32(s0)
    80002ea8:	1707b783          	ld	a5,368(a5)
    80002eac:	853e                	mv	a0,a5
    80002eae:	00003097          	auipc	ra,0x3
    80002eb2:	876080e7          	jalr	-1930(ra) # 80005724 <idup>
    80002eb6:	872a                	mv	a4,a0
    80002eb8:	fd843783          	ld	a5,-40(s0)
    80002ebc:	16e7b823          	sd	a4,368(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002ec0:	fd843783          	ld	a5,-40(s0)
    80002ec4:	17878713          	addi	a4,a5,376
    80002ec8:	fe043783          	ld	a5,-32(s0)
    80002ecc:	17878793          	addi	a5,a5,376
    80002ed0:	4641                	li	a2,16
    80002ed2:	85be                	mv	a1,a5
    80002ed4:	853a                	mv	a0,a4
    80002ed6:	fffff097          	auipc	ra,0xfffff
    80002eda:	870080e7          	jalr	-1936(ra) # 80001746 <safestrcpy>

  pid = np->pid;
    80002ede:	fd843783          	ld	a5,-40(s0)
    80002ee2:	5b9c                	lw	a5,48(a5)
    80002ee4:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    80002ee8:	fd843783          	ld	a5,-40(s0)
    80002eec:	853e                	mv	a0,a5
    80002eee:	ffffe097          	auipc	ra,0xffffe
    80002ef2:	3e4080e7          	jalr	996(ra) # 800012d2 <release>

  acquire(&wait_lock);
    80002ef6:	00018517          	auipc	a0,0x18
    80002efa:	9da50513          	addi	a0,a0,-1574 # 8001a8d0 <wait_lock>
    80002efe:	ffffe097          	auipc	ra,0xffffe
    80002f02:	370080e7          	jalr	880(ra) # 8000126e <acquire>
  np->parent = p;
    80002f06:	fd843783          	ld	a5,-40(s0)
    80002f0a:	fe043703          	ld	a4,-32(s0)
    80002f0e:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80002f10:	00018517          	auipc	a0,0x18
    80002f14:	9c050513          	addi	a0,a0,-1600 # 8001a8d0 <wait_lock>
    80002f18:	ffffe097          	auipc	ra,0xffffe
    80002f1c:	3ba080e7          	jalr	954(ra) # 800012d2 <release>

  acquire(&np->lock);
    80002f20:	fd843783          	ld	a5,-40(s0)
    80002f24:	853e                	mv	a0,a5
    80002f26:	ffffe097          	auipc	ra,0xffffe
    80002f2a:	348080e7          	jalr	840(ra) # 8000126e <acquire>
  numProc+=1;
    80002f2e:	00009797          	auipc	a5,0x9
    80002f32:	11a78793          	addi	a5,a5,282 # 8000c048 <numProc>
    80002f36:	439c                	lw	a5,0(a5)
    80002f38:	2785                	addiw	a5,a5,1
    80002f3a:	0007871b          	sext.w	a4,a5
    80002f3e:	00009797          	auipc	a5,0x9
    80002f42:	10a78793          	addi	a5,a5,266 # 8000c048 <numProc>
    80002f46:	c398                	sw	a4,0(a5)
  put(np);
    80002f48:	fd843503          	ld	a0,-40(s0)
    80002f4c:	00000097          	auipc	ra,0x0
    80002f50:	766080e7          	jalr	1894(ra) # 800036b2 <put>
  release(&np->lock);
    80002f54:	fd843783          	ld	a5,-40(s0)
    80002f58:	853e                	mv	a0,a5
    80002f5a:	ffffe097          	auipc	ra,0xffffe
    80002f5e:	378080e7          	jalr	888(ra) # 800012d2 <release>

  return pid;
    80002f62:	fd442783          	lw	a5,-44(s0)
}
    80002f66:	853e                	mv	a0,a5
    80002f68:	70a2                	ld	ra,40(sp)
    80002f6a:	7402                	ld	s0,32(sp)
    80002f6c:	6145                	addi	sp,sp,48
    80002f6e:	8082                	ret

0000000080002f70 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80002f70:	7179                	addi	sp,sp,-48
    80002f72:	f406                	sd	ra,40(sp)
    80002f74:	f022                	sd	s0,32(sp)
    80002f76:	1800                	addi	s0,sp,48
    80002f78:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002f7c:	00011797          	auipc	a5,0x11
    80002f80:	73c78793          	addi	a5,a5,1852 # 800146b8 <proc>
    80002f84:	fef43423          	sd	a5,-24(s0)
    80002f88:	a081                	j	80002fc8 <reparent+0x58>
    if(pp->parent == p){
    80002f8a:	fe843783          	ld	a5,-24(s0)
    80002f8e:	7f9c                	ld	a5,56(a5)
    80002f90:	fd843703          	ld	a4,-40(s0)
    80002f94:	02f71463          	bne	a4,a5,80002fbc <reparent+0x4c>
      pp->parent = initproc;
    80002f98:	00009797          	auipc	a5,0x9
    80002f9c:	08878793          	addi	a5,a5,136 # 8000c020 <initproc>
    80002fa0:	6398                	ld	a4,0(a5)
    80002fa2:	fe843783          	ld	a5,-24(s0)
    80002fa6:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    80002fa8:	00009797          	auipc	a5,0x9
    80002fac:	07878793          	addi	a5,a5,120 # 8000c020 <initproc>
    80002fb0:	639c                	ld	a5,0(a5)
    80002fb2:	853e                	mv	a0,a5
    80002fb4:	00001097          	auipc	ra,0x1
    80002fb8:	a08080e7          	jalr	-1528(ra) # 800039bc <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002fbc:	fe843783          	ld	a5,-24(s0)
    80002fc0:	18878793          	addi	a5,a5,392
    80002fc4:	fef43423          	sd	a5,-24(s0)
    80002fc8:	fe843703          	ld	a4,-24(s0)
    80002fcc:	00018797          	auipc	a5,0x18
    80002fd0:	8ec78793          	addi	a5,a5,-1812 # 8001a8b8 <pid_lock>
    80002fd4:	faf76be3          	bltu	a4,a5,80002f8a <reparent+0x1a>
    }
  }
}
    80002fd8:	0001                	nop
    80002fda:	0001                	nop
    80002fdc:	70a2                	ld	ra,40(sp)
    80002fde:	7402                	ld	s0,32(sp)
    80002fe0:	6145                	addi	sp,sp,48
    80002fe2:	8082                	ret

0000000080002fe4 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80002fe4:	7139                	addi	sp,sp,-64
    80002fe6:	fc06                	sd	ra,56(sp)
    80002fe8:	f822                	sd	s0,48(sp)
    80002fea:	0080                	addi	s0,sp,64
    80002fec:	87aa                	mv	a5,a0
    80002fee:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80002ff2:	00000097          	auipc	ra,0x0
    80002ff6:	822080e7          	jalr	-2014(ra) # 80002814 <myproc>
    80002ffa:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80002ffe:	00009797          	auipc	a5,0x9
    80003002:	02278793          	addi	a5,a5,34 # 8000c020 <initproc>
    80003006:	639c                	ld	a5,0(a5)
    80003008:	fe043703          	ld	a4,-32(s0)
    8000300c:	00f71a63          	bne	a4,a5,80003020 <exit+0x3c>
    panic("init exiting");
    80003010:	00008517          	auipc	a0,0x8
    80003014:	1f050513          	addi	a0,a0,496 # 8000b200 <etext+0x200>
    80003018:	ffffe097          	auipc	ra,0xffffe
    8000301c:	c66080e7          	jalr	-922(ra) # 80000c7e <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80003020:	fe042623          	sw	zero,-20(s0)
    80003024:	a881                	j	80003074 <exit+0x90>
    if(p->ofile[fd]){
    80003026:	fe043703          	ld	a4,-32(s0)
    8000302a:	fec42783          	lw	a5,-20(s0)
    8000302e:	07f9                	addi	a5,a5,30
    80003030:	078e                	slli	a5,a5,0x3
    80003032:	97ba                	add	a5,a5,a4
    80003034:	639c                	ld	a5,0(a5)
    80003036:	cb95                	beqz	a5,8000306a <exit+0x86>
      struct file *f = p->ofile[fd];
    80003038:	fe043703          	ld	a4,-32(s0)
    8000303c:	fec42783          	lw	a5,-20(s0)
    80003040:	07f9                	addi	a5,a5,30
    80003042:	078e                	slli	a5,a5,0x3
    80003044:	97ba                	add	a5,a5,a4
    80003046:	639c                	ld	a5,0(a5)
    80003048:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    8000304c:	fd843503          	ld	a0,-40(s0)
    80003050:	00004097          	auipc	ra,0x4
    80003054:	e14080e7          	jalr	-492(ra) # 80006e64 <fileclose>
      p->ofile[fd] = 0;
    80003058:	fe043703          	ld	a4,-32(s0)
    8000305c:	fec42783          	lw	a5,-20(s0)
    80003060:	07f9                	addi	a5,a5,30
    80003062:	078e                	slli	a5,a5,0x3
    80003064:	97ba                	add	a5,a5,a4
    80003066:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    8000306a:	fec42783          	lw	a5,-20(s0)
    8000306e:	2785                	addiw	a5,a5,1
    80003070:	fef42623          	sw	a5,-20(s0)
    80003074:	fec42783          	lw	a5,-20(s0)
    80003078:	0007871b          	sext.w	a4,a5
    8000307c:	47bd                	li	a5,15
    8000307e:	fae7d4e3          	bge	a5,a4,80003026 <exit+0x42>
    }
  }

  begin_op();
    80003082:	00003097          	auipc	ra,0x3
    80003086:	748080e7          	jalr	1864(ra) # 800067ca <begin_op>
  iput(p->cwd);
    8000308a:	fe043783          	ld	a5,-32(s0)
    8000308e:	1707b783          	ld	a5,368(a5)
    80003092:	853e                	mv	a0,a5
    80003094:	00003097          	auipc	ra,0x3
    80003098:	86a080e7          	jalr	-1942(ra) # 800058fe <iput>
  end_op();
    8000309c:	00003097          	auipc	ra,0x3
    800030a0:	7f0080e7          	jalr	2032(ra) # 8000688c <end_op>
  p->cwd = 0;
    800030a4:	fe043783          	ld	a5,-32(s0)
    800030a8:	1607b823          	sd	zero,368(a5)

  acquire(&wait_lock);
    800030ac:	00018517          	auipc	a0,0x18
    800030b0:	82450513          	addi	a0,a0,-2012 # 8001a8d0 <wait_lock>
    800030b4:	ffffe097          	auipc	ra,0xffffe
    800030b8:	1ba080e7          	jalr	442(ra) # 8000126e <acquire>

  // Give any children to init.
  reparent(p);
    800030bc:	fe043503          	ld	a0,-32(s0)
    800030c0:	00000097          	auipc	ra,0x0
    800030c4:	eb0080e7          	jalr	-336(ra) # 80002f70 <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    800030c8:	fe043783          	ld	a5,-32(s0)
    800030cc:	7f9c                	ld	a5,56(a5)
    800030ce:	853e                	mv	a0,a5
    800030d0:	00001097          	auipc	ra,0x1
    800030d4:	8ec080e7          	jalr	-1812(ra) # 800039bc <wakeup>
  
  acquire(&p->lock);
    800030d8:	fe043783          	ld	a5,-32(s0)
    800030dc:	853e                	mv	a0,a5
    800030de:	ffffe097          	auipc	ra,0xffffe
    800030e2:	190080e7          	jalr	400(ra) # 8000126e <acquire>

  p->xstate = status;
    800030e6:	fe043783          	ld	a5,-32(s0)
    800030ea:	fcc42703          	lw	a4,-52(s0)
    800030ee:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    800030f0:	fe043783          	ld	a5,-32(s0)
    800030f4:	4715                	li	a4,5
    800030f6:	cf98                	sw	a4,24(a5)
  numProc-=1;
    800030f8:	00009797          	auipc	a5,0x9
    800030fc:	f5078793          	addi	a5,a5,-176 # 8000c048 <numProc>
    80003100:	439c                	lw	a5,0(a5)
    80003102:	37fd                	addiw	a5,a5,-1
    80003104:	0007871b          	sext.w	a4,a5
    80003108:	00009797          	auipc	a5,0x9
    8000310c:	f4078793          	addi	a5,a5,-192 # 8000c048 <numProc>
    80003110:	c398                	sw	a4,0(a5)

  release(&wait_lock);
    80003112:	00017517          	auipc	a0,0x17
    80003116:	7be50513          	addi	a0,a0,1982 # 8001a8d0 <wait_lock>
    8000311a:	ffffe097          	auipc	ra,0xffffe
    8000311e:	1b8080e7          	jalr	440(ra) # 800012d2 <release>

  // Jump into the scheduler, never to return.
  sched();
    80003122:	00000097          	auipc	ra,0x0
    80003126:	208080e7          	jalr	520(ra) # 8000332a <sched>
  panic("zombie exit");
    8000312a:	00008517          	auipc	a0,0x8
    8000312e:	0e650513          	addi	a0,a0,230 # 8000b210 <etext+0x210>
    80003132:	ffffe097          	auipc	ra,0xffffe
    80003136:	b4c080e7          	jalr	-1204(ra) # 80000c7e <panic>

000000008000313a <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    8000313a:	7139                	addi	sp,sp,-64
    8000313c:	fc06                	sd	ra,56(sp)
    8000313e:	f822                	sd	s0,48(sp)
    80003140:	0080                	addi	s0,sp,64
    80003142:	fca43423          	sd	a0,-56(s0)
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    80003146:	fffff097          	auipc	ra,0xfffff
    8000314a:	6ce080e7          	jalr	1742(ra) # 80002814 <myproc>
    8000314e:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    80003152:	00017517          	auipc	a0,0x17
    80003156:	77e50513          	addi	a0,a0,1918 # 8001a8d0 <wait_lock>
    8000315a:	ffffe097          	auipc	ra,0xffffe
    8000315e:	114080e7          	jalr	276(ra) # 8000126e <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80003162:	fe042223          	sw	zero,-28(s0)
    for(np = proc; np < &proc[NPROC]; np++){
    80003166:	00011797          	auipc	a5,0x11
    8000316a:	55278793          	addi	a5,a5,1362 # 800146b8 <proc>
    8000316e:	fef43423          	sd	a5,-24(s0)
    80003172:	a8d1                	j	80003246 <wait+0x10c>
      if(np->parent == p){
    80003174:	fe843783          	ld	a5,-24(s0)
    80003178:	7f9c                	ld	a5,56(a5)
    8000317a:	fd843703          	ld	a4,-40(s0)
    8000317e:	0af71e63          	bne	a4,a5,8000323a <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&np->lock);
    80003182:	fe843783          	ld	a5,-24(s0)
    80003186:	853e                	mv	a0,a5
    80003188:	ffffe097          	auipc	ra,0xffffe
    8000318c:	0e6080e7          	jalr	230(ra) # 8000126e <acquire>

        havekids = 1;
    80003190:	4785                	li	a5,1
    80003192:	fef42223          	sw	a5,-28(s0)
        if(np->state == ZOMBIE){
    80003196:	fe843783          	ld	a5,-24(s0)
    8000319a:	4f9c                	lw	a5,24(a5)
    8000319c:	873e                	mv	a4,a5
    8000319e:	4795                	li	a5,5
    800031a0:	08f71663          	bne	a4,a5,8000322c <wait+0xf2>
          // Found one.
          pid = np->pid;
    800031a4:	fe843783          	ld	a5,-24(s0)
    800031a8:	5b9c                	lw	a5,48(a5)
    800031aa:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&np->xstate,
    800031ae:	fc843783          	ld	a5,-56(s0)
    800031b2:	c7a9                	beqz	a5,800031fc <wait+0xc2>
    800031b4:	fd843783          	ld	a5,-40(s0)
    800031b8:	7bb8                	ld	a4,112(a5)
    800031ba:	fe843783          	ld	a5,-24(s0)
    800031be:	02c78793          	addi	a5,a5,44
    800031c2:	4691                	li	a3,4
    800031c4:	863e                	mv	a2,a5
    800031c6:	fc843583          	ld	a1,-56(s0)
    800031ca:	853a                	mv	a0,a4
    800031cc:	fffff097          	auipc	ra,0xfffff
    800031d0:	11a080e7          	jalr	282(ra) # 800022e6 <copyout>
    800031d4:	87aa                	mv	a5,a0
    800031d6:	0207d363          	bgez	a5,800031fc <wait+0xc2>
                                  sizeof(np->xstate)) < 0) {
            release(&np->lock);
    800031da:	fe843783          	ld	a5,-24(s0)
    800031de:	853e                	mv	a0,a5
    800031e0:	ffffe097          	auipc	ra,0xffffe
    800031e4:	0f2080e7          	jalr	242(ra) # 800012d2 <release>
            release(&wait_lock);
    800031e8:	00017517          	auipc	a0,0x17
    800031ec:	6e850513          	addi	a0,a0,1768 # 8001a8d0 <wait_lock>
    800031f0:	ffffe097          	auipc	ra,0xffffe
    800031f4:	0e2080e7          	jalr	226(ra) # 800012d2 <release>
            return -1;
    800031f8:	57fd                	li	a5,-1
    800031fa:	a859                	j	80003290 <wait+0x156>
          }
          freeproc(np);
    800031fc:	fe843503          	ld	a0,-24(s0)
    80003200:	fffff097          	auipc	ra,0xfffff
    80003204:	7d8080e7          	jalr	2008(ra) # 800029d8 <freeproc>
          release(&np->lock);
    80003208:	fe843783          	ld	a5,-24(s0)
    8000320c:	853e                	mv	a0,a5
    8000320e:	ffffe097          	auipc	ra,0xffffe
    80003212:	0c4080e7          	jalr	196(ra) # 800012d2 <release>
          release(&wait_lock);
    80003216:	00017517          	auipc	a0,0x17
    8000321a:	6ba50513          	addi	a0,a0,1722 # 8001a8d0 <wait_lock>
    8000321e:	ffffe097          	auipc	ra,0xffffe
    80003222:	0b4080e7          	jalr	180(ra) # 800012d2 <release>
          return pid;
    80003226:	fd442783          	lw	a5,-44(s0)
    8000322a:	a09d                	j	80003290 <wait+0x156>
        }
        release(&np->lock);
    8000322c:	fe843783          	ld	a5,-24(s0)
    80003230:	853e                	mv	a0,a5
    80003232:	ffffe097          	auipc	ra,0xffffe
    80003236:	0a0080e7          	jalr	160(ra) # 800012d2 <release>
    for(np = proc; np < &proc[NPROC]; np++){
    8000323a:	fe843783          	ld	a5,-24(s0)
    8000323e:	18878793          	addi	a5,a5,392
    80003242:	fef43423          	sd	a5,-24(s0)
    80003246:	fe843703          	ld	a4,-24(s0)
    8000324a:	00017797          	auipc	a5,0x17
    8000324e:	66e78793          	addi	a5,a5,1646 # 8001a8b8 <pid_lock>
    80003252:	f2f761e3          	bltu	a4,a5,80003174 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || p->killed){
    80003256:	fe442783          	lw	a5,-28(s0)
    8000325a:	2781                	sext.w	a5,a5
    8000325c:	c789                	beqz	a5,80003266 <wait+0x12c>
    8000325e:	fd843783          	ld	a5,-40(s0)
    80003262:	579c                	lw	a5,40(a5)
    80003264:	cb99                	beqz	a5,8000327a <wait+0x140>
      release(&wait_lock);
    80003266:	00017517          	auipc	a0,0x17
    8000326a:	66a50513          	addi	a0,a0,1642 # 8001a8d0 <wait_lock>
    8000326e:	ffffe097          	auipc	ra,0xffffe
    80003272:	064080e7          	jalr	100(ra) # 800012d2 <release>
      return -1;
    80003276:	57fd                	li	a5,-1
    80003278:	a821                	j	80003290 <wait+0x156>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    8000327a:	00017597          	auipc	a1,0x17
    8000327e:	65658593          	addi	a1,a1,1622 # 8001a8d0 <wait_lock>
    80003282:	fd843503          	ld	a0,-40(s0)
    80003286:	00000097          	auipc	ra,0x0
    8000328a:	6ba080e7          	jalr	1722(ra) # 80003940 <sleep>
    havekids = 0;
    8000328e:	bdd1                	j	80003162 <wait+0x28>
  }
}
    80003290:	853e                	mv	a0,a5
    80003292:	70e2                	ld	ra,56(sp)
    80003294:	7442                	ld	s0,48(sp)
    80003296:	6121                	addi	sp,sp,64
    80003298:	8082                	ret

000000008000329a <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    8000329a:	1101                	addi	sp,sp,-32
    8000329c:	ec06                	sd	ra,24(sp)
    8000329e:	e822                	sd	s0,16(sp)
    800032a0:	1000                	addi	s0,sp,32
    struct proc *p;
    struct cpu *c = mycpu();
    800032a2:	fffff097          	auipc	ra,0xfffff
    800032a6:	538080e7          	jalr	1336(ra) # 800027da <mycpu>
    800032aa:	fea43423          	sd	a0,-24(s0)

    c->proc = 0;
    800032ae:	fe843783          	ld	a5,-24(s0)
    800032b2:	0007b023          	sd	zero,0(a5)
    for(;;){
        // Avoid deadlock by ensuring that devices can interrupt.
        intr_on();
    800032b6:	fffff097          	auipc	ra,0xfffff
    800032ba:	30e080e7          	jalr	782(ra) # 800025c4 <intr_on>

        if(head!=0) {
    800032be:	00009797          	auipc	a5,0x9
    800032c2:	d7a78793          	addi	a5,a5,-646 # 8000c038 <head>
    800032c6:	639c                	ld	a5,0(a5)
    800032c8:	d7fd                	beqz	a5,800032b6 <scheduler+0x1c>
            p=head;
    800032ca:	00009797          	auipc	a5,0x9
    800032ce:	d6e78793          	addi	a5,a5,-658 # 8000c038 <head>
    800032d2:	639c                	ld	a5,0(a5)
    800032d4:	fef43023          	sd	a5,-32(s0)
            acquire(&p->lock);
    800032d8:	fe043783          	ld	a5,-32(s0)
    800032dc:	853e                	mv	a0,a5
    800032de:	ffffe097          	auipc	ra,0xffffe
    800032e2:	f90080e7          	jalr	-112(ra) # 8000126e <acquire>
                // Switch to chosen process.  It is the process's job
                // to release its lock and then reacquire it
                // before jumping back to us.

                c->proc = get();
    800032e6:	00000097          	auipc	ra,0x0
    800032ea:	4b8080e7          	jalr	1208(ra) # 8000379e <get>
    800032ee:	872a                	mv	a4,a0
    800032f0:	fe843783          	ld	a5,-24(s0)
    800032f4:	e398                	sd	a4,0(a5)
                swtch(&c->context, &p->context);
    800032f6:	fe843783          	ld	a5,-24(s0)
    800032fa:	00878713          	addi	a4,a5,8
    800032fe:	fe043783          	ld	a5,-32(s0)
    80003302:	08078793          	addi	a5,a5,128
    80003306:	85be                	mv	a1,a5
    80003308:	853a                	mv	a0,a4
    8000330a:	00001097          	auipc	ra,0x1
    8000330e:	9e8080e7          	jalr	-1560(ra) # 80003cf2 <swtch>

                // Process is done running for now.
                // It should have changed its p->state before coming back.
                c->proc = 0;
    80003312:	fe843783          	ld	a5,-24(s0)
    80003316:	0007b023          	sd	zero,0(a5)
            release(&p->lock);
    8000331a:	fe043783          	ld	a5,-32(s0)
    8000331e:	853e                	mv	a0,a5
    80003320:	ffffe097          	auipc	ra,0xffffe
    80003324:	fb2080e7          	jalr	-78(ra) # 800012d2 <release>
        intr_on();
    80003328:	b779                	j	800032b6 <scheduler+0x1c>

000000008000332a <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    8000332a:	7179                	addi	sp,sp,-48
    8000332c:	f406                	sd	ra,40(sp)
    8000332e:	f022                	sd	s0,32(sp)
    80003330:	ec26                	sd	s1,24(sp)
    80003332:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    80003334:	fffff097          	auipc	ra,0xfffff
    80003338:	4e0080e7          	jalr	1248(ra) # 80002814 <myproc>
    8000333c:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    80003340:	fd843783          	ld	a5,-40(s0)
    80003344:	853e                	mv	a0,a5
    80003346:	ffffe097          	auipc	ra,0xffffe
    8000334a:	fe2080e7          	jalr	-30(ra) # 80001328 <holding>
    8000334e:	87aa                	mv	a5,a0
    80003350:	eb89                	bnez	a5,80003362 <sched+0x38>
    panic("sched p->lock");
    80003352:	00008517          	auipc	a0,0x8
    80003356:	ece50513          	addi	a0,a0,-306 # 8000b220 <etext+0x220>
    8000335a:	ffffe097          	auipc	ra,0xffffe
    8000335e:	924080e7          	jalr	-1756(ra) # 80000c7e <panic>
  if(mycpu()->noff != 1)
    80003362:	fffff097          	auipc	ra,0xfffff
    80003366:	478080e7          	jalr	1144(ra) # 800027da <mycpu>
    8000336a:	87aa                	mv	a5,a0
    8000336c:	5fbc                	lw	a5,120(a5)
    8000336e:	873e                	mv	a4,a5
    80003370:	4785                	li	a5,1
    80003372:	00f70a63          	beq	a4,a5,80003386 <sched+0x5c>
    panic("sched locks");
    80003376:	00008517          	auipc	a0,0x8
    8000337a:	eba50513          	addi	a0,a0,-326 # 8000b230 <etext+0x230>
    8000337e:	ffffe097          	auipc	ra,0xffffe
    80003382:	900080e7          	jalr	-1792(ra) # 80000c7e <panic>
  if(p->state == RUNNING)
    80003386:	fd843783          	ld	a5,-40(s0)
    8000338a:	4f9c                	lw	a5,24(a5)
    8000338c:	873e                	mv	a4,a5
    8000338e:	4791                	li	a5,4
    80003390:	00f71a63          	bne	a4,a5,800033a4 <sched+0x7a>
    panic("sched running");
    80003394:	00008517          	auipc	a0,0x8
    80003398:	eac50513          	addi	a0,a0,-340 # 8000b240 <etext+0x240>
    8000339c:	ffffe097          	auipc	ra,0xffffe
    800033a0:	8e2080e7          	jalr	-1822(ra) # 80000c7e <panic>
  if(intr_get())
    800033a4:	fffff097          	auipc	ra,0xfffff
    800033a8:	24a080e7          	jalr	586(ra) # 800025ee <intr_get>
    800033ac:	87aa                	mv	a5,a0
    800033ae:	cb89                	beqz	a5,800033c0 <sched+0x96>
    panic("sched interruptible");
    800033b0:	00008517          	auipc	a0,0x8
    800033b4:	ea050513          	addi	a0,a0,-352 # 8000b250 <etext+0x250>
    800033b8:	ffffe097          	auipc	ra,0xffffe
    800033bc:	8c6080e7          	jalr	-1850(ra) # 80000c7e <panic>

  intena = mycpu()->intena;
    800033c0:	fffff097          	auipc	ra,0xfffff
    800033c4:	41a080e7          	jalr	1050(ra) # 800027da <mycpu>
    800033c8:	87aa                	mv	a5,a0
    800033ca:	5ffc                	lw	a5,124(a5)
    800033cc:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    800033d0:	fd843783          	ld	a5,-40(s0)
    800033d4:	08078493          	addi	s1,a5,128
    800033d8:	fffff097          	auipc	ra,0xfffff
    800033dc:	402080e7          	jalr	1026(ra) # 800027da <mycpu>
    800033e0:	87aa                	mv	a5,a0
    800033e2:	07a1                	addi	a5,a5,8
    800033e4:	85be                	mv	a1,a5
    800033e6:	8526                	mv	a0,s1
    800033e8:	00001097          	auipc	ra,0x1
    800033ec:	90a080e7          	jalr	-1782(ra) # 80003cf2 <swtch>
  mycpu()->intena = intena;
    800033f0:	fffff097          	auipc	ra,0xfffff
    800033f4:	3ea080e7          	jalr	1002(ra) # 800027da <mycpu>
    800033f8:	872a                	mv	a4,a0
    800033fa:	fd442783          	lw	a5,-44(s0)
    800033fe:	df7c                	sw	a5,124(a4)
}
    80003400:	0001                	nop
    80003402:	70a2                	ld	ra,40(sp)
    80003404:	7402                	ld	s0,32(sp)
    80003406:	64e2                	ld	s1,24(sp)
    80003408:	6145                	addi	sp,sp,48
    8000340a:	8082                	ret

000000008000340c <putSJB>:
void
putSJB(struct proc *p){
    8000340c:	7139                	addi	sp,sp,-64
    8000340e:	fc22                	sd	s0,56(sp)
    80003410:	0080                	addi	s0,sp,64
    80003412:	fca43423          	sd	a0,-56(s0)
    if(p->SJBtimeN1<=0){
    80003416:	fc843783          	ld	a5,-56(s0)
    8000341a:	4bfc                	lw	a5,84(a5)
    8000341c:	06f04263          	bgtz	a5,80003480 <putSJB+0x74>
        p->SJBtimeN1=p->CPUtime*faktor+(decimala-faktor)*p->SJBtimeN;
    80003420:	fc843783          	ld	a5,-56(s0)
    80003424:	47b8                	lw	a4,72(a5)
    80003426:	00009797          	auipc	a5,0x9
    8000342a:	c0a78793          	addi	a5,a5,-1014 # 8000c030 <faktor>
    8000342e:	439c                	lw	a5,0(a5)
    80003430:	02f707bb          	mulw	a5,a4,a5
    80003434:	0007871b          	sext.w	a4,a5
    80003438:	00008797          	auipc	a5,0x8
    8000343c:	2fc78793          	addi	a5,a5,764 # 8000b734 <decimala>
    80003440:	4394                	lw	a3,0(a5)
    80003442:	00009797          	auipc	a5,0x9
    80003446:	bee78793          	addi	a5,a5,-1042 # 8000c030 <faktor>
    8000344a:	439c                	lw	a5,0(a5)
    8000344c:	40f687bb          	subw	a5,a3,a5
    80003450:	0007869b          	sext.w	a3,a5
    80003454:	fc843783          	ld	a5,-56(s0)
    80003458:	4bbc                	lw	a5,80(a5)
    8000345a:	02f687bb          	mulw	a5,a3,a5
    8000345e:	2781                	sext.w	a5,a5
    80003460:	9fb9                	addw	a5,a5,a4
    80003462:	0007871b          	sext.w	a4,a5
    80003466:	fc843783          	ld	a5,-56(s0)
    8000346a:	cbf8                	sw	a4,84(a5)
        //if(p->SJBtimeN1==0)p->SJBtimeN1=1;
        p->SJBtimeN=p->SJBtimeN1;
    8000346c:	fc843783          	ld	a5,-56(s0)
    80003470:	4bf8                	lw	a4,84(a5)
    80003472:	fc843783          	ld	a5,-56(s0)
    80003476:	cbb8                	sw	a4,80(a5)
        p->CPUtime=0;
    80003478:	fc843783          	ld	a5,-56(s0)
    8000347c:	0407a423          	sw	zero,72(a5)
    }
    if(head==0){
    80003480:	00009797          	auipc	a5,0x9
    80003484:	bb878793          	addi	a5,a5,-1096 # 8000c038 <head>
    80003488:	639c                	ld	a5,0(a5)
    8000348a:	e79d                	bnez	a5,800034b8 <putSJB+0xac>
        head=p;
    8000348c:	00009797          	auipc	a5,0x9
    80003490:	bac78793          	addi	a5,a5,-1108 # 8000c038 <head>
    80003494:	fc843703          	ld	a4,-56(s0)
    80003498:	e398                	sd	a4,0(a5)
        tail=p;
    8000349a:	00009797          	auipc	a5,0x9
    8000349e:	ba678793          	addi	a5,a5,-1114 # 8000c040 <tail>
    800034a2:	fc843703          	ld	a4,-56(s0)
    800034a6:	e398                	sd	a4,0(a5)
        head->next=0;
    800034a8:	00009797          	auipc	a5,0x9
    800034ac:	b9078793          	addi	a5,a5,-1136 # 8000c038 <head>
    800034b0:	639c                	ld	a5,0(a5)
    800034b2:	0407b023          	sd	zero,64(a5)
        tail->next=p;
        tail=p;
        tail->next=0;
    }
    }
}
    800034b6:	a8d9                	j	8000358c <putSJB+0x180>
    struct proc *prev=0;
    800034b8:	fe043423          	sd	zero,-24(s0)
    struct proc *t=0;
    800034bc:	fc043823          	sd	zero,-48(s0)
    int flag=0;
    800034c0:	fe042223          	sw	zero,-28(s0)
    for(struct proc* proc=head; proc!=0 ; proc=proc->next){
    800034c4:	00009797          	auipc	a5,0x9
    800034c8:	b7478793          	addi	a5,a5,-1164 # 8000c038 <head>
    800034cc:	639c                	ld	a5,0(a5)
    800034ce:	fcf43c23          	sd	a5,-40(s0)
    800034d2:	a0bd                	j	80003540 <putSJB+0x134>
        if(proc->SJBtimeN1>p->SJBtimeN1){
    800034d4:	fd843783          	ld	a5,-40(s0)
    800034d8:	4bf8                	lw	a4,84(a5)
    800034da:	fc843783          	ld	a5,-56(s0)
    800034de:	4bfc                	lw	a5,84(a5)
    800034e0:	04e7d763          	bge	a5,a4,8000352e <putSJB+0x122>
            if(prev==0){
    800034e4:	fe843783          	ld	a5,-24(s0)
    800034e8:	e78d                	bnez	a5,80003512 <putSJB+0x106>
                t=head;
    800034ea:	00009797          	auipc	a5,0x9
    800034ee:	b4e78793          	addi	a5,a5,-1202 # 8000c038 <head>
    800034f2:	639c                	ld	a5,0(a5)
    800034f4:	fcf43823          	sd	a5,-48(s0)
                head=p;
    800034f8:	00009797          	auipc	a5,0x9
    800034fc:	b4078793          	addi	a5,a5,-1216 # 8000c038 <head>
    80003500:	fc843703          	ld	a4,-56(s0)
    80003504:	e398                	sd	a4,0(a5)
                p->next=t;
    80003506:	fc843783          	ld	a5,-56(s0)
    8000350a:	fd043703          	ld	a4,-48(s0)
    8000350e:	e3b8                	sd	a4,64(a5)
    80003510:	a819                	j	80003526 <putSJB+0x11a>
                prev->next=p;
    80003512:	fe843783          	ld	a5,-24(s0)
    80003516:	fc843703          	ld	a4,-56(s0)
    8000351a:	e3b8                	sd	a4,64(a5)
                p->next=proc;
    8000351c:	fc843783          	ld	a5,-56(s0)
    80003520:	fd843703          	ld	a4,-40(s0)
    80003524:	e3b8                	sd	a4,64(a5)
            flag=1;
    80003526:	4785                	li	a5,1
    80003528:	fef42223          	sw	a5,-28(s0)
            break;
    8000352c:	a829                	j	80003546 <putSJB+0x13a>
        prev=proc;}
    8000352e:	fd843783          	ld	a5,-40(s0)
    80003532:	fef43423          	sd	a5,-24(s0)
    for(struct proc* proc=head; proc!=0 ; proc=proc->next){
    80003536:	fd843783          	ld	a5,-40(s0)
    8000353a:	63bc                	ld	a5,64(a5)
    8000353c:	fcf43c23          	sd	a5,-40(s0)
    80003540:	fd843783          	ld	a5,-40(s0)
    80003544:	fbc1                	bnez	a5,800034d4 <putSJB+0xc8>
    if(prev==tail && flag==0){
    80003546:	00009797          	auipc	a5,0x9
    8000354a:	afa78793          	addi	a5,a5,-1286 # 8000c040 <tail>
    8000354e:	639c                	ld	a5,0(a5)
    80003550:	fe843703          	ld	a4,-24(s0)
    80003554:	02f71c63          	bne	a4,a5,8000358c <putSJB+0x180>
    80003558:	fe442783          	lw	a5,-28(s0)
    8000355c:	2781                	sext.w	a5,a5
    8000355e:	e79d                	bnez	a5,8000358c <putSJB+0x180>
        tail->next=p;
    80003560:	00009797          	auipc	a5,0x9
    80003564:	ae078793          	addi	a5,a5,-1312 # 8000c040 <tail>
    80003568:	639c                	ld	a5,0(a5)
    8000356a:	fc843703          	ld	a4,-56(s0)
    8000356e:	e3b8                	sd	a4,64(a5)
        tail=p;
    80003570:	00009797          	auipc	a5,0x9
    80003574:	ad078793          	addi	a5,a5,-1328 # 8000c040 <tail>
    80003578:	fc843703          	ld	a4,-56(s0)
    8000357c:	e398                	sd	a4,0(a5)
        tail->next=0;
    8000357e:	00009797          	auipc	a5,0x9
    80003582:	ac278793          	addi	a5,a5,-1342 # 8000c040 <tail>
    80003586:	639c                	ld	a5,0(a5)
    80003588:	0407b023          	sd	zero,64(a5)
}
    8000358c:	0001                	nop
    8000358e:	7462                	ld	s0,56(sp)
    80003590:	6121                	addi	sp,sp,64
    80003592:	8082                	ret

0000000080003594 <putCFS>:
void
putCFS(struct proc *p) {
    80003594:	7139                	addi	sp,sp,-64
    80003596:	fc22                	sd	s0,56(sp)
    80003598:	0080                	addi	s0,sp,64
    8000359a:	fca43423          	sd	a0,-56(s0)
    if (head == 0) {
    8000359e:	00009797          	auipc	a5,0x9
    800035a2:	a9a78793          	addi	a5,a5,-1382 # 8000c038 <head>
    800035a6:	639c                	ld	a5,0(a5)
    800035a8:	e79d                	bnez	a5,800035d6 <putCFS+0x42>
        head = p;
    800035aa:	00009797          	auipc	a5,0x9
    800035ae:	a8e78793          	addi	a5,a5,-1394 # 8000c038 <head>
    800035b2:	fc843703          	ld	a4,-56(s0)
    800035b6:	e398                	sd	a4,0(a5)
        tail = p;
    800035b8:	00009797          	auipc	a5,0x9
    800035bc:	a8878793          	addi	a5,a5,-1400 # 8000c040 <tail>
    800035c0:	fc843703          	ld	a4,-56(s0)
    800035c4:	e398                	sd	a4,0(a5)
        head->next = 0;
    800035c6:	00009797          	auipc	a5,0x9
    800035ca:	a7278793          	addi	a5,a5,-1422 # 8000c038 <head>
    800035ce:	639c                	ld	a5,0(a5)
    800035d0:	0407b023          	sd	zero,64(a5)
            tail->next = p;
            tail = p;
            tail->next = 0;
        }
    }
}
    800035d4:	a8d9                	j	800036aa <putCFS+0x116>
        struct proc *prev = 0;
    800035d6:	fe043423          	sd	zero,-24(s0)
        struct proc *t = 0;
    800035da:	fc043823          	sd	zero,-48(s0)
        int flag = 0;
    800035de:	fe042223          	sw	zero,-28(s0)
        for (struct proc *proc = head; proc != 0; proc = proc->next) {
    800035e2:	00009797          	auipc	a5,0x9
    800035e6:	a5678793          	addi	a5,a5,-1450 # 8000c038 <head>
    800035ea:	639c                	ld	a5,0(a5)
    800035ec:	fcf43c23          	sd	a5,-40(s0)
    800035f0:	a0bd                	j	8000365e <putCFS+0xca>
            if (proc->CPUtime > p->CPUtime) {
    800035f2:	fd843783          	ld	a5,-40(s0)
    800035f6:	47b8                	lw	a4,72(a5)
    800035f8:	fc843783          	ld	a5,-56(s0)
    800035fc:	47bc                	lw	a5,72(a5)
    800035fe:	04e7d763          	bge	a5,a4,8000364c <putCFS+0xb8>
                if (prev == 0) {
    80003602:	fe843783          	ld	a5,-24(s0)
    80003606:	e78d                	bnez	a5,80003630 <putCFS+0x9c>
                    t = head;
    80003608:	00009797          	auipc	a5,0x9
    8000360c:	a3078793          	addi	a5,a5,-1488 # 8000c038 <head>
    80003610:	639c                	ld	a5,0(a5)
    80003612:	fcf43823          	sd	a5,-48(s0)
                    head = p;
    80003616:	00009797          	auipc	a5,0x9
    8000361a:	a2278793          	addi	a5,a5,-1502 # 8000c038 <head>
    8000361e:	fc843703          	ld	a4,-56(s0)
    80003622:	e398                	sd	a4,0(a5)
                    p->next = t;
    80003624:	fc843783          	ld	a5,-56(s0)
    80003628:	fd043703          	ld	a4,-48(s0)
    8000362c:	e3b8                	sd	a4,64(a5)
    8000362e:	a819                	j	80003644 <putCFS+0xb0>
                    prev->next = p;
    80003630:	fe843783          	ld	a5,-24(s0)
    80003634:	fc843703          	ld	a4,-56(s0)
    80003638:	e3b8                	sd	a4,64(a5)
                    p->next = proc;
    8000363a:	fc843783          	ld	a5,-56(s0)
    8000363e:	fd843703          	ld	a4,-40(s0)
    80003642:	e3b8                	sd	a4,64(a5)
                flag = 1;
    80003644:	4785                	li	a5,1
    80003646:	fef42223          	sw	a5,-28(s0)
                break;
    8000364a:	a829                	j	80003664 <putCFS+0xd0>
            prev = proc;
    8000364c:	fd843783          	ld	a5,-40(s0)
    80003650:	fef43423          	sd	a5,-24(s0)
        for (struct proc *proc = head; proc != 0; proc = proc->next) {
    80003654:	fd843783          	ld	a5,-40(s0)
    80003658:	63bc                	ld	a5,64(a5)
    8000365a:	fcf43c23          	sd	a5,-40(s0)
    8000365e:	fd843783          	ld	a5,-40(s0)
    80003662:	fbc1                	bnez	a5,800035f2 <putCFS+0x5e>
        if (prev == tail && flag == 0) {
    80003664:	00009797          	auipc	a5,0x9
    80003668:	9dc78793          	addi	a5,a5,-1572 # 8000c040 <tail>
    8000366c:	639c                	ld	a5,0(a5)
    8000366e:	fe843703          	ld	a4,-24(s0)
    80003672:	02f71c63          	bne	a4,a5,800036aa <putCFS+0x116>
    80003676:	fe442783          	lw	a5,-28(s0)
    8000367a:	2781                	sext.w	a5,a5
    8000367c:	e79d                	bnez	a5,800036aa <putCFS+0x116>
            tail->next = p;
    8000367e:	00009797          	auipc	a5,0x9
    80003682:	9c278793          	addi	a5,a5,-1598 # 8000c040 <tail>
    80003686:	639c                	ld	a5,0(a5)
    80003688:	fc843703          	ld	a4,-56(s0)
    8000368c:	e3b8                	sd	a4,64(a5)
            tail = p;
    8000368e:	00009797          	auipc	a5,0x9
    80003692:	9b278793          	addi	a5,a5,-1614 # 8000c040 <tail>
    80003696:	fc843703          	ld	a4,-56(s0)
    8000369a:	e398                	sd	a4,0(a5)
            tail->next = 0;
    8000369c:	00009797          	auipc	a5,0x9
    800036a0:	9a478793          	addi	a5,a5,-1628 # 8000c040 <tail>
    800036a4:	639c                	ld	a5,0(a5)
    800036a6:	0407b023          	sd	zero,64(a5)
}
    800036aa:	0001                	nop
    800036ac:	7462                	ld	s0,56(sp)
    800036ae:	6121                	addi	sp,sp,64
    800036b0:	8082                	ret

00000000800036b2 <put>:

void
put(struct proc *p)
{
    800036b2:	1101                	addi	sp,sp,-32
    800036b4:	ec06                	sd	ra,24(sp)
    800036b6:	e822                	sd	s0,16(sp)
    800036b8:	1000                	addi	s0,sp,32
    800036ba:	fea43423          	sd	a0,-24(s0)
    p->state=RUNNABLE;
    800036be:	fe843783          	ld	a5,-24(s0)
    800036c2:	470d                	li	a4,3
    800036c4:	cf98                	sw	a4,24(a5)
    if(flag==2 || flag==1) {
    800036c6:	00009797          	auipc	a5,0x9
    800036ca:	96678793          	addi	a5,a5,-1690 # 8000c02c <flag>
    800036ce:	439c                	lw	a5,0(a5)
    800036d0:	873e                	mv	a4,a5
    800036d2:	4789                	li	a5,2
    800036d4:	00f70b63          	beq	a4,a5,800036ea <put+0x38>
    800036d8:	00009797          	auipc	a5,0x9
    800036dc:	95478793          	addi	a5,a5,-1708 # 8000c02c <flag>
    800036e0:	439c                	lw	a5,0(a5)
    800036e2:	873e                	mv	a4,a5
    800036e4:	4785                	li	a5,1
    800036e6:	00f71863          	bne	a4,a5,800036f6 <put+0x44>
       putSJB(p);}
    800036ea:	fe843503          	ld	a0,-24(s0)
    800036ee:	00000097          	auipc	ra,0x0
    800036f2:	d1e080e7          	jalr	-738(ra) # 8000340c <putSJB>
    if(flag==3){
    800036f6:	00009797          	auipc	a5,0x9
    800036fa:	93678793          	addi	a5,a5,-1738 # 8000c02c <flag>
    800036fe:	439c                	lw	a5,0(a5)
    80003700:	873e                	mv	a4,a5
    80003702:	478d                	li	a5,3
    80003704:	02f71063          	bne	a4,a5,80003724 <put+0x72>
        p->timeAfterSleep=TIME;
    80003708:	00009797          	auipc	a5,0x9
    8000370c:	92078793          	addi	a5,a5,-1760 # 8000c028 <TIME>
    80003710:	4398                	lw	a4,0(a5)
    80003712:	fe843783          	ld	a5,-24(s0)
    80003716:	cfb8                	sw	a4,88(a5)
        putCFS(p);}
    80003718:	fe843503          	ld	a0,-24(s0)
    8000371c:	00000097          	auipc	ra,0x0
    80003720:	e78080e7          	jalr	-392(ra) # 80003594 <putCFS>
    if(flag==0) {
    80003724:	00009797          	auipc	a5,0x9
    80003728:	90878793          	addi	a5,a5,-1784 # 8000c02c <flag>
    8000372c:	439c                	lw	a5,0(a5)
    8000372e:	e3bd                	bnez	a5,80003794 <put+0xe2>
        if(head==0){
    80003730:	00009797          	auipc	a5,0x9
    80003734:	90878793          	addi	a5,a5,-1784 # 8000c038 <head>
    80003738:	639c                	ld	a5,0(a5)
    8000373a:	e79d                	bnez	a5,80003768 <put+0xb6>
            head=p;
    8000373c:	00009797          	auipc	a5,0x9
    80003740:	8fc78793          	addi	a5,a5,-1796 # 8000c038 <head>
    80003744:	fe843703          	ld	a4,-24(s0)
    80003748:	e398                	sd	a4,0(a5)
            tail=p;
    8000374a:	00009797          	auipc	a5,0x9
    8000374e:	8f678793          	addi	a5,a5,-1802 # 8000c040 <tail>
    80003752:	fe843703          	ld	a4,-24(s0)
    80003756:	e398                	sd	a4,0(a5)
            tail->next=0;
    80003758:	00009797          	auipc	a5,0x9
    8000375c:	8e878793          	addi	a5,a5,-1816 # 8000c040 <tail>
    80003760:	639c                	ld	a5,0(a5)
    80003762:	0407b023          	sd	zero,64(a5)
            tail->next=p;
            tail=p;
            tail->next=0;
        }
    }
}
    80003766:	a03d                	j	80003794 <put+0xe2>
            tail->next=p;
    80003768:	00009797          	auipc	a5,0x9
    8000376c:	8d878793          	addi	a5,a5,-1832 # 8000c040 <tail>
    80003770:	639c                	ld	a5,0(a5)
    80003772:	fe843703          	ld	a4,-24(s0)
    80003776:	e3b8                	sd	a4,64(a5)
            tail=p;
    80003778:	00009797          	auipc	a5,0x9
    8000377c:	8c878793          	addi	a5,a5,-1848 # 8000c040 <tail>
    80003780:	fe843703          	ld	a4,-24(s0)
    80003784:	e398                	sd	a4,0(a5)
            tail->next=0;
    80003786:	00009797          	auipc	a5,0x9
    8000378a:	8ba78793          	addi	a5,a5,-1862 # 8000c040 <tail>
    8000378e:	639c                	ld	a5,0(a5)
    80003790:	0407b023          	sd	zero,64(a5)
}
    80003794:	0001                	nop
    80003796:	60e2                	ld	ra,24(sp)
    80003798:	6442                	ld	s0,16(sp)
    8000379a:	6105                	addi	sp,sp,32
    8000379c:	8082                	ret

000000008000379e <get>:

struct proc*
get(void)
{
    8000379e:	7179                	addi	sp,sp,-48
    800037a0:	f422                	sd	s0,40(sp)
    800037a2:	1800                	addi	s0,sp,48
    struct proc* res=head;
    800037a4:	00009797          	auipc	a5,0x9
    800037a8:	89478793          	addi	a5,a5,-1900 # 8000c038 <head>
    800037ac:	639c                	ld	a5,0(a5)
    800037ae:	fef43023          	sd	a5,-32(s0)
    res->state = RUNNING;
    800037b2:	fe043783          	ld	a5,-32(s0)
    800037b6:	4711                	li	a4,4
    800037b8:	cf98                	sw	a4,24(a5)
    if(flag==3) {
    800037ba:	00009797          	auipc	a5,0x9
    800037be:	87278793          	addi	a5,a5,-1934 # 8000c02c <flag>
    800037c2:	439c                	lw	a5,0(a5)
    800037c4:	873e                	mv	a4,a5
    800037c6:	478d                	li	a5,3
    800037c8:	04f71e63          	bne	a4,a5,80003824 <get+0x86>
        int t=TIME-res->timeAfterSleep;
    800037cc:	00009797          	auipc	a5,0x9
    800037d0:	85c78793          	addi	a5,a5,-1956 # 8000c028 <TIME>
    800037d4:	4398                	lw	a4,0(a5)
    800037d6:	fe043783          	ld	a5,-32(s0)
    800037da:	4fbc                	lw	a5,88(a5)
    800037dc:	40f707bb          	subw	a5,a4,a5
    800037e0:	fcf42e23          	sw	a5,-36(s0)
        int num=1;
    800037e4:	4785                	li	a5,1
    800037e6:	fef42623          	sw	a5,-20(s0)
        while(num*(numProc-1)<t){
    800037ea:	a031                	j	800037f6 <get+0x58>
            num+=1;
    800037ec:	fec42783          	lw	a5,-20(s0)
    800037f0:	2785                	addiw	a5,a5,1
    800037f2:	fef42623          	sw	a5,-20(s0)
        while(num*(numProc-1)<t){
    800037f6:	00009797          	auipc	a5,0x9
    800037fa:	85278793          	addi	a5,a5,-1966 # 8000c048 <numProc>
    800037fe:	439c                	lw	a5,0(a5)
    80003800:	37fd                	addiw	a5,a5,-1
    80003802:	2781                	sext.w	a5,a5
    80003804:	fec42703          	lw	a4,-20(s0)
    80003808:	02f707bb          	mulw	a5,a4,a5
    8000380c:	0007871b          	sext.w	a4,a5
    80003810:	fdc42783          	lw	a5,-36(s0)
    80003814:	2781                	sext.w	a5,a5
    80003816:	fcf74be3          	blt	a4,a5,800037ec <get+0x4e>
        }
        res->CFStime = num;
    8000381a:	fe043783          	ld	a5,-32(s0)
    8000381e:	fec42703          	lw	a4,-20(s0)
    80003822:	c7f8                	sw	a4,76(a5)
    }
    if(head->next==0){
    80003824:	00009797          	auipc	a5,0x9
    80003828:	81478793          	addi	a5,a5,-2028 # 8000c038 <head>
    8000382c:	639c                	ld	a5,0(a5)
    8000382e:	63bc                	ld	a5,64(a5)
    80003830:	ef91                	bnez	a5,8000384c <get+0xae>
        head=0;
    80003832:	00009797          	auipc	a5,0x9
    80003836:	80678793          	addi	a5,a5,-2042 # 8000c038 <head>
    8000383a:	0007b023          	sd	zero,0(a5)
        tail=0;
    8000383e:	00009797          	auipc	a5,0x9
    80003842:	80278793          	addi	a5,a5,-2046 # 8000c040 <tail>
    80003846:	0007b023          	sd	zero,0(a5)
    8000384a:	a821                	j	80003862 <get+0xc4>
    }else{
        head=head->next;
    8000384c:	00008797          	auipc	a5,0x8
    80003850:	7ec78793          	addi	a5,a5,2028 # 8000c038 <head>
    80003854:	639c                	ld	a5,0(a5)
    80003856:	63b8                	ld	a4,64(a5)
    80003858:	00008797          	auipc	a5,0x8
    8000385c:	7e078793          	addi	a5,a5,2016 # 8000c038 <head>
    80003860:	e398                	sd	a4,0(a5)
    }
    res->next=0;
    80003862:	fe043783          	ld	a5,-32(s0)
    80003866:	0407b023          	sd	zero,64(a5)
    return res;
    8000386a:	fe043783          	ld	a5,-32(s0)
}
    8000386e:	853e                	mv	a0,a5
    80003870:	7422                	ld	s0,40(sp)
    80003872:	6145                	addi	sp,sp,48
    80003874:	8082                	ret

0000000080003876 <get_TIME>:
int*
get_TIME(){
    80003876:	1141                	addi	sp,sp,-16
    80003878:	e422                	sd	s0,8(sp)
    8000387a:	0800                	addi	s0,sp,16
    return &TIME;
    8000387c:	00008797          	auipc	a5,0x8
    80003880:	7ac78793          	addi	a5,a5,1964 # 8000c028 <TIME>
}
    80003884:	853e                	mv	a0,a5
    80003886:	6422                	ld	s0,8(sp)
    80003888:	0141                	addi	sp,sp,16
    8000388a:	8082                	ret

000000008000388c <get_flag>:
int*
get_flag(){
    8000388c:	1141                	addi	sp,sp,-16
    8000388e:	e422                	sd	s0,8(sp)
    80003890:	0800                	addi	s0,sp,16
    return &flag;
    80003892:	00008797          	auipc	a5,0x8
    80003896:	79a78793          	addi	a5,a5,1946 # 8000c02c <flag>
}
    8000389a:	853e                	mv	a0,a5
    8000389c:	6422                	ld	s0,8(sp)
    8000389e:	0141                	addi	sp,sp,16
    800038a0:	8082                	ret

00000000800038a2 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800038a2:	1101                	addi	sp,sp,-32
    800038a4:	ec06                	sd	ra,24(sp)
    800038a6:	e822                	sd	s0,16(sp)
    800038a8:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800038aa:	fffff097          	auipc	ra,0xfffff
    800038ae:	f6a080e7          	jalr	-150(ra) # 80002814 <myproc>
    800038b2:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800038b6:	fe843783          	ld	a5,-24(s0)
    800038ba:	853e                	mv	a0,a5
    800038bc:	ffffe097          	auipc	ra,0xffffe
    800038c0:	9b2080e7          	jalr	-1614(ra) # 8000126e <acquire>
  put(p);
    800038c4:	fe843503          	ld	a0,-24(s0)
    800038c8:	00000097          	auipc	ra,0x0
    800038cc:	dea080e7          	jalr	-534(ra) # 800036b2 <put>
  sched();
    800038d0:	00000097          	auipc	ra,0x0
    800038d4:	a5a080e7          	jalr	-1446(ra) # 8000332a <sched>
  release(&p->lock);
    800038d8:	fe843783          	ld	a5,-24(s0)
    800038dc:	853e                	mv	a0,a5
    800038de:	ffffe097          	auipc	ra,0xffffe
    800038e2:	9f4080e7          	jalr	-1548(ra) # 800012d2 <release>
}
    800038e6:	0001                	nop
    800038e8:	60e2                	ld	ra,24(sp)
    800038ea:	6442                	ld	s0,16(sp)
    800038ec:	6105                	addi	sp,sp,32
    800038ee:	8082                	ret

00000000800038f0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    800038f0:	1141                	addi	sp,sp,-16
    800038f2:	e406                	sd	ra,8(sp)
    800038f4:	e022                	sd	s0,0(sp)
    800038f6:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    800038f8:	fffff097          	auipc	ra,0xfffff
    800038fc:	f1c080e7          	jalr	-228(ra) # 80002814 <myproc>
    80003900:	87aa                	mv	a5,a0
    80003902:	853e                	mv	a0,a5
    80003904:	ffffe097          	auipc	ra,0xffffe
    80003908:	9ce080e7          	jalr	-1586(ra) # 800012d2 <release>

  if (first) {
    8000390c:	00008797          	auipc	a5,0x8
    80003910:	e2c78793          	addi	a5,a5,-468 # 8000b738 <first.1740>
    80003914:	439c                	lw	a5,0(a5)
    80003916:	cf81                	beqz	a5,8000392e <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003918:	00008797          	auipc	a5,0x8
    8000391c:	e2078793          	addi	a5,a5,-480 # 8000b738 <first.1740>
    80003920:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    80003924:	4505                	li	a0,1
    80003926:	00001097          	auipc	ra,0x1
    8000392a:	6d8080e7          	jalr	1752(ra) # 80004ffe <fsinit>
  }

  usertrapret();
    8000392e:	00001097          	auipc	ra,0x1
    80003932:	832080e7          	jalr	-1998(ra) # 80004160 <usertrapret>
}
    80003936:	0001                	nop
    80003938:	60a2                	ld	ra,8(sp)
    8000393a:	6402                	ld	s0,0(sp)
    8000393c:	0141                	addi	sp,sp,16
    8000393e:	8082                	ret

0000000080003940 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80003940:	7179                	addi	sp,sp,-48
    80003942:	f406                	sd	ra,40(sp)
    80003944:	f022                	sd	s0,32(sp)
    80003946:	1800                	addi	s0,sp,48
    80003948:	fca43c23          	sd	a0,-40(s0)
    8000394c:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003950:	fffff097          	auipc	ra,0xfffff
    80003954:	ec4080e7          	jalr	-316(ra) # 80002814 <myproc>
    80003958:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    8000395c:	fe843783          	ld	a5,-24(s0)
    80003960:	853e                	mv	a0,a5
    80003962:	ffffe097          	auipc	ra,0xffffe
    80003966:	90c080e7          	jalr	-1780(ra) # 8000126e <acquire>
  release(lk);
    8000396a:	fd043503          	ld	a0,-48(s0)
    8000396e:	ffffe097          	auipc	ra,0xffffe
    80003972:	964080e7          	jalr	-1692(ra) # 800012d2 <release>

  // Go to sleep.
  p->chan = chan;
    80003976:	fe843783          	ld	a5,-24(s0)
    8000397a:	fd843703          	ld	a4,-40(s0)
    8000397e:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    80003980:	fe843783          	ld	a5,-24(s0)
    80003984:	4709                	li	a4,2
    80003986:	cf98                	sw	a4,24(a5)

  sched();
    80003988:	00000097          	auipc	ra,0x0
    8000398c:	9a2080e7          	jalr	-1630(ra) # 8000332a <sched>

  // Tidy up.
  p->chan = 0;
    80003990:	fe843783          	ld	a5,-24(s0)
    80003994:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    80003998:	fe843783          	ld	a5,-24(s0)
    8000399c:	853e                	mv	a0,a5
    8000399e:	ffffe097          	auipc	ra,0xffffe
    800039a2:	934080e7          	jalr	-1740(ra) # 800012d2 <release>
  acquire(lk);
    800039a6:	fd043503          	ld	a0,-48(s0)
    800039aa:	ffffe097          	auipc	ra,0xffffe
    800039ae:	8c4080e7          	jalr	-1852(ra) # 8000126e <acquire>
}
    800039b2:	0001                	nop
    800039b4:	70a2                	ld	ra,40(sp)
    800039b6:	7402                	ld	s0,32(sp)
    800039b8:	6145                	addi	sp,sp,48
    800039ba:	8082                	ret

00000000800039bc <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    800039bc:	7179                	addi	sp,sp,-48
    800039be:	f406                	sd	ra,40(sp)
    800039c0:	f022                	sd	s0,32(sp)
    800039c2:	1800                	addi	s0,sp,48
    800039c4:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800039c8:	00011797          	auipc	a5,0x11
    800039cc:	cf078793          	addi	a5,a5,-784 # 800146b8 <proc>
    800039d0:	fef43423          	sd	a5,-24(s0)
    800039d4:	a8bd                	j	80003a52 <wakeup+0x96>
    if(p != myproc()){
    800039d6:	fffff097          	auipc	ra,0xfffff
    800039da:	e3e080e7          	jalr	-450(ra) # 80002814 <myproc>
    800039de:	872a                	mv	a4,a0
    800039e0:	fe843783          	ld	a5,-24(s0)
    800039e4:	06e78163          	beq	a5,a4,80003a46 <wakeup+0x8a>
      acquire(&p->lock);
    800039e8:	fe843783          	ld	a5,-24(s0)
    800039ec:	853e                	mv	a0,a5
    800039ee:	ffffe097          	auipc	ra,0xffffe
    800039f2:	880080e7          	jalr	-1920(ra) # 8000126e <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    800039f6:	fe843783          	ld	a5,-24(s0)
    800039fa:	4f9c                	lw	a5,24(a5)
    800039fc:	873e                	mv	a4,a5
    800039fe:	4789                	li	a5,2
    80003a00:	02f71c63          	bne	a4,a5,80003a38 <wakeup+0x7c>
    80003a04:	fe843783          	ld	a5,-24(s0)
    80003a08:	739c                	ld	a5,32(a5)
    80003a0a:	fd843703          	ld	a4,-40(s0)
    80003a0e:	02f71563          	bne	a4,a5,80003a38 <wakeup+0x7c>
          if(flag==3)
    80003a12:	00008797          	auipc	a5,0x8
    80003a16:	61a78793          	addi	a5,a5,1562 # 8000c02c <flag>
    80003a1a:	439c                	lw	a5,0(a5)
    80003a1c:	873e                	mv	a4,a5
    80003a1e:	478d                	li	a5,3
    80003a20:	00f71663          	bne	a4,a5,80003a2c <wakeup+0x70>
          p->CPUtime=0;
    80003a24:	fe843783          	ld	a5,-24(s0)
    80003a28:	0407a423          	sw	zero,72(a5)
          put(p);
    80003a2c:	fe843503          	ld	a0,-24(s0)
    80003a30:	00000097          	auipc	ra,0x0
    80003a34:	c82080e7          	jalr	-894(ra) # 800036b2 <put>
      }
      release(&p->lock);
    80003a38:	fe843783          	ld	a5,-24(s0)
    80003a3c:	853e                	mv	a0,a5
    80003a3e:	ffffe097          	auipc	ra,0xffffe
    80003a42:	894080e7          	jalr	-1900(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80003a46:	fe843783          	ld	a5,-24(s0)
    80003a4a:	18878793          	addi	a5,a5,392
    80003a4e:	fef43423          	sd	a5,-24(s0)
    80003a52:	fe843703          	ld	a4,-24(s0)
    80003a56:	00017797          	auipc	a5,0x17
    80003a5a:	e6278793          	addi	a5,a5,-414 # 8001a8b8 <pid_lock>
    80003a5e:	f6f76ce3          	bltu	a4,a5,800039d6 <wakeup+0x1a>
    }
  }
}
    80003a62:	0001                	nop
    80003a64:	0001                	nop
    80003a66:	70a2                	ld	ra,40(sp)
    80003a68:	7402                	ld	s0,32(sp)
    80003a6a:	6145                	addi	sp,sp,48
    80003a6c:	8082                	ret

0000000080003a6e <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80003a6e:	7179                	addi	sp,sp,-48
    80003a70:	f406                	sd	ra,40(sp)
    80003a72:	f022                	sd	s0,32(sp)
    80003a74:	1800                	addi	s0,sp,48
    80003a76:	87aa                	mv	a5,a0
    80003a78:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80003a7c:	00011797          	auipc	a5,0x11
    80003a80:	c3c78793          	addi	a5,a5,-964 # 800146b8 <proc>
    80003a84:	fef43423          	sd	a5,-24(s0)
    80003a88:	a051                	j	80003b0c <kill+0x9e>
    acquire(&p->lock);
    80003a8a:	fe843783          	ld	a5,-24(s0)
    80003a8e:	853e                	mv	a0,a5
    80003a90:	ffffd097          	auipc	ra,0xffffd
    80003a94:	7de080e7          	jalr	2014(ra) # 8000126e <acquire>
    if(p->pid == pid){
    80003a98:	fe843783          	ld	a5,-24(s0)
    80003a9c:	5b98                	lw	a4,48(a5)
    80003a9e:	fdc42783          	lw	a5,-36(s0)
    80003aa2:	2781                	sext.w	a5,a5
    80003aa4:	04e79763          	bne	a5,a4,80003af2 <kill+0x84>
      p->killed = 1;
    80003aa8:	fe843783          	ld	a5,-24(s0)
    80003aac:	4705                	li	a4,1
    80003aae:	d798                	sw	a4,40(a5)
      numProc-=1;
    80003ab0:	00008797          	auipc	a5,0x8
    80003ab4:	59878793          	addi	a5,a5,1432 # 8000c048 <numProc>
    80003ab8:	439c                	lw	a5,0(a5)
    80003aba:	37fd                	addiw	a5,a5,-1
    80003abc:	0007871b          	sext.w	a4,a5
    80003ac0:	00008797          	auipc	a5,0x8
    80003ac4:	58878793          	addi	a5,a5,1416 # 8000c048 <numProc>
    80003ac8:	c398                	sw	a4,0(a5)
      if(p->state == SLEEPING){
    80003aca:	fe843783          	ld	a5,-24(s0)
    80003ace:	4f9c                	lw	a5,24(a5)
    80003ad0:	873e                	mv	a4,a5
    80003ad2:	4789                	li	a5,2
    80003ad4:	00f71663          	bne	a4,a5,80003ae0 <kill+0x72>
        // Wake process from sleep().
        p->state = RUNNABLE;
    80003ad8:	fe843783          	ld	a5,-24(s0)
    80003adc:	470d                	li	a4,3
    80003ade:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003ae0:	fe843783          	ld	a5,-24(s0)
    80003ae4:	853e                	mv	a0,a5
    80003ae6:	ffffd097          	auipc	ra,0xffffd
    80003aea:	7ec080e7          	jalr	2028(ra) # 800012d2 <release>
      return 0;
    80003aee:	4781                	li	a5,0
    80003af0:	a03d                	j	80003b1e <kill+0xb0>
    }
    release(&p->lock);
    80003af2:	fe843783          	ld	a5,-24(s0)
    80003af6:	853e                	mv	a0,a5
    80003af8:	ffffd097          	auipc	ra,0xffffd
    80003afc:	7da080e7          	jalr	2010(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80003b00:	fe843783          	ld	a5,-24(s0)
    80003b04:	18878793          	addi	a5,a5,392
    80003b08:	fef43423          	sd	a5,-24(s0)
    80003b0c:	fe843703          	ld	a4,-24(s0)
    80003b10:	00017797          	auipc	a5,0x17
    80003b14:	da878793          	addi	a5,a5,-600 # 8001a8b8 <pid_lock>
    80003b18:	f6f769e3          	bltu	a4,a5,80003a8a <kill+0x1c>
  }
  return -1;
    80003b1c:	57fd                	li	a5,-1
}
    80003b1e:	853e                	mv	a0,a5
    80003b20:	70a2                	ld	ra,40(sp)
    80003b22:	7402                	ld	s0,32(sp)
    80003b24:	6145                	addi	sp,sp,48
    80003b26:	8082                	ret

0000000080003b28 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80003b28:	7139                	addi	sp,sp,-64
    80003b2a:	fc06                	sd	ra,56(sp)
    80003b2c:	f822                	sd	s0,48(sp)
    80003b2e:	0080                	addi	s0,sp,64
    80003b30:	87aa                	mv	a5,a0
    80003b32:	fcb43823          	sd	a1,-48(s0)
    80003b36:	fcc43423          	sd	a2,-56(s0)
    80003b3a:	fcd43023          	sd	a3,-64(s0)
    80003b3e:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80003b42:	fffff097          	auipc	ra,0xfffff
    80003b46:	cd2080e7          	jalr	-814(ra) # 80002814 <myproc>
    80003b4a:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80003b4e:	fdc42783          	lw	a5,-36(s0)
    80003b52:	2781                	sext.w	a5,a5
    80003b54:	c38d                	beqz	a5,80003b76 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    80003b56:	fe843783          	ld	a5,-24(s0)
    80003b5a:	7bbc                	ld	a5,112(a5)
    80003b5c:	fc043683          	ld	a3,-64(s0)
    80003b60:	fc843603          	ld	a2,-56(s0)
    80003b64:	fd043583          	ld	a1,-48(s0)
    80003b68:	853e                	mv	a0,a5
    80003b6a:	ffffe097          	auipc	ra,0xffffe
    80003b6e:	77c080e7          	jalr	1916(ra) # 800022e6 <copyout>
    80003b72:	87aa                	mv	a5,a0
    80003b74:	a839                	j	80003b92 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    80003b76:	fd043783          	ld	a5,-48(s0)
    80003b7a:	fc043703          	ld	a4,-64(s0)
    80003b7e:	2701                	sext.w	a4,a4
    80003b80:	863a                	mv	a2,a4
    80003b82:	fc843583          	ld	a1,-56(s0)
    80003b86:	853e                	mv	a0,a5
    80003b88:	ffffe097          	auipc	ra,0xffffe
    80003b8c:	99e080e7          	jalr	-1634(ra) # 80001526 <memmove>
    return 0;
    80003b90:	4781                	li	a5,0
  }
}
    80003b92:	853e                	mv	a0,a5
    80003b94:	70e2                	ld	ra,56(sp)
    80003b96:	7442                	ld	s0,48(sp)
    80003b98:	6121                	addi	sp,sp,64
    80003b9a:	8082                	ret

0000000080003b9c <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80003b9c:	7139                	addi	sp,sp,-64
    80003b9e:	fc06                	sd	ra,56(sp)
    80003ba0:	f822                	sd	s0,48(sp)
    80003ba2:	0080                	addi	s0,sp,64
    80003ba4:	fca43c23          	sd	a0,-40(s0)
    80003ba8:	87ae                	mv	a5,a1
    80003baa:	fcc43423          	sd	a2,-56(s0)
    80003bae:	fcd43023          	sd	a3,-64(s0)
    80003bb2:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    80003bb6:	fffff097          	auipc	ra,0xfffff
    80003bba:	c5e080e7          	jalr	-930(ra) # 80002814 <myproc>
    80003bbe:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80003bc2:	fd442783          	lw	a5,-44(s0)
    80003bc6:	2781                	sext.w	a5,a5
    80003bc8:	c38d                	beqz	a5,80003bea <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    80003bca:	fe843783          	ld	a5,-24(s0)
    80003bce:	7bbc                	ld	a5,112(a5)
    80003bd0:	fc043683          	ld	a3,-64(s0)
    80003bd4:	fc843603          	ld	a2,-56(s0)
    80003bd8:	fd843583          	ld	a1,-40(s0)
    80003bdc:	853e                	mv	a0,a5
    80003bde:	ffffe097          	auipc	ra,0xffffe
    80003be2:	7d6080e7          	jalr	2006(ra) # 800023b4 <copyin>
    80003be6:	87aa                	mv	a5,a0
    80003be8:	a839                	j	80003c06 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    80003bea:	fc843783          	ld	a5,-56(s0)
    80003bee:	fc043703          	ld	a4,-64(s0)
    80003bf2:	2701                	sext.w	a4,a4
    80003bf4:	863a                	mv	a2,a4
    80003bf6:	85be                	mv	a1,a5
    80003bf8:	fd843503          	ld	a0,-40(s0)
    80003bfc:	ffffe097          	auipc	ra,0xffffe
    80003c00:	92a080e7          	jalr	-1750(ra) # 80001526 <memmove>
    return 0;
    80003c04:	4781                	li	a5,0
  }
}
    80003c06:	853e                	mv	a0,a5
    80003c08:	70e2                	ld	ra,56(sp)
    80003c0a:	7442                	ld	s0,48(sp)
    80003c0c:	6121                	addi	sp,sp,64
    80003c0e:	8082                	ret

0000000080003c10 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003c10:	1101                	addi	sp,sp,-32
    80003c12:	ec06                	sd	ra,24(sp)
    80003c14:	e822                	sd	s0,16(sp)
    80003c16:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003c18:	00007517          	auipc	a0,0x7
    80003c1c:	65050513          	addi	a0,a0,1616 # 8000b268 <etext+0x268>
    80003c20:	ffffd097          	auipc	ra,0xffffd
    80003c24:	e08080e7          	jalr	-504(ra) # 80000a28 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003c28:	00011797          	auipc	a5,0x11
    80003c2c:	a9078793          	addi	a5,a5,-1392 # 800146b8 <proc>
    80003c30:	fef43423          	sd	a5,-24(s0)
    80003c34:	a04d                	j	80003cd6 <procdump+0xc6>
    if(p->state == UNUSED)
    80003c36:	fe843783          	ld	a5,-24(s0)
    80003c3a:	4f9c                	lw	a5,24(a5)
    80003c3c:	c7d1                	beqz	a5,80003cc8 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003c3e:	fe843783          	ld	a5,-24(s0)
    80003c42:	4f9c                	lw	a5,24(a5)
    80003c44:	873e                	mv	a4,a5
    80003c46:	4795                	li	a5,5
    80003c48:	02e7ee63          	bltu	a5,a4,80003c84 <procdump+0x74>
    80003c4c:	fe843783          	ld	a5,-24(s0)
    80003c50:	4f9c                	lw	a5,24(a5)
    80003c52:	00008717          	auipc	a4,0x8
    80003c56:	b3e70713          	addi	a4,a4,-1218 # 8000b790 <states.1777>
    80003c5a:	1782                	slli	a5,a5,0x20
    80003c5c:	9381                	srli	a5,a5,0x20
    80003c5e:	078e                	slli	a5,a5,0x3
    80003c60:	97ba                	add	a5,a5,a4
    80003c62:	639c                	ld	a5,0(a5)
    80003c64:	c385                	beqz	a5,80003c84 <procdump+0x74>
      state = states[p->state];
    80003c66:	fe843783          	ld	a5,-24(s0)
    80003c6a:	4f9c                	lw	a5,24(a5)
    80003c6c:	00008717          	auipc	a4,0x8
    80003c70:	b2470713          	addi	a4,a4,-1244 # 8000b790 <states.1777>
    80003c74:	1782                	slli	a5,a5,0x20
    80003c76:	9381                	srli	a5,a5,0x20
    80003c78:	078e                	slli	a5,a5,0x3
    80003c7a:	97ba                	add	a5,a5,a4
    80003c7c:	639c                	ld	a5,0(a5)
    80003c7e:	fef43023          	sd	a5,-32(s0)
    80003c82:	a039                	j	80003c90 <procdump+0x80>
    else
      state = "???";
    80003c84:	00007797          	auipc	a5,0x7
    80003c88:	5ec78793          	addi	a5,a5,1516 # 8000b270 <etext+0x270>
    80003c8c:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003c90:	fe843783          	ld	a5,-24(s0)
    80003c94:	5b98                	lw	a4,48(a5)
    80003c96:	fe843783          	ld	a5,-24(s0)
    80003c9a:	17878793          	addi	a5,a5,376
    80003c9e:	86be                	mv	a3,a5
    80003ca0:	fe043603          	ld	a2,-32(s0)
    80003ca4:	85ba                	mv	a1,a4
    80003ca6:	00007517          	auipc	a0,0x7
    80003caa:	5d250513          	addi	a0,a0,1490 # 8000b278 <etext+0x278>
    80003cae:	ffffd097          	auipc	ra,0xffffd
    80003cb2:	d7a080e7          	jalr	-646(ra) # 80000a28 <printf>
    printf("\n");
    80003cb6:	00007517          	auipc	a0,0x7
    80003cba:	5b250513          	addi	a0,a0,1458 # 8000b268 <etext+0x268>
    80003cbe:	ffffd097          	auipc	ra,0xffffd
    80003cc2:	d6a080e7          	jalr	-662(ra) # 80000a28 <printf>
    80003cc6:	a011                	j	80003cca <procdump+0xba>
      continue;
    80003cc8:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80003cca:	fe843783          	ld	a5,-24(s0)
    80003cce:	18878793          	addi	a5,a5,392
    80003cd2:	fef43423          	sd	a5,-24(s0)
    80003cd6:	fe843703          	ld	a4,-24(s0)
    80003cda:	00017797          	auipc	a5,0x17
    80003cde:	bde78793          	addi	a5,a5,-1058 # 8001a8b8 <pid_lock>
    80003ce2:	f4f76ae3          	bltu	a4,a5,80003c36 <procdump+0x26>
  }
}
    80003ce6:	0001                	nop
    80003ce8:	0001                	nop
    80003cea:	60e2                	ld	ra,24(sp)
    80003cec:	6442                	ld	s0,16(sp)
    80003cee:	6105                	addi	sp,sp,32
    80003cf0:	8082                	ret

0000000080003cf2 <swtch>:
    80003cf2:	00153023          	sd	ra,0(a0)
    80003cf6:	00253423          	sd	sp,8(a0)
    80003cfa:	e900                	sd	s0,16(a0)
    80003cfc:	ed04                	sd	s1,24(a0)
    80003cfe:	03253023          	sd	s2,32(a0)
    80003d02:	03353423          	sd	s3,40(a0)
    80003d06:	03453823          	sd	s4,48(a0)
    80003d0a:	03553c23          	sd	s5,56(a0)
    80003d0e:	05653023          	sd	s6,64(a0)
    80003d12:	05753423          	sd	s7,72(a0)
    80003d16:	05853823          	sd	s8,80(a0)
    80003d1a:	05953c23          	sd	s9,88(a0)
    80003d1e:	07a53023          	sd	s10,96(a0)
    80003d22:	07b53423          	sd	s11,104(a0)
    80003d26:	0005b083          	ld	ra,0(a1)
    80003d2a:	0085b103          	ld	sp,8(a1)
    80003d2e:	6980                	ld	s0,16(a1)
    80003d30:	6d84                	ld	s1,24(a1)
    80003d32:	0205b903          	ld	s2,32(a1)
    80003d36:	0285b983          	ld	s3,40(a1)
    80003d3a:	0305ba03          	ld	s4,48(a1)
    80003d3e:	0385ba83          	ld	s5,56(a1)
    80003d42:	0405bb03          	ld	s6,64(a1)
    80003d46:	0485bb83          	ld	s7,72(a1)
    80003d4a:	0505bc03          	ld	s8,80(a1)
    80003d4e:	0585bc83          	ld	s9,88(a1)
    80003d52:	0605bd03          	ld	s10,96(a1)
    80003d56:	0685bd83          	ld	s11,104(a1)
    80003d5a:	8082                	ret

0000000080003d5c <r_sstatus>:
{
    80003d5c:	1101                	addi	sp,sp,-32
    80003d5e:	ec22                	sd	s0,24(sp)
    80003d60:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003d62:	100027f3          	csrr	a5,sstatus
    80003d66:	fef43423          	sd	a5,-24(s0)
  return x;
    80003d6a:	fe843783          	ld	a5,-24(s0)
}
    80003d6e:	853e                	mv	a0,a5
    80003d70:	6462                	ld	s0,24(sp)
    80003d72:	6105                	addi	sp,sp,32
    80003d74:	8082                	ret

0000000080003d76 <w_sstatus>:
{
    80003d76:	1101                	addi	sp,sp,-32
    80003d78:	ec22                	sd	s0,24(sp)
    80003d7a:	1000                	addi	s0,sp,32
    80003d7c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003d80:	fe843783          	ld	a5,-24(s0)
    80003d84:	10079073          	csrw	sstatus,a5
}
    80003d88:	0001                	nop
    80003d8a:	6462                	ld	s0,24(sp)
    80003d8c:	6105                	addi	sp,sp,32
    80003d8e:	8082                	ret

0000000080003d90 <r_sip>:
{
    80003d90:	1101                	addi	sp,sp,-32
    80003d92:	ec22                	sd	s0,24(sp)
    80003d94:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003d96:	144027f3          	csrr	a5,sip
    80003d9a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003d9e:	fe843783          	ld	a5,-24(s0)
}
    80003da2:	853e                	mv	a0,a5
    80003da4:	6462                	ld	s0,24(sp)
    80003da6:	6105                	addi	sp,sp,32
    80003da8:	8082                	ret

0000000080003daa <w_sip>:
{
    80003daa:	1101                	addi	sp,sp,-32
    80003dac:	ec22                	sd	s0,24(sp)
    80003dae:	1000                	addi	s0,sp,32
    80003db0:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003db4:	fe843783          	ld	a5,-24(s0)
    80003db8:	14479073          	csrw	sip,a5
}
    80003dbc:	0001                	nop
    80003dbe:	6462                	ld	s0,24(sp)
    80003dc0:	6105                	addi	sp,sp,32
    80003dc2:	8082                	ret

0000000080003dc4 <w_sepc>:
{
    80003dc4:	1101                	addi	sp,sp,-32
    80003dc6:	ec22                	sd	s0,24(sp)
    80003dc8:	1000                	addi	s0,sp,32
    80003dca:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003dce:	fe843783          	ld	a5,-24(s0)
    80003dd2:	14179073          	csrw	sepc,a5
}
    80003dd6:	0001                	nop
    80003dd8:	6462                	ld	s0,24(sp)
    80003dda:	6105                	addi	sp,sp,32
    80003ddc:	8082                	ret

0000000080003dde <r_sepc>:
{
    80003dde:	1101                	addi	sp,sp,-32
    80003de0:	ec22                	sd	s0,24(sp)
    80003de2:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003de4:	141027f3          	csrr	a5,sepc
    80003de8:	fef43423          	sd	a5,-24(s0)
  return x;
    80003dec:	fe843783          	ld	a5,-24(s0)
}
    80003df0:	853e                	mv	a0,a5
    80003df2:	6462                	ld	s0,24(sp)
    80003df4:	6105                	addi	sp,sp,32
    80003df6:	8082                	ret

0000000080003df8 <w_stvec>:
{
    80003df8:	1101                	addi	sp,sp,-32
    80003dfa:	ec22                	sd	s0,24(sp)
    80003dfc:	1000                	addi	s0,sp,32
    80003dfe:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003e02:	fe843783          	ld	a5,-24(s0)
    80003e06:	10579073          	csrw	stvec,a5
}
    80003e0a:	0001                	nop
    80003e0c:	6462                	ld	s0,24(sp)
    80003e0e:	6105                	addi	sp,sp,32
    80003e10:	8082                	ret

0000000080003e12 <r_satp>:
{
    80003e12:	1101                	addi	sp,sp,-32
    80003e14:	ec22                	sd	s0,24(sp)
    80003e16:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003e18:	180027f3          	csrr	a5,satp
    80003e1c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003e20:	fe843783          	ld	a5,-24(s0)
}
    80003e24:	853e                	mv	a0,a5
    80003e26:	6462                	ld	s0,24(sp)
    80003e28:	6105                	addi	sp,sp,32
    80003e2a:	8082                	ret

0000000080003e2c <r_scause>:
{
    80003e2c:	1101                	addi	sp,sp,-32
    80003e2e:	ec22                	sd	s0,24(sp)
    80003e30:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003e32:	142027f3          	csrr	a5,scause
    80003e36:	fef43423          	sd	a5,-24(s0)
  return x;
    80003e3a:	fe843783          	ld	a5,-24(s0)
}
    80003e3e:	853e                	mv	a0,a5
    80003e40:	6462                	ld	s0,24(sp)
    80003e42:	6105                	addi	sp,sp,32
    80003e44:	8082                	ret

0000000080003e46 <r_stval>:
{
    80003e46:	1101                	addi	sp,sp,-32
    80003e48:	ec22                	sd	s0,24(sp)
    80003e4a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003e4c:	143027f3          	csrr	a5,stval
    80003e50:	fef43423          	sd	a5,-24(s0)
  return x;
    80003e54:	fe843783          	ld	a5,-24(s0)
}
    80003e58:	853e                	mv	a0,a5
    80003e5a:	6462                	ld	s0,24(sp)
    80003e5c:	6105                	addi	sp,sp,32
    80003e5e:	8082                	ret

0000000080003e60 <intr_on>:
{
    80003e60:	1141                	addi	sp,sp,-16
    80003e62:	e406                	sd	ra,8(sp)
    80003e64:	e022                	sd	s0,0(sp)
    80003e66:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003e68:	00000097          	auipc	ra,0x0
    80003e6c:	ef4080e7          	jalr	-268(ra) # 80003d5c <r_sstatus>
    80003e70:	87aa                	mv	a5,a0
    80003e72:	0027e793          	ori	a5,a5,2
    80003e76:	853e                	mv	a0,a5
    80003e78:	00000097          	auipc	ra,0x0
    80003e7c:	efe080e7          	jalr	-258(ra) # 80003d76 <w_sstatus>
}
    80003e80:	0001                	nop
    80003e82:	60a2                	ld	ra,8(sp)
    80003e84:	6402                	ld	s0,0(sp)
    80003e86:	0141                	addi	sp,sp,16
    80003e88:	8082                	ret

0000000080003e8a <intr_off>:
{
    80003e8a:	1141                	addi	sp,sp,-16
    80003e8c:	e406                	sd	ra,8(sp)
    80003e8e:	e022                	sd	s0,0(sp)
    80003e90:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003e92:	00000097          	auipc	ra,0x0
    80003e96:	eca080e7          	jalr	-310(ra) # 80003d5c <r_sstatus>
    80003e9a:	87aa                	mv	a5,a0
    80003e9c:	9bf5                	andi	a5,a5,-3
    80003e9e:	853e                	mv	a0,a5
    80003ea0:	00000097          	auipc	ra,0x0
    80003ea4:	ed6080e7          	jalr	-298(ra) # 80003d76 <w_sstatus>
}
    80003ea8:	0001                	nop
    80003eaa:	60a2                	ld	ra,8(sp)
    80003eac:	6402                	ld	s0,0(sp)
    80003eae:	0141                	addi	sp,sp,16
    80003eb0:	8082                	ret

0000000080003eb2 <intr_get>:
{
    80003eb2:	1101                	addi	sp,sp,-32
    80003eb4:	ec06                	sd	ra,24(sp)
    80003eb6:	e822                	sd	s0,16(sp)
    80003eb8:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003eba:	00000097          	auipc	ra,0x0
    80003ebe:	ea2080e7          	jalr	-350(ra) # 80003d5c <r_sstatus>
    80003ec2:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003ec6:	fe843783          	ld	a5,-24(s0)
    80003eca:	8b89                	andi	a5,a5,2
    80003ecc:	00f037b3          	snez	a5,a5
    80003ed0:	0ff7f793          	andi	a5,a5,255
    80003ed4:	2781                	sext.w	a5,a5
}
    80003ed6:	853e                	mv	a0,a5
    80003ed8:	60e2                	ld	ra,24(sp)
    80003eda:	6442                	ld	s0,16(sp)
    80003edc:	6105                	addi	sp,sp,32
    80003ede:	8082                	ret

0000000080003ee0 <r_tp>:
{
    80003ee0:	1101                	addi	sp,sp,-32
    80003ee2:	ec22                	sd	s0,24(sp)
    80003ee4:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003ee6:	8792                	mv	a5,tp
    80003ee8:	fef43423          	sd	a5,-24(s0)
  return x;
    80003eec:	fe843783          	ld	a5,-24(s0)
}
    80003ef0:	853e                	mv	a0,a5
    80003ef2:	6462                	ld	s0,24(sp)
    80003ef4:	6105                	addi	sp,sp,32
    80003ef6:	8082                	ret

0000000080003ef8 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003ef8:	1141                	addi	sp,sp,-16
    80003efa:	e406                	sd	ra,8(sp)
    80003efc:	e022                	sd	s0,0(sp)
    80003efe:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003f00:	00007597          	auipc	a1,0x7
    80003f04:	3b858593          	addi	a1,a1,952 # 8000b2b8 <etext+0x2b8>
    80003f08:	00017517          	auipc	a0,0x17
    80003f0c:	9e050513          	addi	a0,a0,-1568 # 8001a8e8 <tickslock>
    80003f10:	ffffd097          	auipc	ra,0xffffd
    80003f14:	32e080e7          	jalr	814(ra) # 8000123e <initlock>
}
    80003f18:	0001                	nop
    80003f1a:	60a2                	ld	ra,8(sp)
    80003f1c:	6402                	ld	s0,0(sp)
    80003f1e:	0141                	addi	sp,sp,16
    80003f20:	8082                	ret

0000000080003f22 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003f22:	1141                	addi	sp,sp,-16
    80003f24:	e406                	sd	ra,8(sp)
    80003f26:	e022                	sd	s0,0(sp)
    80003f28:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003f2a:	00005797          	auipc	a5,0x5
    80003f2e:	f4678793          	addi	a5,a5,-186 # 80008e70 <kernelvec>
    80003f32:	853e                	mv	a0,a5
    80003f34:	00000097          	auipc	ra,0x0
    80003f38:	ec4080e7          	jalr	-316(ra) # 80003df8 <w_stvec>
}
    80003f3c:	0001                	nop
    80003f3e:	60a2                	ld	ra,8(sp)
    80003f40:	6402                	ld	s0,0(sp)
    80003f42:	0141                	addi	sp,sp,16
    80003f44:	8082                	ret

0000000080003f46 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003f46:	7139                	addi	sp,sp,-64
    80003f48:	fc06                	sd	ra,56(sp)
    80003f4a:	f822                	sd	s0,48(sp)
    80003f4c:	f426                	sd	s1,40(sp)
    80003f4e:	0080                	addi	s0,sp,64
    int which_dev = 0;
    80003f50:	fc042e23          	sw	zero,-36(s0)

    if((r_sstatus() & SSTATUS_SPP) != 0)
    80003f54:	00000097          	auipc	ra,0x0
    80003f58:	e08080e7          	jalr	-504(ra) # 80003d5c <r_sstatus>
    80003f5c:	87aa                	mv	a5,a0
    80003f5e:	1007f793          	andi	a5,a5,256
    80003f62:	cb89                	beqz	a5,80003f74 <usertrap+0x2e>
        panic("usertrap: not from user mode");
    80003f64:	00007517          	auipc	a0,0x7
    80003f68:	35c50513          	addi	a0,a0,860 # 8000b2c0 <etext+0x2c0>
    80003f6c:	ffffd097          	auipc	ra,0xffffd
    80003f70:	d12080e7          	jalr	-750(ra) # 80000c7e <panic>

    // send interrupts and exceptions to kerneltrap(),
    // since we're now in the kernel.
    w_stvec((uint64)kernelvec);
    80003f74:	00005797          	auipc	a5,0x5
    80003f78:	efc78793          	addi	a5,a5,-260 # 80008e70 <kernelvec>
    80003f7c:	853e                	mv	a0,a5
    80003f7e:	00000097          	auipc	ra,0x0
    80003f82:	e7a080e7          	jalr	-390(ra) # 80003df8 <w_stvec>

    struct proc *p = myproc();
    80003f86:	fffff097          	auipc	ra,0xfffff
    80003f8a:	88e080e7          	jalr	-1906(ra) # 80002814 <myproc>
    80003f8e:	fca43823          	sd	a0,-48(s0)

    // save user program counter.
    p->trapframe->epc = r_sepc();
    80003f92:	fd043783          	ld	a5,-48(s0)
    80003f96:	7fa4                	ld	s1,120(a5)
    80003f98:	00000097          	auipc	ra,0x0
    80003f9c:	e46080e7          	jalr	-442(ra) # 80003dde <r_sepc>
    80003fa0:	87aa                	mv	a5,a0
    80003fa2:	ec9c                	sd	a5,24(s1)

    if(r_scause() == 8){
    80003fa4:	00000097          	auipc	ra,0x0
    80003fa8:	e88080e7          	jalr	-376(ra) # 80003e2c <r_scause>
    80003fac:	872a                	mv	a4,a0
    80003fae:	47a1                	li	a5,8
    80003fb0:	02f71d63          	bne	a4,a5,80003fea <usertrap+0xa4>
        // system call

        if(p->killed)
    80003fb4:	fd043783          	ld	a5,-48(s0)
    80003fb8:	579c                	lw	a5,40(a5)
    80003fba:	c791                	beqz	a5,80003fc6 <usertrap+0x80>
            exit(-1);
    80003fbc:	557d                	li	a0,-1
    80003fbe:	fffff097          	auipc	ra,0xfffff
    80003fc2:	026080e7          	jalr	38(ra) # 80002fe4 <exit>

        // sepc points to the ecall instruction,
        // but we want to return to the next instruction.
        p->trapframe->epc += 4;
    80003fc6:	fd043783          	ld	a5,-48(s0)
    80003fca:	7fbc                	ld	a5,120(a5)
    80003fcc:	6f98                	ld	a4,24(a5)
    80003fce:	fd043783          	ld	a5,-48(s0)
    80003fd2:	7fbc                	ld	a5,120(a5)
    80003fd4:	0711                	addi	a4,a4,4
    80003fd6:	ef98                	sd	a4,24(a5)

        // an interrupt will change sstatus &c registers,
        // so don't enable until done with those registers.
        intr_on();
    80003fd8:	00000097          	auipc	ra,0x0
    80003fdc:	e88080e7          	jalr	-376(ra) # 80003e60 <intr_on>

        syscall();
    80003fe0:	00001097          	auipc	ra,0x1
    80003fe4:	82a080e7          	jalr	-2006(ra) # 8000480a <syscall>
    80003fe8:	a0b5                	j	80004054 <usertrap+0x10e>
    } else if((which_dev = devintr()) != 0){
    80003fea:	00000097          	auipc	ra,0x0
    80003fee:	4f2080e7          	jalr	1266(ra) # 800044dc <devintr>
    80003ff2:	87aa                	mv	a5,a0
    80003ff4:	fcf42e23          	sw	a5,-36(s0)
    80003ff8:	fdc42783          	lw	a5,-36(s0)
    80003ffc:	2781                	sext.w	a5,a5
    80003ffe:	ebb9                	bnez	a5,80004054 <usertrap+0x10e>
        // ok
    } else {
        printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80004000:	00000097          	auipc	ra,0x0
    80004004:	e2c080e7          	jalr	-468(ra) # 80003e2c <r_scause>
    80004008:	872a                	mv	a4,a0
    8000400a:	fd043783          	ld	a5,-48(s0)
    8000400e:	5b9c                	lw	a5,48(a5)
    80004010:	863e                	mv	a2,a5
    80004012:	85ba                	mv	a1,a4
    80004014:	00007517          	auipc	a0,0x7
    80004018:	2cc50513          	addi	a0,a0,716 # 8000b2e0 <etext+0x2e0>
    8000401c:	ffffd097          	auipc	ra,0xffffd
    80004020:	a0c080e7          	jalr	-1524(ra) # 80000a28 <printf>
        printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80004024:	00000097          	auipc	ra,0x0
    80004028:	dba080e7          	jalr	-582(ra) # 80003dde <r_sepc>
    8000402c:	84aa                	mv	s1,a0
    8000402e:	00000097          	auipc	ra,0x0
    80004032:	e18080e7          	jalr	-488(ra) # 80003e46 <r_stval>
    80004036:	87aa                	mv	a5,a0
    80004038:	863e                	mv	a2,a5
    8000403a:	85a6                	mv	a1,s1
    8000403c:	00007517          	auipc	a0,0x7
    80004040:	2d450513          	addi	a0,a0,724 # 8000b310 <etext+0x310>
    80004044:	ffffd097          	auipc	ra,0xffffd
    80004048:	9e4080e7          	jalr	-1564(ra) # 80000a28 <printf>
        p->killed = 1;
    8000404c:	fd043783          	ld	a5,-48(s0)
    80004050:	4705                	li	a4,1
    80004052:	d798                	sw	a4,40(a5)
    }

    if(p->killed)
    80004054:	fd043783          	ld	a5,-48(s0)
    80004058:	579c                	lw	a5,40(a5)
    8000405a:	c791                	beqz	a5,80004066 <usertrap+0x120>
        exit(-1);
    8000405c:	557d                	li	a0,-1
    8000405e:	fffff097          	auipc	ra,0xfffff
    80004062:	f86080e7          	jalr	-122(ra) # 80002fe4 <exit>

    // give up the CPU if this is a timer interrupt.
    if(which_dev == 2) {
    80004066:	fdc42783          	lw	a5,-36(s0)
    8000406a:	0007871b          	sext.w	a4,a5
    8000406e:	4789                	li	a5,2
    80004070:	0cf71e63          	bne	a4,a5,8000414c <usertrap+0x206>
        int* TIME=get_TIME();
    80004074:	00000097          	auipc	ra,0x0
    80004078:	802080e7          	jalr	-2046(ra) # 80003876 <get_TIME>
    8000407c:	fca43423          	sd	a0,-56(s0)
        int* flag=get_flag();
    80004080:	00000097          	auipc	ra,0x0
    80004084:	80c080e7          	jalr	-2036(ra) # 8000388c <get_flag>
    80004088:	fca43023          	sd	a0,-64(s0)
        *TIME+=1;
    8000408c:	fc843783          	ld	a5,-56(s0)
    80004090:	439c                	lw	a5,0(a5)
    80004092:	2785                	addiw	a5,a5,1
    80004094:	0007871b          	sext.w	a4,a5
    80004098:	fc843783          	ld	a5,-56(s0)
    8000409c:	c398                	sw	a4,0(a5)
        p->CPUtime+=1;
    8000409e:	fd043783          	ld	a5,-48(s0)
    800040a2:	47bc                	lw	a5,72(a5)
    800040a4:	2785                	addiw	a5,a5,1
    800040a6:	0007871b          	sext.w	a4,a5
    800040aa:	fd043783          	ld	a5,-48(s0)
    800040ae:	c7b8                	sw	a4,72(a5)
        if(*flag==2 || *flag==1){
    800040b0:	fc043783          	ld	a5,-64(s0)
    800040b4:	439c                	lw	a5,0(a5)
    800040b6:	873e                	mv	a4,a5
    800040b8:	4789                	li	a5,2
    800040ba:	00f70963          	beq	a4,a5,800040cc <usertrap+0x186>
    800040be:	fc043783          	ld	a5,-64(s0)
    800040c2:	439c                	lw	a5,0(a5)
    800040c4:	873e                	mv	a4,a5
    800040c6:	4785                	li	a5,1
    800040c8:	00f71c63          	bne	a4,a5,800040e0 <usertrap+0x19a>
            p->SJBtimeN1=p->SJBtimeN1-1;
    800040cc:	fd043783          	ld	a5,-48(s0)
    800040d0:	4bfc                	lw	a5,84(a5)
    800040d2:	37fd                	addiw	a5,a5,-1
    800040d4:	0007871b          	sext.w	a4,a5
    800040d8:	fd043783          	ld	a5,-48(s0)
    800040dc:	cbf8                	sw	a4,84(a5)
    800040de:	a00d                	j	80004100 <usertrap+0x1ba>
        }else if(*flag==3){
    800040e0:	fc043783          	ld	a5,-64(s0)
    800040e4:	439c                	lw	a5,0(a5)
    800040e6:	873e                	mv	a4,a5
    800040e8:	478d                	li	a5,3
    800040ea:	00f71b63          	bne	a4,a5,80004100 <usertrap+0x1ba>
            p->CFStime=p->CFStime-1;
    800040ee:	fd043783          	ld	a5,-48(s0)
    800040f2:	47fc                	lw	a5,76(a5)
    800040f4:	37fd                	addiw	a5,a5,-1
    800040f6:	0007871b          	sext.w	a4,a5
    800040fa:	fd043783          	ld	a5,-48(s0)
    800040fe:	c7f8                	sw	a4,76(a5)
        }
        if(*flag==0 || *flag==2 || (*flag==1 && p->SJBtimeN1<=0) || (*flag==3 && p->CFStime==0)) {
    80004100:	fc043783          	ld	a5,-64(s0)
    80004104:	439c                	lw	a5,0(a5)
    80004106:	cf9d                	beqz	a5,80004144 <usertrap+0x1fe>
    80004108:	fc043783          	ld	a5,-64(s0)
    8000410c:	439c                	lw	a5,0(a5)
    8000410e:	873e                	mv	a4,a5
    80004110:	4789                	li	a5,2
    80004112:	02f70963          	beq	a4,a5,80004144 <usertrap+0x1fe>
    80004116:	fc043783          	ld	a5,-64(s0)
    8000411a:	439c                	lw	a5,0(a5)
    8000411c:	873e                	mv	a4,a5
    8000411e:	4785                	li	a5,1
    80004120:	00f71763          	bne	a4,a5,8000412e <usertrap+0x1e8>
    80004124:	fd043783          	ld	a5,-48(s0)
    80004128:	4bfc                	lw	a5,84(a5)
    8000412a:	00f05d63          	blez	a5,80004144 <usertrap+0x1fe>
    8000412e:	fc043783          	ld	a5,-64(s0)
    80004132:	439c                	lw	a5,0(a5)
    80004134:	873e                	mv	a4,a5
    80004136:	478d                	li	a5,3
    80004138:	00f71a63          	bne	a4,a5,8000414c <usertrap+0x206>
    8000413c:	fd043783          	ld	a5,-48(s0)
    80004140:	47fc                	lw	a5,76(a5)
    80004142:	e789                	bnez	a5,8000414c <usertrap+0x206>
            yield();
    80004144:	fffff097          	auipc	ra,0xfffff
    80004148:	75e080e7          	jalr	1886(ra) # 800038a2 <yield>
        }
    }
    usertrapret();
    8000414c:	00000097          	auipc	ra,0x0
    80004150:	014080e7          	jalr	20(ra) # 80004160 <usertrapret>
}
    80004154:	0001                	nop
    80004156:	70e2                	ld	ra,56(sp)
    80004158:	7442                	ld	s0,48(sp)
    8000415a:	74a2                	ld	s1,40(sp)
    8000415c:	6121                	addi	sp,sp,64
    8000415e:	8082                	ret

0000000080004160 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80004160:	7139                	addi	sp,sp,-64
    80004162:	fc06                	sd	ra,56(sp)
    80004164:	f822                	sd	s0,48(sp)
    80004166:	f426                	sd	s1,40(sp)
    80004168:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    8000416a:	ffffe097          	auipc	ra,0xffffe
    8000416e:	6aa080e7          	jalr	1706(ra) # 80002814 <myproc>
    80004172:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80004176:	00000097          	auipc	ra,0x0
    8000417a:	d14080e7          	jalr	-748(ra) # 80003e8a <intr_off>

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    8000417e:	00006717          	auipc	a4,0x6
    80004182:	e8270713          	addi	a4,a4,-382 # 8000a000 <_trampoline>
    80004186:	00006797          	auipc	a5,0x6
    8000418a:	e7a78793          	addi	a5,a5,-390 # 8000a000 <_trampoline>
    8000418e:	8f1d                	sub	a4,a4,a5
    80004190:	040007b7          	lui	a5,0x4000
    80004194:	17fd                	addi	a5,a5,-1
    80004196:	07b2                	slli	a5,a5,0xc
    80004198:	97ba                	add	a5,a5,a4
    8000419a:	853e                	mv	a0,a5
    8000419c:	00000097          	auipc	ra,0x0
    800041a0:	c5c080e7          	jalr	-932(ra) # 80003df8 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    800041a4:	fd843783          	ld	a5,-40(s0)
    800041a8:	7fa4                	ld	s1,120(a5)
    800041aa:	00000097          	auipc	ra,0x0
    800041ae:	c68080e7          	jalr	-920(ra) # 80003e12 <r_satp>
    800041b2:	87aa                	mv	a5,a0
    800041b4:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    800041b6:	fd843783          	ld	a5,-40(s0)
    800041ba:	73b4                	ld	a3,96(a5)
    800041bc:	fd843783          	ld	a5,-40(s0)
    800041c0:	7fbc                	ld	a5,120(a5)
    800041c2:	6705                	lui	a4,0x1
    800041c4:	9736                	add	a4,a4,a3
    800041c6:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    800041c8:	fd843783          	ld	a5,-40(s0)
    800041cc:	7fbc                	ld	a5,120(a5)
    800041ce:	00000717          	auipc	a4,0x0
    800041d2:	d7870713          	addi	a4,a4,-648 # 80003f46 <usertrap>
    800041d6:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    800041d8:	fd843783          	ld	a5,-40(s0)
    800041dc:	7fa4                	ld	s1,120(a5)
    800041de:	00000097          	auipc	ra,0x0
    800041e2:	d02080e7          	jalr	-766(ra) # 80003ee0 <r_tp>
    800041e6:	87aa                	mv	a5,a0
    800041e8:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    800041ea:	00000097          	auipc	ra,0x0
    800041ee:	b72080e7          	jalr	-1166(ra) # 80003d5c <r_sstatus>
    800041f2:	fca43823          	sd	a0,-48(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    800041f6:	fd043783          	ld	a5,-48(s0)
    800041fa:	eff7f793          	andi	a5,a5,-257
    800041fe:	fcf43823          	sd	a5,-48(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80004202:	fd043783          	ld	a5,-48(s0)
    80004206:	0207e793          	ori	a5,a5,32
    8000420a:	fcf43823          	sd	a5,-48(s0)
  w_sstatus(x);
    8000420e:	fd043503          	ld	a0,-48(s0)
    80004212:	00000097          	auipc	ra,0x0
    80004216:	b64080e7          	jalr	-1180(ra) # 80003d76 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    8000421a:	fd843783          	ld	a5,-40(s0)
    8000421e:	7fbc                	ld	a5,120(a5)
    80004220:	6f9c                	ld	a5,24(a5)
    80004222:	853e                	mv	a0,a5
    80004224:	00000097          	auipc	ra,0x0
    80004228:	ba0080e7          	jalr	-1120(ra) # 80003dc4 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    8000422c:	fd843783          	ld	a5,-40(s0)
    80004230:	7bbc                	ld	a5,112(a5)
    80004232:	00c7d713          	srli	a4,a5,0xc
    80004236:	57fd                	li	a5,-1
    80004238:	17fe                	slli	a5,a5,0x3f
    8000423a:	8fd9                	or	a5,a5,a4
    8000423c:	fcf43423          	sd	a5,-56(s0)

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80004240:	00006717          	auipc	a4,0x6
    80004244:	e5070713          	addi	a4,a4,-432 # 8000a090 <userret>
    80004248:	00006797          	auipc	a5,0x6
    8000424c:	db878793          	addi	a5,a5,-584 # 8000a000 <_trampoline>
    80004250:	8f1d                	sub	a4,a4,a5
    80004252:	040007b7          	lui	a5,0x4000
    80004256:	17fd                	addi	a5,a5,-1
    80004258:	07b2                	slli	a5,a5,0xc
    8000425a:	97ba                	add	a5,a5,a4
    8000425c:	fcf43023          	sd	a5,-64(s0)
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80004260:	fc043703          	ld	a4,-64(s0)
    80004264:	fc843583          	ld	a1,-56(s0)
    80004268:	020007b7          	lui	a5,0x2000
    8000426c:	17fd                	addi	a5,a5,-1
    8000426e:	00d79513          	slli	a0,a5,0xd
    80004272:	9702                	jalr	a4
}
    80004274:	0001                	nop
    80004276:	70e2                	ld	ra,56(sp)
    80004278:	7442                	ld	s0,48(sp)
    8000427a:	74a2                	ld	s1,40(sp)
    8000427c:	6121                	addi	sp,sp,64
    8000427e:	8082                	ret

0000000080004280 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void
kerneltrap()
{
    80004280:	711d                	addi	sp,sp,-96
    80004282:	ec86                	sd	ra,88(sp)
    80004284:	e8a2                	sd	s0,80(sp)
    80004286:	e4a6                	sd	s1,72(sp)
    80004288:	1080                	addi	s0,sp,96
    int which_dev = 0;
    8000428a:	fc042e23          	sw	zero,-36(s0)
    uint64 sepc = r_sepc();
    8000428e:	00000097          	auipc	ra,0x0
    80004292:	b50080e7          	jalr	-1200(ra) # 80003dde <r_sepc>
    80004296:	fca43823          	sd	a0,-48(s0)
    uint64 sstatus = r_sstatus();
    8000429a:	00000097          	auipc	ra,0x0
    8000429e:	ac2080e7          	jalr	-1342(ra) # 80003d5c <r_sstatus>
    800042a2:	fca43423          	sd	a0,-56(s0)
    uint64 scause = r_scause();
    800042a6:	00000097          	auipc	ra,0x0
    800042aa:	b86080e7          	jalr	-1146(ra) # 80003e2c <r_scause>
    800042ae:	fca43023          	sd	a0,-64(s0)

    if((sstatus & SSTATUS_SPP) == 0)
    800042b2:	fc843783          	ld	a5,-56(s0)
    800042b6:	1007f793          	andi	a5,a5,256
    800042ba:	eb89                	bnez	a5,800042cc <kerneltrap+0x4c>
        panic("kerneltrap: not from supervisor mode");
    800042bc:	00007517          	auipc	a0,0x7
    800042c0:	07450513          	addi	a0,a0,116 # 8000b330 <etext+0x330>
    800042c4:	ffffd097          	auipc	ra,0xffffd
    800042c8:	9ba080e7          	jalr	-1606(ra) # 80000c7e <panic>
    if(intr_get() != 0)
    800042cc:	00000097          	auipc	ra,0x0
    800042d0:	be6080e7          	jalr	-1050(ra) # 80003eb2 <intr_get>
    800042d4:	87aa                	mv	a5,a0
    800042d6:	cb89                	beqz	a5,800042e8 <kerneltrap+0x68>
        panic("kerneltrap: interrupts enabled");
    800042d8:	00007517          	auipc	a0,0x7
    800042dc:	08050513          	addi	a0,a0,128 # 8000b358 <etext+0x358>
    800042e0:	ffffd097          	auipc	ra,0xffffd
    800042e4:	99e080e7          	jalr	-1634(ra) # 80000c7e <panic>

    if((which_dev = devintr()) == 0){
    800042e8:	00000097          	auipc	ra,0x0
    800042ec:	1f4080e7          	jalr	500(ra) # 800044dc <devintr>
    800042f0:	87aa                	mv	a5,a0
    800042f2:	fcf42e23          	sw	a5,-36(s0)
    800042f6:	fdc42783          	lw	a5,-36(s0)
    800042fa:	2781                	sext.w	a5,a5
    800042fc:	e7b9                	bnez	a5,8000434a <kerneltrap+0xca>
        printf("scause %p\n", scause);
    800042fe:	fc043583          	ld	a1,-64(s0)
    80004302:	00007517          	auipc	a0,0x7
    80004306:	07650513          	addi	a0,a0,118 # 8000b378 <etext+0x378>
    8000430a:	ffffc097          	auipc	ra,0xffffc
    8000430e:	71e080e7          	jalr	1822(ra) # 80000a28 <printf>
        printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80004312:	00000097          	auipc	ra,0x0
    80004316:	acc080e7          	jalr	-1332(ra) # 80003dde <r_sepc>
    8000431a:	84aa                	mv	s1,a0
    8000431c:	00000097          	auipc	ra,0x0
    80004320:	b2a080e7          	jalr	-1238(ra) # 80003e46 <r_stval>
    80004324:	87aa                	mv	a5,a0
    80004326:	863e                	mv	a2,a5
    80004328:	85a6                	mv	a1,s1
    8000432a:	00007517          	auipc	a0,0x7
    8000432e:	05e50513          	addi	a0,a0,94 # 8000b388 <etext+0x388>
    80004332:	ffffc097          	auipc	ra,0xffffc
    80004336:	6f6080e7          	jalr	1782(ra) # 80000a28 <printf>
        panic("kerneltrap");
    8000433a:	00007517          	auipc	a0,0x7
    8000433e:	06650513          	addi	a0,a0,102 # 8000b3a0 <etext+0x3a0>
    80004342:	ffffd097          	auipc	ra,0xffffd
    80004346:	93c080e7          	jalr	-1732(ra) # 80000c7e <panic>
    }

    // give up the CPU if this is a timer interrupt.
    if(which_dev==2) {
    8000434a:	fdc42783          	lw	a5,-36(s0)
    8000434e:	0007871b          	sext.w	a4,a5
    80004352:	4789                	li	a5,2
    80004354:	10f71463          	bne	a4,a5,8000445c <kerneltrap+0x1dc>
        int* TIME=get_TIME();
    80004358:	fffff097          	auipc	ra,0xfffff
    8000435c:	51e080e7          	jalr	1310(ra) # 80003876 <get_TIME>
    80004360:	faa43c23          	sd	a0,-72(s0)
        int* flag=get_flag();
    80004364:	fffff097          	auipc	ra,0xfffff
    80004368:	528080e7          	jalr	1320(ra) # 8000388c <get_flag>
    8000436c:	faa43823          	sd	a0,-80(s0)
        *TIME+=1;
    80004370:	fb843783          	ld	a5,-72(s0)
    80004374:	439c                	lw	a5,0(a5)
    80004376:	2785                	addiw	a5,a5,1
    80004378:	0007871b          	sext.w	a4,a5
    8000437c:	fb843783          	ld	a5,-72(s0)
    80004380:	c398                	sw	a4,0(a5)
        if (myproc() != 0 && myproc()->state == RUNNING){
    80004382:	ffffe097          	auipc	ra,0xffffe
    80004386:	492080e7          	jalr	1170(ra) # 80002814 <myproc>
    8000438a:	87aa                	mv	a5,a0
    8000438c:	cbe1                	beqz	a5,8000445c <kerneltrap+0x1dc>
    8000438e:	ffffe097          	auipc	ra,0xffffe
    80004392:	486080e7          	jalr	1158(ra) # 80002814 <myproc>
    80004396:	87aa                	mv	a5,a0
    80004398:	4f9c                	lw	a5,24(a5)
    8000439a:	873e                	mv	a4,a5
    8000439c:	4791                	li	a5,4
    8000439e:	0af71f63          	bne	a4,a5,8000445c <kerneltrap+0x1dc>
            struct proc *p=myproc();
    800043a2:	ffffe097          	auipc	ra,0xffffe
    800043a6:	472080e7          	jalr	1138(ra) # 80002814 <myproc>
    800043aa:	faa43423          	sd	a0,-88(s0)
            p->CPUtime+=1;
    800043ae:	fa843783          	ld	a5,-88(s0)
    800043b2:	47bc                	lw	a5,72(a5)
    800043b4:	2785                	addiw	a5,a5,1
    800043b6:	0007871b          	sext.w	a4,a5
    800043ba:	fa843783          	ld	a5,-88(s0)
    800043be:	c7b8                	sw	a4,72(a5)
            if(*flag==2 || *flag==1){
    800043c0:	fb043783          	ld	a5,-80(s0)
    800043c4:	439c                	lw	a5,0(a5)
    800043c6:	873e                	mv	a4,a5
    800043c8:	4789                	li	a5,2
    800043ca:	00f70963          	beq	a4,a5,800043dc <kerneltrap+0x15c>
    800043ce:	fb043783          	ld	a5,-80(s0)
    800043d2:	439c                	lw	a5,0(a5)
    800043d4:	873e                	mv	a4,a5
    800043d6:	4785                	li	a5,1
    800043d8:	00f71c63          	bne	a4,a5,800043f0 <kerneltrap+0x170>
                p->SJBtimeN1=p->SJBtimeN1-1;
    800043dc:	fa843783          	ld	a5,-88(s0)
    800043e0:	4bfc                	lw	a5,84(a5)
    800043e2:	37fd                	addiw	a5,a5,-1
    800043e4:	0007871b          	sext.w	a4,a5
    800043e8:	fa843783          	ld	a5,-88(s0)
    800043ec:	cbf8                	sw	a4,84(a5)
    800043ee:	a00d                	j	80004410 <kerneltrap+0x190>
            }else if(*flag==3){
    800043f0:	fb043783          	ld	a5,-80(s0)
    800043f4:	439c                	lw	a5,0(a5)
    800043f6:	873e                	mv	a4,a5
    800043f8:	478d                	li	a5,3
    800043fa:	00f71b63          	bne	a4,a5,80004410 <kerneltrap+0x190>
                p->CFStime=p->CFStime-1;
    800043fe:	fa843783          	ld	a5,-88(s0)
    80004402:	47fc                	lw	a5,76(a5)
    80004404:	37fd                	addiw	a5,a5,-1
    80004406:	0007871b          	sext.w	a4,a5
    8000440a:	fa843783          	ld	a5,-88(s0)
    8000440e:	c7f8                	sw	a4,76(a5)
            }
            if(*flag==0 || *flag==2 || (*flag==1 && p->SJBtimeN1<=0) || (*flag==3 && p->CFStime==0)) {
    80004410:	fb043783          	ld	a5,-80(s0)
    80004414:	439c                	lw	a5,0(a5)
    80004416:	cf9d                	beqz	a5,80004454 <kerneltrap+0x1d4>
    80004418:	fb043783          	ld	a5,-80(s0)
    8000441c:	439c                	lw	a5,0(a5)
    8000441e:	873e                	mv	a4,a5
    80004420:	4789                	li	a5,2
    80004422:	02f70963          	beq	a4,a5,80004454 <kerneltrap+0x1d4>
    80004426:	fb043783          	ld	a5,-80(s0)
    8000442a:	439c                	lw	a5,0(a5)
    8000442c:	873e                	mv	a4,a5
    8000442e:	4785                	li	a5,1
    80004430:	00f71763          	bne	a4,a5,8000443e <kerneltrap+0x1be>
    80004434:	fa843783          	ld	a5,-88(s0)
    80004438:	4bfc                	lw	a5,84(a5)
    8000443a:	00f05d63          	blez	a5,80004454 <kerneltrap+0x1d4>
    8000443e:	fb043783          	ld	a5,-80(s0)
    80004442:	439c                	lw	a5,0(a5)
    80004444:	873e                	mv	a4,a5
    80004446:	478d                	li	a5,3
    80004448:	00f71a63          	bne	a4,a5,8000445c <kerneltrap+0x1dc>
    8000444c:	fa843783          	ld	a5,-88(s0)
    80004450:	47fc                	lw	a5,76(a5)
    80004452:	e789                	bnez	a5,8000445c <kerneltrap+0x1dc>
                yield();
    80004454:	fffff097          	auipc	ra,0xfffff
    80004458:	44e080e7          	jalr	1102(ra) # 800038a2 <yield>
            }
        }
    }
    // the yield() may have caused some traps to occur,
    // so restore trap registers for use by kernelvec.S's sepc instruction.
    w_sepc(sepc);
    8000445c:	fd043503          	ld	a0,-48(s0)
    80004460:	00000097          	auipc	ra,0x0
    80004464:	964080e7          	jalr	-1692(ra) # 80003dc4 <w_sepc>
    w_sstatus(sstatus);
    80004468:	fc843503          	ld	a0,-56(s0)
    8000446c:	00000097          	auipc	ra,0x0
    80004470:	90a080e7          	jalr	-1782(ra) # 80003d76 <w_sstatus>
}
    80004474:	0001                	nop
    80004476:	60e6                	ld	ra,88(sp)
    80004478:	6446                	ld	s0,80(sp)
    8000447a:	64a6                	ld	s1,72(sp)
    8000447c:	6125                	addi	sp,sp,96
    8000447e:	8082                	ret

0000000080004480 <clockintr>:

void
clockintr()
{
    80004480:	1141                	addi	sp,sp,-16
    80004482:	e406                	sd	ra,8(sp)
    80004484:	e022                	sd	s0,0(sp)
    80004486:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80004488:	00016517          	auipc	a0,0x16
    8000448c:	46050513          	addi	a0,a0,1120 # 8001a8e8 <tickslock>
    80004490:	ffffd097          	auipc	ra,0xffffd
    80004494:	dde080e7          	jalr	-546(ra) # 8000126e <acquire>
  ticks++;
    80004498:	00008797          	auipc	a5,0x8
    8000449c:	bb478793          	addi	a5,a5,-1100 # 8000c04c <ticks>
    800044a0:	439c                	lw	a5,0(a5)
    800044a2:	2785                	addiw	a5,a5,1
    800044a4:	0007871b          	sext.w	a4,a5
    800044a8:	00008797          	auipc	a5,0x8
    800044ac:	ba478793          	addi	a5,a5,-1116 # 8000c04c <ticks>
    800044b0:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    800044b2:	00008517          	auipc	a0,0x8
    800044b6:	b9a50513          	addi	a0,a0,-1126 # 8000c04c <ticks>
    800044ba:	fffff097          	auipc	ra,0xfffff
    800044be:	502080e7          	jalr	1282(ra) # 800039bc <wakeup>
  release(&tickslock);
    800044c2:	00016517          	auipc	a0,0x16
    800044c6:	42650513          	addi	a0,a0,1062 # 8001a8e8 <tickslock>
    800044ca:	ffffd097          	auipc	ra,0xffffd
    800044ce:	e08080e7          	jalr	-504(ra) # 800012d2 <release>
}
    800044d2:	0001                	nop
    800044d4:	60a2                	ld	ra,8(sp)
    800044d6:	6402                	ld	s0,0(sp)
    800044d8:	0141                	addi	sp,sp,16
    800044da:	8082                	ret

00000000800044dc <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    800044dc:	1101                	addi	sp,sp,-32
    800044de:	ec06                	sd	ra,24(sp)
    800044e0:	e822                	sd	s0,16(sp)
    800044e2:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    800044e4:	00000097          	auipc	ra,0x0
    800044e8:	948080e7          	jalr	-1720(ra) # 80003e2c <r_scause>
    800044ec:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    800044f0:	fe843783          	ld	a5,-24(s0)
    800044f4:	0807d463          	bgez	a5,8000457c <devintr+0xa0>
     (scause & 0xff) == 9){
    800044f8:	fe843783          	ld	a5,-24(s0)
    800044fc:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    80004500:	47a5                	li	a5,9
    80004502:	06f71d63          	bne	a4,a5,8000457c <devintr+0xa0>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80004506:	00005097          	auipc	ra,0x5
    8000450a:	a9c080e7          	jalr	-1380(ra) # 80008fa2 <plic_claim>
    8000450e:	87aa                	mv	a5,a0
    80004510:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80004514:	fe442783          	lw	a5,-28(s0)
    80004518:	0007871b          	sext.w	a4,a5
    8000451c:	47a9                	li	a5,10
    8000451e:	00f71763          	bne	a4,a5,8000452c <devintr+0x50>
      uartintr();
    80004522:	ffffd097          	auipc	ra,0xffffd
    80004526:	a54080e7          	jalr	-1452(ra) # 80000f76 <uartintr>
    8000452a:	a825                	j	80004562 <devintr+0x86>
    } else if(irq == VIRTIO0_IRQ){
    8000452c:	fe442783          	lw	a5,-28(s0)
    80004530:	0007871b          	sext.w	a4,a5
    80004534:	4785                	li	a5,1
    80004536:	00f71763          	bne	a4,a5,80004544 <devintr+0x68>
      virtio_disk_intr();
    8000453a:	00005097          	auipc	ra,0x5
    8000453e:	37c080e7          	jalr	892(ra) # 800098b6 <virtio_disk_intr>
    80004542:	a005                	j	80004562 <devintr+0x86>
    } else if(irq){
    80004544:	fe442783          	lw	a5,-28(s0)
    80004548:	2781                	sext.w	a5,a5
    8000454a:	cf81                	beqz	a5,80004562 <devintr+0x86>
      printf("unexpected interrupt irq=%d\n", irq);
    8000454c:	fe442783          	lw	a5,-28(s0)
    80004550:	85be                	mv	a1,a5
    80004552:	00007517          	auipc	a0,0x7
    80004556:	e5e50513          	addi	a0,a0,-418 # 8000b3b0 <etext+0x3b0>
    8000455a:	ffffc097          	auipc	ra,0xffffc
    8000455e:	4ce080e7          	jalr	1230(ra) # 80000a28 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    80004562:	fe442783          	lw	a5,-28(s0)
    80004566:	2781                	sext.w	a5,a5
    80004568:	cb81                	beqz	a5,80004578 <devintr+0x9c>
      plic_complete(irq);
    8000456a:	fe442783          	lw	a5,-28(s0)
    8000456e:	853e                	mv	a0,a5
    80004570:	00005097          	auipc	ra,0x5
    80004574:	a70080e7          	jalr	-1424(ra) # 80008fe0 <plic_complete>

    return 1;
    80004578:	4785                	li	a5,1
    8000457a:	a081                	j	800045ba <devintr+0xde>
  } else if(scause == 0x8000000000000001L){
    8000457c:	fe843703          	ld	a4,-24(s0)
    80004580:	57fd                	li	a5,-1
    80004582:	17fe                	slli	a5,a5,0x3f
    80004584:	0785                	addi	a5,a5,1
    80004586:	02f71963          	bne	a4,a5,800045b8 <devintr+0xdc>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    8000458a:	ffffe097          	auipc	ra,0xffffe
    8000458e:	22c080e7          	jalr	556(ra) # 800027b6 <cpuid>
    80004592:	87aa                	mv	a5,a0
    80004594:	e789                	bnez	a5,8000459e <devintr+0xc2>
      clockintr();
    80004596:	00000097          	auipc	ra,0x0
    8000459a:	eea080e7          	jalr	-278(ra) # 80004480 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    8000459e:	fffff097          	auipc	ra,0xfffff
    800045a2:	7f2080e7          	jalr	2034(ra) # 80003d90 <r_sip>
    800045a6:	87aa                	mv	a5,a0
    800045a8:	9bf5                	andi	a5,a5,-3
    800045aa:	853e                	mv	a0,a5
    800045ac:	fffff097          	auipc	ra,0xfffff
    800045b0:	7fe080e7          	jalr	2046(ra) # 80003daa <w_sip>

    return 2;
    800045b4:	4789                	li	a5,2
    800045b6:	a011                	j	800045ba <devintr+0xde>
  } else {
    return 0;
    800045b8:	4781                	li	a5,0
  }
}
    800045ba:	853e                	mv	a0,a5
    800045bc:	60e2                	ld	ra,24(sp)
    800045be:	6442                	ld	s0,16(sp)
    800045c0:	6105                	addi	sp,sp,32
    800045c2:	8082                	ret

00000000800045c4 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    800045c4:	7179                	addi	sp,sp,-48
    800045c6:	f406                	sd	ra,40(sp)
    800045c8:	f022                	sd	s0,32(sp)
    800045ca:	1800                	addi	s0,sp,48
    800045cc:	fca43c23          	sd	a0,-40(s0)
    800045d0:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800045d4:	ffffe097          	auipc	ra,0xffffe
    800045d8:	240080e7          	jalr	576(ra) # 80002814 <myproc>
    800045dc:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    800045e0:	fe843783          	ld	a5,-24(s0)
    800045e4:	77bc                	ld	a5,104(a5)
    800045e6:	fd843703          	ld	a4,-40(s0)
    800045ea:	00f77b63          	bgeu	a4,a5,80004600 <fetchaddr+0x3c>
    800045ee:	fd843783          	ld	a5,-40(s0)
    800045f2:	00878713          	addi	a4,a5,8
    800045f6:	fe843783          	ld	a5,-24(s0)
    800045fa:	77bc                	ld	a5,104(a5)
    800045fc:	00e7f463          	bgeu	a5,a4,80004604 <fetchaddr+0x40>
    return -1;
    80004600:	57fd                	li	a5,-1
    80004602:	a01d                	j	80004628 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80004604:	fe843783          	ld	a5,-24(s0)
    80004608:	7bbc                	ld	a5,112(a5)
    8000460a:	46a1                	li	a3,8
    8000460c:	fd843603          	ld	a2,-40(s0)
    80004610:	fd043583          	ld	a1,-48(s0)
    80004614:	853e                	mv	a0,a5
    80004616:	ffffe097          	auipc	ra,0xffffe
    8000461a:	d9e080e7          	jalr	-610(ra) # 800023b4 <copyin>
    8000461e:	87aa                	mv	a5,a0
    80004620:	c399                	beqz	a5,80004626 <fetchaddr+0x62>
    return -1;
    80004622:	57fd                	li	a5,-1
    80004624:	a011                	j	80004628 <fetchaddr+0x64>
  return 0;
    80004626:	4781                	li	a5,0
}
    80004628:	853e                	mv	a0,a5
    8000462a:	70a2                	ld	ra,40(sp)
    8000462c:	7402                	ld	s0,32(sp)
    8000462e:	6145                	addi	sp,sp,48
    80004630:	8082                	ret

0000000080004632 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80004632:	7139                	addi	sp,sp,-64
    80004634:	fc06                	sd	ra,56(sp)
    80004636:	f822                	sd	s0,48(sp)
    80004638:	0080                	addi	s0,sp,64
    8000463a:	fca43c23          	sd	a0,-40(s0)
    8000463e:	fcb43823          	sd	a1,-48(s0)
    80004642:	87b2                	mv	a5,a2
    80004644:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004648:	ffffe097          	auipc	ra,0xffffe
    8000464c:	1cc080e7          	jalr	460(ra) # 80002814 <myproc>
    80004650:	fea43423          	sd	a0,-24(s0)
  int err = copyinstr(p->pagetable, buf, addr, max);
    80004654:	fe843783          	ld	a5,-24(s0)
    80004658:	7bbc                	ld	a5,112(a5)
    8000465a:	fcc42703          	lw	a4,-52(s0)
    8000465e:	86ba                	mv	a3,a4
    80004660:	fd843603          	ld	a2,-40(s0)
    80004664:	fd043583          	ld	a1,-48(s0)
    80004668:	853e                	mv	a0,a5
    8000466a:	ffffe097          	auipc	ra,0xffffe
    8000466e:	e18080e7          	jalr	-488(ra) # 80002482 <copyinstr>
    80004672:	87aa                	mv	a5,a0
    80004674:	fef42223          	sw	a5,-28(s0)
  if(err < 0)
    80004678:	fe442783          	lw	a5,-28(s0)
    8000467c:	2781                	sext.w	a5,a5
    8000467e:	0007d563          	bgez	a5,80004688 <fetchstr+0x56>
    return err;
    80004682:	fe442783          	lw	a5,-28(s0)
    80004686:	a801                	j	80004696 <fetchstr+0x64>
  return strlen(buf);
    80004688:	fd043503          	ld	a0,-48(s0)
    8000468c:	ffffd097          	auipc	ra,0xffffd
    80004690:	134080e7          	jalr	308(ra) # 800017c0 <strlen>
    80004694:	87aa                	mv	a5,a0
}
    80004696:	853e                	mv	a0,a5
    80004698:	70e2                	ld	ra,56(sp)
    8000469a:	7442                	ld	s0,48(sp)
    8000469c:	6121                	addi	sp,sp,64
    8000469e:	8082                	ret

00000000800046a0 <argraw>:

static uint64
argraw(int n)
{
    800046a0:	7179                	addi	sp,sp,-48
    800046a2:	f406                	sd	ra,40(sp)
    800046a4:	f022                	sd	s0,32(sp)
    800046a6:	1800                	addi	s0,sp,48
    800046a8:	87aa                	mv	a5,a0
    800046aa:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800046ae:	ffffe097          	auipc	ra,0xffffe
    800046b2:	166080e7          	jalr	358(ra) # 80002814 <myproc>
    800046b6:	fea43423          	sd	a0,-24(s0)
    800046ba:	fdc42783          	lw	a5,-36(s0)
    800046be:	0007871b          	sext.w	a4,a5
    800046c2:	4795                	li	a5,5
    800046c4:	06e7e263          	bltu	a5,a4,80004728 <argraw+0x88>
    800046c8:	fdc46783          	lwu	a5,-36(s0)
    800046cc:	00279713          	slli	a4,a5,0x2
    800046d0:	00007797          	auipc	a5,0x7
    800046d4:	d0878793          	addi	a5,a5,-760 # 8000b3d8 <etext+0x3d8>
    800046d8:	97ba                	add	a5,a5,a4
    800046da:	439c                	lw	a5,0(a5)
    800046dc:	0007871b          	sext.w	a4,a5
    800046e0:	00007797          	auipc	a5,0x7
    800046e4:	cf878793          	addi	a5,a5,-776 # 8000b3d8 <etext+0x3d8>
    800046e8:	97ba                	add	a5,a5,a4
    800046ea:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    800046ec:	fe843783          	ld	a5,-24(s0)
    800046f0:	7fbc                	ld	a5,120(a5)
    800046f2:	7bbc                	ld	a5,112(a5)
    800046f4:	a091                	j	80004738 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    800046f6:	fe843783          	ld	a5,-24(s0)
    800046fa:	7fbc                	ld	a5,120(a5)
    800046fc:	7fbc                	ld	a5,120(a5)
    800046fe:	a82d                	j	80004738 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    80004700:	fe843783          	ld	a5,-24(s0)
    80004704:	7fbc                	ld	a5,120(a5)
    80004706:	63dc                	ld	a5,128(a5)
    80004708:	a805                	j	80004738 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    8000470a:	fe843783          	ld	a5,-24(s0)
    8000470e:	7fbc                	ld	a5,120(a5)
    80004710:	67dc                	ld	a5,136(a5)
    80004712:	a01d                	j	80004738 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004714:	fe843783          	ld	a5,-24(s0)
    80004718:	7fbc                	ld	a5,120(a5)
    8000471a:	6bdc                	ld	a5,144(a5)
    8000471c:	a831                	j	80004738 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000471e:	fe843783          	ld	a5,-24(s0)
    80004722:	7fbc                	ld	a5,120(a5)
    80004724:	6fdc                	ld	a5,152(a5)
    80004726:	a809                	j	80004738 <argraw+0x98>
  }
  panic("argraw");
    80004728:	00007517          	auipc	a0,0x7
    8000472c:	ca850513          	addi	a0,a0,-856 # 8000b3d0 <etext+0x3d0>
    80004730:	ffffc097          	auipc	ra,0xffffc
    80004734:	54e080e7          	jalr	1358(ra) # 80000c7e <panic>
  return -1;
}
    80004738:	853e                	mv	a0,a5
    8000473a:	70a2                	ld	ra,40(sp)
    8000473c:	7402                	ld	s0,32(sp)
    8000473e:	6145                	addi	sp,sp,48
    80004740:	8082                	ret

0000000080004742 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
    80004742:	1101                	addi	sp,sp,-32
    80004744:	ec06                	sd	ra,24(sp)
    80004746:	e822                	sd	s0,16(sp)
    80004748:	1000                	addi	s0,sp,32
    8000474a:	87aa                	mv	a5,a0
    8000474c:	feb43023          	sd	a1,-32(s0)
    80004750:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004754:	fec42783          	lw	a5,-20(s0)
    80004758:	853e                	mv	a0,a5
    8000475a:	00000097          	auipc	ra,0x0
    8000475e:	f46080e7          	jalr	-186(ra) # 800046a0 <argraw>
    80004762:	87aa                	mv	a5,a0
    80004764:	0007871b          	sext.w	a4,a5
    80004768:	fe043783          	ld	a5,-32(s0)
    8000476c:	c398                	sw	a4,0(a5)
  return 0;
    8000476e:	4781                	li	a5,0
}
    80004770:	853e                	mv	a0,a5
    80004772:	60e2                	ld	ra,24(sp)
    80004774:	6442                	ld	s0,16(sp)
    80004776:	6105                	addi	sp,sp,32
    80004778:	8082                	ret

000000008000477a <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
int
argaddr(int n, uint64 *ip)
{
    8000477a:	1101                	addi	sp,sp,-32
    8000477c:	ec06                	sd	ra,24(sp)
    8000477e:	e822                	sd	s0,16(sp)
    80004780:	1000                	addi	s0,sp,32
    80004782:	87aa                	mv	a5,a0
    80004784:	feb43023          	sd	a1,-32(s0)
    80004788:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    8000478c:	fec42783          	lw	a5,-20(s0)
    80004790:	853e                	mv	a0,a5
    80004792:	00000097          	auipc	ra,0x0
    80004796:	f0e080e7          	jalr	-242(ra) # 800046a0 <argraw>
    8000479a:	872a                	mv	a4,a0
    8000479c:	fe043783          	ld	a5,-32(s0)
    800047a0:	e398                	sd	a4,0(a5)
  return 0;
    800047a2:	4781                	li	a5,0
}
    800047a4:	853e                	mv	a0,a5
    800047a6:	60e2                	ld	ra,24(sp)
    800047a8:	6442                	ld	s0,16(sp)
    800047aa:	6105                	addi	sp,sp,32
    800047ac:	8082                	ret

00000000800047ae <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800047ae:	7179                	addi	sp,sp,-48
    800047b0:	f406                	sd	ra,40(sp)
    800047b2:	f022                	sd	s0,32(sp)
    800047b4:	1800                	addi	s0,sp,48
    800047b6:	87aa                	mv	a5,a0
    800047b8:	fcb43823          	sd	a1,-48(s0)
    800047bc:	8732                	mv	a4,a2
    800047be:	fcf42e23          	sw	a5,-36(s0)
    800047c2:	87ba                	mv	a5,a4
    800047c4:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  if(argaddr(n, &addr) < 0)
    800047c8:	fe840713          	addi	a4,s0,-24
    800047cc:	fdc42783          	lw	a5,-36(s0)
    800047d0:	85ba                	mv	a1,a4
    800047d2:	853e                	mv	a0,a5
    800047d4:	00000097          	auipc	ra,0x0
    800047d8:	fa6080e7          	jalr	-90(ra) # 8000477a <argaddr>
    800047dc:	87aa                	mv	a5,a0
    800047de:	0007d463          	bgez	a5,800047e6 <argstr+0x38>
    return -1;
    800047e2:	57fd                	li	a5,-1
    800047e4:	a831                	j	80004800 <argstr+0x52>
  return fetchstr(addr, buf, max);
    800047e6:	fe843783          	ld	a5,-24(s0)
    800047ea:	fd842703          	lw	a4,-40(s0)
    800047ee:	863a                	mv	a2,a4
    800047f0:	fd043583          	ld	a1,-48(s0)
    800047f4:	853e                	mv	a0,a5
    800047f6:	00000097          	auipc	ra,0x0
    800047fa:	e3c080e7          	jalr	-452(ra) # 80004632 <fetchstr>
    800047fe:	87aa                	mv	a5,a0
}
    80004800:	853e                	mv	a0,a5
    80004802:	70a2                	ld	ra,40(sp)
    80004804:	7402                	ld	s0,32(sp)
    80004806:	6145                	addi	sp,sp,48
    80004808:	8082                	ret

000000008000480a <syscall>:
[SYS_change]  sys_change,
};

void
syscall(void)
{
    8000480a:	7179                	addi	sp,sp,-48
    8000480c:	f406                	sd	ra,40(sp)
    8000480e:	f022                	sd	s0,32(sp)
    80004810:	ec26                	sd	s1,24(sp)
    80004812:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004814:	ffffe097          	auipc	ra,0xffffe
    80004818:	000080e7          	jalr	ra # 80002814 <myproc>
    8000481c:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    80004820:	fd843783          	ld	a5,-40(s0)
    80004824:	7fbc                	ld	a5,120(a5)
    80004826:	77dc                	ld	a5,168(a5)
    80004828:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8000482c:	fd442783          	lw	a5,-44(s0)
    80004830:	2781                	sext.w	a5,a5
    80004832:	04f05263          	blez	a5,80004876 <syscall+0x6c>
    80004836:	fd442783          	lw	a5,-44(s0)
    8000483a:	873e                	mv	a4,a5
    8000483c:	47d9                	li	a5,22
    8000483e:	02e7ec63          	bltu	a5,a4,80004876 <syscall+0x6c>
    80004842:	00007717          	auipc	a4,0x7
    80004846:	f7e70713          	addi	a4,a4,-130 # 8000b7c0 <syscalls>
    8000484a:	fd442783          	lw	a5,-44(s0)
    8000484e:	078e                	slli	a5,a5,0x3
    80004850:	97ba                	add	a5,a5,a4
    80004852:	639c                	ld	a5,0(a5)
    80004854:	c38d                	beqz	a5,80004876 <syscall+0x6c>
    p->trapframe->a0 = syscalls[num]();
    80004856:	00007717          	auipc	a4,0x7
    8000485a:	f6a70713          	addi	a4,a4,-150 # 8000b7c0 <syscalls>
    8000485e:	fd442783          	lw	a5,-44(s0)
    80004862:	078e                	slli	a5,a5,0x3
    80004864:	97ba                	add	a5,a5,a4
    80004866:	6398                	ld	a4,0(a5)
    80004868:	fd843783          	ld	a5,-40(s0)
    8000486c:	7fa4                	ld	s1,120(a5)
    8000486e:	9702                	jalr	a4
    80004870:	87aa                	mv	a5,a0
    80004872:	f8bc                	sd	a5,112(s1)
    80004874:	a815                	j	800048a8 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    80004876:	fd843783          	ld	a5,-40(s0)
    8000487a:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    8000487c:	fd843783          	ld	a5,-40(s0)
    80004880:	17878793          	addi	a5,a5,376
    printf("%d %s: unknown sys call %d\n",
    80004884:	fd442683          	lw	a3,-44(s0)
    80004888:	863e                	mv	a2,a5
    8000488a:	85ba                	mv	a1,a4
    8000488c:	00007517          	auipc	a0,0x7
    80004890:	b6450513          	addi	a0,a0,-1180 # 8000b3f0 <etext+0x3f0>
    80004894:	ffffc097          	auipc	ra,0xffffc
    80004898:	194080e7          	jalr	404(ra) # 80000a28 <printf>
    p->trapframe->a0 = -1;
    8000489c:	fd843783          	ld	a5,-40(s0)
    800048a0:	7fbc                	ld	a5,120(a5)
    800048a2:	577d                	li	a4,-1
    800048a4:	fbb8                	sd	a4,112(a5)
  }
}
    800048a6:	0001                	nop
    800048a8:	0001                	nop
    800048aa:	70a2                	ld	ra,40(sp)
    800048ac:	7402                	ld	s0,32(sp)
    800048ae:	64e2                	ld	s1,24(sp)
    800048b0:	6145                	addi	sp,sp,48
    800048b2:	8082                	ret

00000000800048b4 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    800048b4:	1101                	addi	sp,sp,-32
    800048b6:	ec06                	sd	ra,24(sp)
    800048b8:	e822                	sd	s0,16(sp)
    800048ba:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    800048bc:	fec40793          	addi	a5,s0,-20
    800048c0:	85be                	mv	a1,a5
    800048c2:	4501                	li	a0,0
    800048c4:	00000097          	auipc	ra,0x0
    800048c8:	e7e080e7          	jalr	-386(ra) # 80004742 <argint>
    800048cc:	87aa                	mv	a5,a0
    800048ce:	0007d463          	bgez	a5,800048d6 <sys_exit+0x22>
    return -1;
    800048d2:	57fd                	li	a5,-1
    800048d4:	a809                	j	800048e6 <sys_exit+0x32>
  exit(n);
    800048d6:	fec42783          	lw	a5,-20(s0)
    800048da:	853e                	mv	a0,a5
    800048dc:	ffffe097          	auipc	ra,0xffffe
    800048e0:	708080e7          	jalr	1800(ra) # 80002fe4 <exit>
  return 0;  // not reached
    800048e4:	4781                	li	a5,0
}
    800048e6:	853e                	mv	a0,a5
    800048e8:	60e2                	ld	ra,24(sp)
    800048ea:	6442                	ld	s0,16(sp)
    800048ec:	6105                	addi	sp,sp,32
    800048ee:	8082                	ret

00000000800048f0 <sys_getpid>:

uint64
sys_getpid(void)
{
    800048f0:	1141                	addi	sp,sp,-16
    800048f2:	e406                	sd	ra,8(sp)
    800048f4:	e022                	sd	s0,0(sp)
    800048f6:	0800                	addi	s0,sp,16
  return myproc()->pid;
    800048f8:	ffffe097          	auipc	ra,0xffffe
    800048fc:	f1c080e7          	jalr	-228(ra) # 80002814 <myproc>
    80004900:	87aa                	mv	a5,a0
    80004902:	5b9c                	lw	a5,48(a5)
}
    80004904:	853e                	mv	a0,a5
    80004906:	60a2                	ld	ra,8(sp)
    80004908:	6402                	ld	s0,0(sp)
    8000490a:	0141                	addi	sp,sp,16
    8000490c:	8082                	ret

000000008000490e <sys_fork>:

uint64
sys_fork(void)
{
    8000490e:	1141                	addi	sp,sp,-16
    80004910:	e406                	sd	ra,8(sp)
    80004912:	e022                	sd	s0,0(sp)
    80004914:	0800                	addi	s0,sp,16
  return fork();
    80004916:	ffffe097          	auipc	ra,0xffffe
    8000491a:	48e080e7          	jalr	1166(ra) # 80002da4 <fork>
    8000491e:	87aa                	mv	a5,a0
}
    80004920:	853e                	mv	a0,a5
    80004922:	60a2                	ld	ra,8(sp)
    80004924:	6402                	ld	s0,0(sp)
    80004926:	0141                	addi	sp,sp,16
    80004928:	8082                	ret

000000008000492a <sys_wait>:

uint64
sys_wait(void)
{
    8000492a:	1101                	addi	sp,sp,-32
    8000492c:	ec06                	sd	ra,24(sp)
    8000492e:	e822                	sd	s0,16(sp)
    80004930:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    80004932:	fe840793          	addi	a5,s0,-24
    80004936:	85be                	mv	a1,a5
    80004938:	4501                	li	a0,0
    8000493a:	00000097          	auipc	ra,0x0
    8000493e:	e40080e7          	jalr	-448(ra) # 8000477a <argaddr>
    80004942:	87aa                	mv	a5,a0
    80004944:	0007d463          	bgez	a5,8000494c <sys_wait+0x22>
    return -1;
    80004948:	57fd                	li	a5,-1
    8000494a:	a809                	j	8000495c <sys_wait+0x32>
  return wait(p);
    8000494c:	fe843783          	ld	a5,-24(s0)
    80004950:	853e                	mv	a0,a5
    80004952:	ffffe097          	auipc	ra,0xffffe
    80004956:	7e8080e7          	jalr	2024(ra) # 8000313a <wait>
    8000495a:	87aa                	mv	a5,a0
}
    8000495c:	853e                	mv	a0,a5
    8000495e:	60e2                	ld	ra,24(sp)
    80004960:	6442                	ld	s0,16(sp)
    80004962:	6105                	addi	sp,sp,32
    80004964:	8082                	ret

0000000080004966 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80004966:	1101                	addi	sp,sp,-32
    80004968:	ec06                	sd	ra,24(sp)
    8000496a:	e822                	sd	s0,16(sp)
    8000496c:	1000                	addi	s0,sp,32
  int addr;
  int n;

  if(argint(0, &n) < 0)
    8000496e:	fe840793          	addi	a5,s0,-24
    80004972:	85be                	mv	a1,a5
    80004974:	4501                	li	a0,0
    80004976:	00000097          	auipc	ra,0x0
    8000497a:	dcc080e7          	jalr	-564(ra) # 80004742 <argint>
    8000497e:	87aa                	mv	a5,a0
    80004980:	0007d463          	bgez	a5,80004988 <sys_sbrk+0x22>
    return -1;
    80004984:	57fd                	li	a5,-1
    80004986:	a03d                	j	800049b4 <sys_sbrk+0x4e>
  addr = myproc()->sz;
    80004988:	ffffe097          	auipc	ra,0xffffe
    8000498c:	e8c080e7          	jalr	-372(ra) # 80002814 <myproc>
    80004990:	87aa                	mv	a5,a0
    80004992:	77bc                	ld	a5,104(a5)
    80004994:	fef42623          	sw	a5,-20(s0)
  if(growproc(n) < 0)
    80004998:	fe842783          	lw	a5,-24(s0)
    8000499c:	853e                	mv	a0,a5
    8000499e:	ffffe097          	auipc	ra,0xffffe
    800049a2:	2da080e7          	jalr	730(ra) # 80002c78 <growproc>
    800049a6:	87aa                	mv	a5,a0
    800049a8:	0007d463          	bgez	a5,800049b0 <sys_sbrk+0x4a>
    return -1;
    800049ac:	57fd                	li	a5,-1
    800049ae:	a019                	j	800049b4 <sys_sbrk+0x4e>
  return addr;
    800049b0:	fec42783          	lw	a5,-20(s0)
}
    800049b4:	853e                	mv	a0,a5
    800049b6:	60e2                	ld	ra,24(sp)
    800049b8:	6442                	ld	s0,16(sp)
    800049ba:	6105                	addi	sp,sp,32
    800049bc:	8082                	ret

00000000800049be <sys_sleep>:

uint64
sys_sleep(void)
{
    800049be:	1101                	addi	sp,sp,-32
    800049c0:	ec06                	sd	ra,24(sp)
    800049c2:	e822                	sd	s0,16(sp)
    800049c4:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    800049c6:	fe840793          	addi	a5,s0,-24
    800049ca:	85be                	mv	a1,a5
    800049cc:	4501                	li	a0,0
    800049ce:	00000097          	auipc	ra,0x0
    800049d2:	d74080e7          	jalr	-652(ra) # 80004742 <argint>
    800049d6:	87aa                	mv	a5,a0
    800049d8:	0007d463          	bgez	a5,800049e0 <sys_sleep+0x22>
    return -1;
    800049dc:	57fd                	li	a5,-1
    800049de:	a079                	j	80004a6c <sys_sleep+0xae>
  acquire(&tickslock);
    800049e0:	00016517          	auipc	a0,0x16
    800049e4:	f0850513          	addi	a0,a0,-248 # 8001a8e8 <tickslock>
    800049e8:	ffffd097          	auipc	ra,0xffffd
    800049ec:	886080e7          	jalr	-1914(ra) # 8000126e <acquire>
  ticks0 = ticks;
    800049f0:	00007797          	auipc	a5,0x7
    800049f4:	65c78793          	addi	a5,a5,1628 # 8000c04c <ticks>
    800049f8:	439c                	lw	a5,0(a5)
    800049fa:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    800049fe:	a835                	j	80004a3a <sys_sleep+0x7c>
    if(myproc()->killed){
    80004a00:	ffffe097          	auipc	ra,0xffffe
    80004a04:	e14080e7          	jalr	-492(ra) # 80002814 <myproc>
    80004a08:	87aa                	mv	a5,a0
    80004a0a:	579c                	lw	a5,40(a5)
    80004a0c:	cb99                	beqz	a5,80004a22 <sys_sleep+0x64>
      release(&tickslock);
    80004a0e:	00016517          	auipc	a0,0x16
    80004a12:	eda50513          	addi	a0,a0,-294 # 8001a8e8 <tickslock>
    80004a16:	ffffd097          	auipc	ra,0xffffd
    80004a1a:	8bc080e7          	jalr	-1860(ra) # 800012d2 <release>
      return -1;
    80004a1e:	57fd                	li	a5,-1
    80004a20:	a0b1                	j	80004a6c <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    80004a22:	00016597          	auipc	a1,0x16
    80004a26:	ec658593          	addi	a1,a1,-314 # 8001a8e8 <tickslock>
    80004a2a:	00007517          	auipc	a0,0x7
    80004a2e:	62250513          	addi	a0,a0,1570 # 8000c04c <ticks>
    80004a32:	fffff097          	auipc	ra,0xfffff
    80004a36:	f0e080e7          	jalr	-242(ra) # 80003940 <sleep>
  while(ticks - ticks0 < n){
    80004a3a:	00007797          	auipc	a5,0x7
    80004a3e:	61278793          	addi	a5,a5,1554 # 8000c04c <ticks>
    80004a42:	4398                	lw	a4,0(a5)
    80004a44:	fec42783          	lw	a5,-20(s0)
    80004a48:	40f707bb          	subw	a5,a4,a5
    80004a4c:	0007871b          	sext.w	a4,a5
    80004a50:	fe842783          	lw	a5,-24(s0)
    80004a54:	2781                	sext.w	a5,a5
    80004a56:	faf765e3          	bltu	a4,a5,80004a00 <sys_sleep+0x42>
  }
  release(&tickslock);
    80004a5a:	00016517          	auipc	a0,0x16
    80004a5e:	e8e50513          	addi	a0,a0,-370 # 8001a8e8 <tickslock>
    80004a62:	ffffd097          	auipc	ra,0xffffd
    80004a66:	870080e7          	jalr	-1936(ra) # 800012d2 <release>
  return 0;
    80004a6a:	4781                	li	a5,0
}
    80004a6c:	853e                	mv	a0,a5
    80004a6e:	60e2                	ld	ra,24(sp)
    80004a70:	6442                	ld	s0,16(sp)
    80004a72:	6105                	addi	sp,sp,32
    80004a74:	8082                	ret

0000000080004a76 <sys_kill>:

uint64
sys_kill(void)
{
    80004a76:	1101                	addi	sp,sp,-32
    80004a78:	ec06                	sd	ra,24(sp)
    80004a7a:	e822                	sd	s0,16(sp)
    80004a7c:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80004a7e:	fec40793          	addi	a5,s0,-20
    80004a82:	85be                	mv	a1,a5
    80004a84:	4501                	li	a0,0
    80004a86:	00000097          	auipc	ra,0x0
    80004a8a:	cbc080e7          	jalr	-836(ra) # 80004742 <argint>
    80004a8e:	87aa                	mv	a5,a0
    80004a90:	0007d463          	bgez	a5,80004a98 <sys_kill+0x22>
    return -1;
    80004a94:	57fd                	li	a5,-1
    80004a96:	a809                	j	80004aa8 <sys_kill+0x32>
  return kill(pid);
    80004a98:	fec42783          	lw	a5,-20(s0)
    80004a9c:	853e                	mv	a0,a5
    80004a9e:	fffff097          	auipc	ra,0xfffff
    80004aa2:	fd0080e7          	jalr	-48(ra) # 80003a6e <kill>
    80004aa6:	87aa                	mv	a5,a0
}
    80004aa8:	853e                	mv	a0,a5
    80004aaa:	60e2                	ld	ra,24(sp)
    80004aac:	6442                	ld	s0,16(sp)
    80004aae:	6105                	addi	sp,sp,32
    80004ab0:	8082                	ret

0000000080004ab2 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80004ab2:	1101                	addi	sp,sp,-32
    80004ab4:	ec06                	sd	ra,24(sp)
    80004ab6:	e822                	sd	s0,16(sp)
    80004ab8:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80004aba:	00016517          	auipc	a0,0x16
    80004abe:	e2e50513          	addi	a0,a0,-466 # 8001a8e8 <tickslock>
    80004ac2:	ffffc097          	auipc	ra,0xffffc
    80004ac6:	7ac080e7          	jalr	1964(ra) # 8000126e <acquire>
  xticks = ticks;
    80004aca:	00007797          	auipc	a5,0x7
    80004ace:	58278793          	addi	a5,a5,1410 # 8000c04c <ticks>
    80004ad2:	439c                	lw	a5,0(a5)
    80004ad4:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    80004ad8:	00016517          	auipc	a0,0x16
    80004adc:	e1050513          	addi	a0,a0,-496 # 8001a8e8 <tickslock>
    80004ae0:	ffffc097          	auipc	ra,0xffffc
    80004ae4:	7f2080e7          	jalr	2034(ra) # 800012d2 <release>
  return xticks;
    80004ae8:	fec46783          	lwu	a5,-20(s0)
}
    80004aec:	853e                	mv	a0,a5
    80004aee:	60e2                	ld	ra,24(sp)
    80004af0:	6442                	ld	s0,16(sp)
    80004af2:	6105                	addi	sp,sp,32
    80004af4:	8082                	ret

0000000080004af6 <sys_change>:
uint64
sys_change(void){
    80004af6:	1101                	addi	sp,sp,-32
    80004af8:	ec06                	sd	ra,24(sp)
    80004afa:	e822                	sd	s0,16(sp)
    80004afc:	1000                	addi	s0,sp,32
    int f1,f2;

    if(argint(0, &f1)<0){
    80004afe:	fec40793          	addi	a5,s0,-20
    80004b02:	85be                	mv	a1,a5
    80004b04:	4501                	li	a0,0
    80004b06:	00000097          	auipc	ra,0x0
    80004b0a:	c3c080e7          	jalr	-964(ra) # 80004742 <argint>
    80004b0e:	87aa                	mv	a5,a0
    80004b10:	0007d463          	bgez	a5,80004b18 <sys_change+0x22>
        return -1;
    80004b14:	57fd                	li	a5,-1
    80004b16:	a80d                	j	80004b48 <sys_change+0x52>
    }
    if(argint(1,&f2)<0) {
    80004b18:	fe840793          	addi	a5,s0,-24
    80004b1c:	85be                	mv	a1,a5
    80004b1e:	4505                	li	a0,1
    80004b20:	00000097          	auipc	ra,0x0
    80004b24:	c22080e7          	jalr	-990(ra) # 80004742 <argint>
    80004b28:	87aa                	mv	a5,a0
    80004b2a:	0007d463          	bgez	a5,80004b32 <sys_change+0x3c>
        return -1;
    80004b2e:	57fd                	li	a5,-1
    80004b30:	a821                	j	80004b48 <sys_change+0x52>
    }

    change(f1,f2);
    80004b32:	fec42783          	lw	a5,-20(s0)
    80004b36:	fe842703          	lw	a4,-24(s0)
    80004b3a:	85ba                	mv	a1,a4
    80004b3c:	853e                	mv	a0,a5
    80004b3e:	ffffe097          	auipc	ra,0xffffe
    80004b42:	1ec080e7          	jalr	492(ra) # 80002d2a <change>
    return 0;
    80004b46:	4781                	li	a5,0
}
    80004b48:	853e                	mv	a0,a5
    80004b4a:	60e2                	ld	ra,24(sp)
    80004b4c:	6442                	ld	s0,16(sp)
    80004b4e:	6105                	addi	sp,sp,32
    80004b50:	8082                	ret

0000000080004b52 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80004b52:	1101                	addi	sp,sp,-32
    80004b54:	ec06                	sd	ra,24(sp)
    80004b56:	e822                	sd	s0,16(sp)
    80004b58:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80004b5a:	00007597          	auipc	a1,0x7
    80004b5e:	8b658593          	addi	a1,a1,-1866 # 8000b410 <etext+0x410>
    80004b62:	00016517          	auipc	a0,0x16
    80004b66:	d9e50513          	addi	a0,a0,-610 # 8001a900 <bcache>
    80004b6a:	ffffc097          	auipc	ra,0xffffc
    80004b6e:	6d4080e7          	jalr	1748(ra) # 8000123e <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80004b72:	00016717          	auipc	a4,0x16
    80004b76:	d8e70713          	addi	a4,a4,-626 # 8001a900 <bcache>
    80004b7a:	67a1                	lui	a5,0x8
    80004b7c:	97ba                	add	a5,a5,a4
    80004b7e:	0001e717          	auipc	a4,0x1e
    80004b82:	fea70713          	addi	a4,a4,-22 # 80022b68 <bcache+0x8268>
    80004b86:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    80004b8a:	00016717          	auipc	a4,0x16
    80004b8e:	d7670713          	addi	a4,a4,-650 # 8001a900 <bcache>
    80004b92:	67a1                	lui	a5,0x8
    80004b94:	97ba                	add	a5,a5,a4
    80004b96:	0001e717          	auipc	a4,0x1e
    80004b9a:	fd270713          	addi	a4,a4,-46 # 80022b68 <bcache+0x8268>
    80004b9e:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004ba2:	00016797          	auipc	a5,0x16
    80004ba6:	d7678793          	addi	a5,a5,-650 # 8001a918 <bcache+0x18>
    80004baa:	fef43423          	sd	a5,-24(s0)
    80004bae:	a895                	j	80004c22 <binit+0xd0>
    b->next = bcache.head.next;
    80004bb0:	00016717          	auipc	a4,0x16
    80004bb4:	d5070713          	addi	a4,a4,-688 # 8001a900 <bcache>
    80004bb8:	67a1                	lui	a5,0x8
    80004bba:	97ba                	add	a5,a5,a4
    80004bbc:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004bc0:	fe843783          	ld	a5,-24(s0)
    80004bc4:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004bc6:	fe843783          	ld	a5,-24(s0)
    80004bca:	0001e717          	auipc	a4,0x1e
    80004bce:	f9e70713          	addi	a4,a4,-98 # 80022b68 <bcache+0x8268>
    80004bd2:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004bd4:	fe843783          	ld	a5,-24(s0)
    80004bd8:	07c1                	addi	a5,a5,16
    80004bda:	00007597          	auipc	a1,0x7
    80004bde:	83e58593          	addi	a1,a1,-1986 # 8000b418 <etext+0x418>
    80004be2:	853e                	mv	a0,a5
    80004be4:	00002097          	auipc	ra,0x2
    80004be8:	ff8080e7          	jalr	-8(ra) # 80006bdc <initsleeplock>
    bcache.head.next->prev = b;
    80004bec:	00016717          	auipc	a4,0x16
    80004bf0:	d1470713          	addi	a4,a4,-748 # 8001a900 <bcache>
    80004bf4:	67a1                	lui	a5,0x8
    80004bf6:	97ba                	add	a5,a5,a4
    80004bf8:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004bfc:	fe843703          	ld	a4,-24(s0)
    80004c00:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004c02:	00016717          	auipc	a4,0x16
    80004c06:	cfe70713          	addi	a4,a4,-770 # 8001a900 <bcache>
    80004c0a:	67a1                	lui	a5,0x8
    80004c0c:	97ba                	add	a5,a5,a4
    80004c0e:	fe843703          	ld	a4,-24(s0)
    80004c12:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004c16:	fe843783          	ld	a5,-24(s0)
    80004c1a:	45878793          	addi	a5,a5,1112
    80004c1e:	fef43423          	sd	a5,-24(s0)
    80004c22:	0001e797          	auipc	a5,0x1e
    80004c26:	f4678793          	addi	a5,a5,-186 # 80022b68 <bcache+0x8268>
    80004c2a:	fe843703          	ld	a4,-24(s0)
    80004c2e:	f8f761e3          	bltu	a4,a5,80004bb0 <binit+0x5e>
  }
}
    80004c32:	0001                	nop
    80004c34:	0001                	nop
    80004c36:	60e2                	ld	ra,24(sp)
    80004c38:	6442                	ld	s0,16(sp)
    80004c3a:	6105                	addi	sp,sp,32
    80004c3c:	8082                	ret

0000000080004c3e <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    80004c3e:	7179                	addi	sp,sp,-48
    80004c40:	f406                	sd	ra,40(sp)
    80004c42:	f022                	sd	s0,32(sp)
    80004c44:	1800                	addi	s0,sp,48
    80004c46:	87aa                	mv	a5,a0
    80004c48:	872e                	mv	a4,a1
    80004c4a:	fcf42e23          	sw	a5,-36(s0)
    80004c4e:	87ba                	mv	a5,a4
    80004c50:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    80004c54:	00016517          	auipc	a0,0x16
    80004c58:	cac50513          	addi	a0,a0,-852 # 8001a900 <bcache>
    80004c5c:	ffffc097          	auipc	ra,0xffffc
    80004c60:	612080e7          	jalr	1554(ra) # 8000126e <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004c64:	00016717          	auipc	a4,0x16
    80004c68:	c9c70713          	addi	a4,a4,-868 # 8001a900 <bcache>
    80004c6c:	67a1                	lui	a5,0x8
    80004c6e:	97ba                	add	a5,a5,a4
    80004c70:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004c74:	fef43423          	sd	a5,-24(s0)
    80004c78:	a095                	j	80004cdc <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    80004c7a:	fe843783          	ld	a5,-24(s0)
    80004c7e:	4798                	lw	a4,8(a5)
    80004c80:	fdc42783          	lw	a5,-36(s0)
    80004c84:	2781                	sext.w	a5,a5
    80004c86:	04e79663          	bne	a5,a4,80004cd2 <bget+0x94>
    80004c8a:	fe843783          	ld	a5,-24(s0)
    80004c8e:	47d8                	lw	a4,12(a5)
    80004c90:	fd842783          	lw	a5,-40(s0)
    80004c94:	2781                	sext.w	a5,a5
    80004c96:	02e79e63          	bne	a5,a4,80004cd2 <bget+0x94>
      b->refcnt++;
    80004c9a:	fe843783          	ld	a5,-24(s0)
    80004c9e:	43bc                	lw	a5,64(a5)
    80004ca0:	2785                	addiw	a5,a5,1
    80004ca2:	0007871b          	sext.w	a4,a5
    80004ca6:	fe843783          	ld	a5,-24(s0)
    80004caa:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004cac:	00016517          	auipc	a0,0x16
    80004cb0:	c5450513          	addi	a0,a0,-940 # 8001a900 <bcache>
    80004cb4:	ffffc097          	auipc	ra,0xffffc
    80004cb8:	61e080e7          	jalr	1566(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    80004cbc:	fe843783          	ld	a5,-24(s0)
    80004cc0:	07c1                	addi	a5,a5,16
    80004cc2:	853e                	mv	a0,a5
    80004cc4:	00002097          	auipc	ra,0x2
    80004cc8:	f64080e7          	jalr	-156(ra) # 80006c28 <acquiresleep>
      return b;
    80004ccc:	fe843783          	ld	a5,-24(s0)
    80004cd0:	a07d                	j	80004d7e <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004cd2:	fe843783          	ld	a5,-24(s0)
    80004cd6:	6bbc                	ld	a5,80(a5)
    80004cd8:	fef43423          	sd	a5,-24(s0)
    80004cdc:	fe843703          	ld	a4,-24(s0)
    80004ce0:	0001e797          	auipc	a5,0x1e
    80004ce4:	e8878793          	addi	a5,a5,-376 # 80022b68 <bcache+0x8268>
    80004ce8:	f8f719e3          	bne	a4,a5,80004c7a <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004cec:	00016717          	auipc	a4,0x16
    80004cf0:	c1470713          	addi	a4,a4,-1004 # 8001a900 <bcache>
    80004cf4:	67a1                	lui	a5,0x8
    80004cf6:	97ba                	add	a5,a5,a4
    80004cf8:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80004cfc:	fef43423          	sd	a5,-24(s0)
    80004d00:	a8b9                	j	80004d5e <bget+0x120>
    if(b->refcnt == 0) {
    80004d02:	fe843783          	ld	a5,-24(s0)
    80004d06:	43bc                	lw	a5,64(a5)
    80004d08:	e7b1                	bnez	a5,80004d54 <bget+0x116>
      b->dev = dev;
    80004d0a:	fe843783          	ld	a5,-24(s0)
    80004d0e:	fdc42703          	lw	a4,-36(s0)
    80004d12:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004d14:	fe843783          	ld	a5,-24(s0)
    80004d18:	fd842703          	lw	a4,-40(s0)
    80004d1c:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    80004d1e:	fe843783          	ld	a5,-24(s0)
    80004d22:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    80004d26:	fe843783          	ld	a5,-24(s0)
    80004d2a:	4705                	li	a4,1
    80004d2c:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004d2e:	00016517          	auipc	a0,0x16
    80004d32:	bd250513          	addi	a0,a0,-1070 # 8001a900 <bcache>
    80004d36:	ffffc097          	auipc	ra,0xffffc
    80004d3a:	59c080e7          	jalr	1436(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    80004d3e:	fe843783          	ld	a5,-24(s0)
    80004d42:	07c1                	addi	a5,a5,16
    80004d44:	853e                	mv	a0,a5
    80004d46:	00002097          	auipc	ra,0x2
    80004d4a:	ee2080e7          	jalr	-286(ra) # 80006c28 <acquiresleep>
      return b;
    80004d4e:	fe843783          	ld	a5,-24(s0)
    80004d52:	a035                	j	80004d7e <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004d54:	fe843783          	ld	a5,-24(s0)
    80004d58:	67bc                	ld	a5,72(a5)
    80004d5a:	fef43423          	sd	a5,-24(s0)
    80004d5e:	fe843703          	ld	a4,-24(s0)
    80004d62:	0001e797          	auipc	a5,0x1e
    80004d66:	e0678793          	addi	a5,a5,-506 # 80022b68 <bcache+0x8268>
    80004d6a:	f8f71ce3          	bne	a4,a5,80004d02 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    80004d6e:	00006517          	auipc	a0,0x6
    80004d72:	6b250513          	addi	a0,a0,1714 # 8000b420 <etext+0x420>
    80004d76:	ffffc097          	auipc	ra,0xffffc
    80004d7a:	f08080e7          	jalr	-248(ra) # 80000c7e <panic>
}
    80004d7e:	853e                	mv	a0,a5
    80004d80:	70a2                	ld	ra,40(sp)
    80004d82:	7402                	ld	s0,32(sp)
    80004d84:	6145                	addi	sp,sp,48
    80004d86:	8082                	ret

0000000080004d88 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004d88:	7179                	addi	sp,sp,-48
    80004d8a:	f406                	sd	ra,40(sp)
    80004d8c:	f022                	sd	s0,32(sp)
    80004d8e:	1800                	addi	s0,sp,48
    80004d90:	87aa                	mv	a5,a0
    80004d92:	872e                	mv	a4,a1
    80004d94:	fcf42e23          	sw	a5,-36(s0)
    80004d98:	87ba                	mv	a5,a4
    80004d9a:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004d9e:	fd842703          	lw	a4,-40(s0)
    80004da2:	fdc42783          	lw	a5,-36(s0)
    80004da6:	85ba                	mv	a1,a4
    80004da8:	853e                	mv	a0,a5
    80004daa:	00000097          	auipc	ra,0x0
    80004dae:	e94080e7          	jalr	-364(ra) # 80004c3e <bget>
    80004db2:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004db6:	fe843783          	ld	a5,-24(s0)
    80004dba:	439c                	lw	a5,0(a5)
    80004dbc:	ef81                	bnez	a5,80004dd4 <bread+0x4c>
    virtio_disk_rw(b, 0);
    80004dbe:	4581                	li	a1,0
    80004dc0:	fe843503          	ld	a0,-24(s0)
    80004dc4:	00004097          	auipc	ra,0x4
    80004dc8:	756080e7          	jalr	1878(ra) # 8000951a <virtio_disk_rw>
    b->valid = 1;
    80004dcc:	fe843783          	ld	a5,-24(s0)
    80004dd0:	4705                	li	a4,1
    80004dd2:	c398                	sw	a4,0(a5)
  }
  return b;
    80004dd4:	fe843783          	ld	a5,-24(s0)
}
    80004dd8:	853e                	mv	a0,a5
    80004dda:	70a2                	ld	ra,40(sp)
    80004ddc:	7402                	ld	s0,32(sp)
    80004dde:	6145                	addi	sp,sp,48
    80004de0:	8082                	ret

0000000080004de2 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004de2:	1101                	addi	sp,sp,-32
    80004de4:	ec06                	sd	ra,24(sp)
    80004de6:	e822                	sd	s0,16(sp)
    80004de8:	1000                	addi	s0,sp,32
    80004dea:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004dee:	fe843783          	ld	a5,-24(s0)
    80004df2:	07c1                	addi	a5,a5,16
    80004df4:	853e                	mv	a0,a5
    80004df6:	00002097          	auipc	ra,0x2
    80004dfa:	ef2080e7          	jalr	-270(ra) # 80006ce8 <holdingsleep>
    80004dfe:	87aa                	mv	a5,a0
    80004e00:	eb89                	bnez	a5,80004e12 <bwrite+0x30>
    panic("bwrite");
    80004e02:	00006517          	auipc	a0,0x6
    80004e06:	63650513          	addi	a0,a0,1590 # 8000b438 <etext+0x438>
    80004e0a:	ffffc097          	auipc	ra,0xffffc
    80004e0e:	e74080e7          	jalr	-396(ra) # 80000c7e <panic>
  virtio_disk_rw(b, 1);
    80004e12:	4585                	li	a1,1
    80004e14:	fe843503          	ld	a0,-24(s0)
    80004e18:	00004097          	auipc	ra,0x4
    80004e1c:	702080e7          	jalr	1794(ra) # 8000951a <virtio_disk_rw>
}
    80004e20:	0001                	nop
    80004e22:	60e2                	ld	ra,24(sp)
    80004e24:	6442                	ld	s0,16(sp)
    80004e26:	6105                	addi	sp,sp,32
    80004e28:	8082                	ret

0000000080004e2a <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004e2a:	1101                	addi	sp,sp,-32
    80004e2c:	ec06                	sd	ra,24(sp)
    80004e2e:	e822                	sd	s0,16(sp)
    80004e30:	1000                	addi	s0,sp,32
    80004e32:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004e36:	fe843783          	ld	a5,-24(s0)
    80004e3a:	07c1                	addi	a5,a5,16
    80004e3c:	853e                	mv	a0,a5
    80004e3e:	00002097          	auipc	ra,0x2
    80004e42:	eaa080e7          	jalr	-342(ra) # 80006ce8 <holdingsleep>
    80004e46:	87aa                	mv	a5,a0
    80004e48:	eb89                	bnez	a5,80004e5a <brelse+0x30>
    panic("brelse");
    80004e4a:	00006517          	auipc	a0,0x6
    80004e4e:	5f650513          	addi	a0,a0,1526 # 8000b440 <etext+0x440>
    80004e52:	ffffc097          	auipc	ra,0xffffc
    80004e56:	e2c080e7          	jalr	-468(ra) # 80000c7e <panic>

  releasesleep(&b->lock);
    80004e5a:	fe843783          	ld	a5,-24(s0)
    80004e5e:	07c1                	addi	a5,a5,16
    80004e60:	853e                	mv	a0,a5
    80004e62:	00002097          	auipc	ra,0x2
    80004e66:	e34080e7          	jalr	-460(ra) # 80006c96 <releasesleep>

  acquire(&bcache.lock);
    80004e6a:	00016517          	auipc	a0,0x16
    80004e6e:	a9650513          	addi	a0,a0,-1386 # 8001a900 <bcache>
    80004e72:	ffffc097          	auipc	ra,0xffffc
    80004e76:	3fc080e7          	jalr	1020(ra) # 8000126e <acquire>
  b->refcnt--;
    80004e7a:	fe843783          	ld	a5,-24(s0)
    80004e7e:	43bc                	lw	a5,64(a5)
    80004e80:	37fd                	addiw	a5,a5,-1
    80004e82:	0007871b          	sext.w	a4,a5
    80004e86:	fe843783          	ld	a5,-24(s0)
    80004e8a:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004e8c:	fe843783          	ld	a5,-24(s0)
    80004e90:	43bc                	lw	a5,64(a5)
    80004e92:	e7b5                	bnez	a5,80004efe <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004e94:	fe843783          	ld	a5,-24(s0)
    80004e98:	6bbc                	ld	a5,80(a5)
    80004e9a:	fe843703          	ld	a4,-24(s0)
    80004e9e:	6738                	ld	a4,72(a4)
    80004ea0:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004ea2:	fe843783          	ld	a5,-24(s0)
    80004ea6:	67bc                	ld	a5,72(a5)
    80004ea8:	fe843703          	ld	a4,-24(s0)
    80004eac:	6b38                	ld	a4,80(a4)
    80004eae:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004eb0:	00016717          	auipc	a4,0x16
    80004eb4:	a5070713          	addi	a4,a4,-1456 # 8001a900 <bcache>
    80004eb8:	67a1                	lui	a5,0x8
    80004eba:	97ba                	add	a5,a5,a4
    80004ebc:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004ec0:	fe843783          	ld	a5,-24(s0)
    80004ec4:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004ec6:	fe843783          	ld	a5,-24(s0)
    80004eca:	0001e717          	auipc	a4,0x1e
    80004ece:	c9e70713          	addi	a4,a4,-866 # 80022b68 <bcache+0x8268>
    80004ed2:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004ed4:	00016717          	auipc	a4,0x16
    80004ed8:	a2c70713          	addi	a4,a4,-1492 # 8001a900 <bcache>
    80004edc:	67a1                	lui	a5,0x8
    80004ede:	97ba                	add	a5,a5,a4
    80004ee0:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004ee4:	fe843703          	ld	a4,-24(s0)
    80004ee8:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004eea:	00016717          	auipc	a4,0x16
    80004eee:	a1670713          	addi	a4,a4,-1514 # 8001a900 <bcache>
    80004ef2:	67a1                	lui	a5,0x8
    80004ef4:	97ba                	add	a5,a5,a4
    80004ef6:	fe843703          	ld	a4,-24(s0)
    80004efa:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004efe:	00016517          	auipc	a0,0x16
    80004f02:	a0250513          	addi	a0,a0,-1534 # 8001a900 <bcache>
    80004f06:	ffffc097          	auipc	ra,0xffffc
    80004f0a:	3cc080e7          	jalr	972(ra) # 800012d2 <release>
}
    80004f0e:	0001                	nop
    80004f10:	60e2                	ld	ra,24(sp)
    80004f12:	6442                	ld	s0,16(sp)
    80004f14:	6105                	addi	sp,sp,32
    80004f16:	8082                	ret

0000000080004f18 <bpin>:

void
bpin(struct buf *b) {
    80004f18:	1101                	addi	sp,sp,-32
    80004f1a:	ec06                	sd	ra,24(sp)
    80004f1c:	e822                	sd	s0,16(sp)
    80004f1e:	1000                	addi	s0,sp,32
    80004f20:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004f24:	00016517          	auipc	a0,0x16
    80004f28:	9dc50513          	addi	a0,a0,-1572 # 8001a900 <bcache>
    80004f2c:	ffffc097          	auipc	ra,0xffffc
    80004f30:	342080e7          	jalr	834(ra) # 8000126e <acquire>
  b->refcnt++;
    80004f34:	fe843783          	ld	a5,-24(s0)
    80004f38:	43bc                	lw	a5,64(a5)
    80004f3a:	2785                	addiw	a5,a5,1
    80004f3c:	0007871b          	sext.w	a4,a5
    80004f40:	fe843783          	ld	a5,-24(s0)
    80004f44:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004f46:	00016517          	auipc	a0,0x16
    80004f4a:	9ba50513          	addi	a0,a0,-1606 # 8001a900 <bcache>
    80004f4e:	ffffc097          	auipc	ra,0xffffc
    80004f52:	384080e7          	jalr	900(ra) # 800012d2 <release>
}
    80004f56:	0001                	nop
    80004f58:	60e2                	ld	ra,24(sp)
    80004f5a:	6442                	ld	s0,16(sp)
    80004f5c:	6105                	addi	sp,sp,32
    80004f5e:	8082                	ret

0000000080004f60 <bunpin>:

void
bunpin(struct buf *b) {
    80004f60:	1101                	addi	sp,sp,-32
    80004f62:	ec06                	sd	ra,24(sp)
    80004f64:	e822                	sd	s0,16(sp)
    80004f66:	1000                	addi	s0,sp,32
    80004f68:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004f6c:	00016517          	auipc	a0,0x16
    80004f70:	99450513          	addi	a0,a0,-1644 # 8001a900 <bcache>
    80004f74:	ffffc097          	auipc	ra,0xffffc
    80004f78:	2fa080e7          	jalr	762(ra) # 8000126e <acquire>
  b->refcnt--;
    80004f7c:	fe843783          	ld	a5,-24(s0)
    80004f80:	43bc                	lw	a5,64(a5)
    80004f82:	37fd                	addiw	a5,a5,-1
    80004f84:	0007871b          	sext.w	a4,a5
    80004f88:	fe843783          	ld	a5,-24(s0)
    80004f8c:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004f8e:	00016517          	auipc	a0,0x16
    80004f92:	97250513          	addi	a0,a0,-1678 # 8001a900 <bcache>
    80004f96:	ffffc097          	auipc	ra,0xffffc
    80004f9a:	33c080e7          	jalr	828(ra) # 800012d2 <release>
}
    80004f9e:	0001                	nop
    80004fa0:	60e2                	ld	ra,24(sp)
    80004fa2:	6442                	ld	s0,16(sp)
    80004fa4:	6105                	addi	sp,sp,32
    80004fa6:	8082                	ret

0000000080004fa8 <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004fa8:	7179                	addi	sp,sp,-48
    80004faa:	f406                	sd	ra,40(sp)
    80004fac:	f022                	sd	s0,32(sp)
    80004fae:	1800                	addi	s0,sp,48
    80004fb0:	87aa                	mv	a5,a0
    80004fb2:	fcb43823          	sd	a1,-48(s0)
    80004fb6:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004fba:	fdc42783          	lw	a5,-36(s0)
    80004fbe:	4585                	li	a1,1
    80004fc0:	853e                	mv	a0,a5
    80004fc2:	00000097          	auipc	ra,0x0
    80004fc6:	dc6080e7          	jalr	-570(ra) # 80004d88 <bread>
    80004fca:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004fce:	fe843783          	ld	a5,-24(s0)
    80004fd2:	05878793          	addi	a5,a5,88
    80004fd6:	02000613          	li	a2,32
    80004fda:	85be                	mv	a1,a5
    80004fdc:	fd043503          	ld	a0,-48(s0)
    80004fe0:	ffffc097          	auipc	ra,0xffffc
    80004fe4:	546080e7          	jalr	1350(ra) # 80001526 <memmove>
  brelse(bp);
    80004fe8:	fe843503          	ld	a0,-24(s0)
    80004fec:	00000097          	auipc	ra,0x0
    80004ff0:	e3e080e7          	jalr	-450(ra) # 80004e2a <brelse>
}
    80004ff4:	0001                	nop
    80004ff6:	70a2                	ld	ra,40(sp)
    80004ff8:	7402                	ld	s0,32(sp)
    80004ffa:	6145                	addi	sp,sp,48
    80004ffc:	8082                	ret

0000000080004ffe <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004ffe:	1101                	addi	sp,sp,-32
    80005000:	ec06                	sd	ra,24(sp)
    80005002:	e822                	sd	s0,16(sp)
    80005004:	1000                	addi	s0,sp,32
    80005006:	87aa                	mv	a5,a0
    80005008:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    8000500c:	fec42783          	lw	a5,-20(s0)
    80005010:	0001e597          	auipc	a1,0x1e
    80005014:	fb058593          	addi	a1,a1,-80 # 80022fc0 <sb>
    80005018:	853e                	mv	a0,a5
    8000501a:	00000097          	auipc	ra,0x0
    8000501e:	f8e080e7          	jalr	-114(ra) # 80004fa8 <readsb>
  if(sb.magic != FSMAGIC)
    80005022:	0001e797          	auipc	a5,0x1e
    80005026:	f9e78793          	addi	a5,a5,-98 # 80022fc0 <sb>
    8000502a:	439c                	lw	a5,0(a5)
    8000502c:	873e                	mv	a4,a5
    8000502e:	102037b7          	lui	a5,0x10203
    80005032:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80005036:	00f70a63          	beq	a4,a5,8000504a <fsinit+0x4c>
    panic("invalid file system");
    8000503a:	00006517          	auipc	a0,0x6
    8000503e:	40e50513          	addi	a0,a0,1038 # 8000b448 <etext+0x448>
    80005042:	ffffc097          	auipc	ra,0xffffc
    80005046:	c3c080e7          	jalr	-964(ra) # 80000c7e <panic>
  initlog(dev, &sb);
    8000504a:	fec42783          	lw	a5,-20(s0)
    8000504e:	0001e597          	auipc	a1,0x1e
    80005052:	f7258593          	addi	a1,a1,-142 # 80022fc0 <sb>
    80005056:	853e                	mv	a0,a5
    80005058:	00001097          	auipc	ra,0x1
    8000505c:	468080e7          	jalr	1128(ra) # 800064c0 <initlog>
}
    80005060:	0001                	nop
    80005062:	60e2                	ld	ra,24(sp)
    80005064:	6442                	ld	s0,16(sp)
    80005066:	6105                	addi	sp,sp,32
    80005068:	8082                	ret

000000008000506a <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    8000506a:	7179                	addi	sp,sp,-48
    8000506c:	f406                	sd	ra,40(sp)
    8000506e:	f022                	sd	s0,32(sp)
    80005070:	1800                	addi	s0,sp,48
    80005072:	87aa                	mv	a5,a0
    80005074:	872e                	mv	a4,a1
    80005076:	fcf42e23          	sw	a5,-36(s0)
    8000507a:	87ba                	mv	a5,a4
    8000507c:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80005080:	fdc42783          	lw	a5,-36(s0)
    80005084:	fd842703          	lw	a4,-40(s0)
    80005088:	85ba                	mv	a1,a4
    8000508a:	853e                	mv	a0,a5
    8000508c:	00000097          	auipc	ra,0x0
    80005090:	cfc080e7          	jalr	-772(ra) # 80004d88 <bread>
    80005094:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80005098:	fe843783          	ld	a5,-24(s0)
    8000509c:	05878793          	addi	a5,a5,88
    800050a0:	40000613          	li	a2,1024
    800050a4:	4581                	li	a1,0
    800050a6:	853e                	mv	a0,a5
    800050a8:	ffffc097          	auipc	ra,0xffffc
    800050ac:	39a080e7          	jalr	922(ra) # 80001442 <memset>
  log_write(bp);
    800050b0:	fe843503          	ld	a0,-24(s0)
    800050b4:	00002097          	auipc	ra,0x2
    800050b8:	9f4080e7          	jalr	-1548(ra) # 80006aa8 <log_write>
  brelse(bp);
    800050bc:	fe843503          	ld	a0,-24(s0)
    800050c0:	00000097          	auipc	ra,0x0
    800050c4:	d6a080e7          	jalr	-662(ra) # 80004e2a <brelse>
}
    800050c8:	0001                	nop
    800050ca:	70a2                	ld	ra,40(sp)
    800050cc:	7402                	ld	s0,32(sp)
    800050ce:	6145                	addi	sp,sp,48
    800050d0:	8082                	ret

00000000800050d2 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
    800050d2:	7139                	addi	sp,sp,-64
    800050d4:	fc06                	sd	ra,56(sp)
    800050d6:	f822                	sd	s0,48(sp)
    800050d8:	0080                	addi	s0,sp,64
    800050da:	87aa                	mv	a5,a0
    800050dc:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    800050e0:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    800050e4:	fe042623          	sw	zero,-20(s0)
    800050e8:	a2b5                	j	80005254 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    800050ea:	fec42783          	lw	a5,-20(s0)
    800050ee:	41f7d71b          	sraiw	a4,a5,0x1f
    800050f2:	0137571b          	srliw	a4,a4,0x13
    800050f6:	9fb9                	addw	a5,a5,a4
    800050f8:	40d7d79b          	sraiw	a5,a5,0xd
    800050fc:	2781                	sext.w	a5,a5
    800050fe:	0007871b          	sext.w	a4,a5
    80005102:	0001e797          	auipc	a5,0x1e
    80005106:	ebe78793          	addi	a5,a5,-322 # 80022fc0 <sb>
    8000510a:	4fdc                	lw	a5,28(a5)
    8000510c:	9fb9                	addw	a5,a5,a4
    8000510e:	0007871b          	sext.w	a4,a5
    80005112:	fcc42783          	lw	a5,-52(s0)
    80005116:	85ba                	mv	a1,a4
    80005118:	853e                	mv	a0,a5
    8000511a:	00000097          	auipc	ra,0x0
    8000511e:	c6e080e7          	jalr	-914(ra) # 80004d88 <bread>
    80005122:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80005126:	fe042423          	sw	zero,-24(s0)
    8000512a:	a0dd                	j	80005210 <balloc+0x13e>
      m = 1 << (bi % 8);
    8000512c:	fe842703          	lw	a4,-24(s0)
    80005130:	41f7579b          	sraiw	a5,a4,0x1f
    80005134:	01d7d79b          	srliw	a5,a5,0x1d
    80005138:	9f3d                	addw	a4,a4,a5
    8000513a:	8b1d                	andi	a4,a4,7
    8000513c:	40f707bb          	subw	a5,a4,a5
    80005140:	2781                	sext.w	a5,a5
    80005142:	4705                	li	a4,1
    80005144:	00f717bb          	sllw	a5,a4,a5
    80005148:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    8000514c:	fe842783          	lw	a5,-24(s0)
    80005150:	41f7d71b          	sraiw	a4,a5,0x1f
    80005154:	01d7571b          	srliw	a4,a4,0x1d
    80005158:	9fb9                	addw	a5,a5,a4
    8000515a:	4037d79b          	sraiw	a5,a5,0x3
    8000515e:	2781                	sext.w	a5,a5
    80005160:	fe043703          	ld	a4,-32(s0)
    80005164:	97ba                	add	a5,a5,a4
    80005166:	0587c783          	lbu	a5,88(a5)
    8000516a:	0007871b          	sext.w	a4,a5
    8000516e:	fdc42783          	lw	a5,-36(s0)
    80005172:	8ff9                	and	a5,a5,a4
    80005174:	2781                	sext.w	a5,a5
    80005176:	ebc1                	bnez	a5,80005206 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80005178:	fe842783          	lw	a5,-24(s0)
    8000517c:	41f7d71b          	sraiw	a4,a5,0x1f
    80005180:	01d7571b          	srliw	a4,a4,0x1d
    80005184:	9fb9                	addw	a5,a5,a4
    80005186:	4037d79b          	sraiw	a5,a5,0x3
    8000518a:	2781                	sext.w	a5,a5
    8000518c:	fe043703          	ld	a4,-32(s0)
    80005190:	973e                	add	a4,a4,a5
    80005192:	05874703          	lbu	a4,88(a4)
    80005196:	0187169b          	slliw	a3,a4,0x18
    8000519a:	4186d69b          	sraiw	a3,a3,0x18
    8000519e:	fdc42703          	lw	a4,-36(s0)
    800051a2:	0187171b          	slliw	a4,a4,0x18
    800051a6:	4187571b          	sraiw	a4,a4,0x18
    800051aa:	8f55                	or	a4,a4,a3
    800051ac:	0187171b          	slliw	a4,a4,0x18
    800051b0:	4187571b          	sraiw	a4,a4,0x18
    800051b4:	0ff77713          	andi	a4,a4,255
    800051b8:	fe043683          	ld	a3,-32(s0)
    800051bc:	97b6                	add	a5,a5,a3
    800051be:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    800051c2:	fe043503          	ld	a0,-32(s0)
    800051c6:	00002097          	auipc	ra,0x2
    800051ca:	8e2080e7          	jalr	-1822(ra) # 80006aa8 <log_write>
        brelse(bp);
    800051ce:	fe043503          	ld	a0,-32(s0)
    800051d2:	00000097          	auipc	ra,0x0
    800051d6:	c58080e7          	jalr	-936(ra) # 80004e2a <brelse>
        bzero(dev, b + bi);
    800051da:	fcc42683          	lw	a3,-52(s0)
    800051de:	fec42703          	lw	a4,-20(s0)
    800051e2:	fe842783          	lw	a5,-24(s0)
    800051e6:	9fb9                	addw	a5,a5,a4
    800051e8:	2781                	sext.w	a5,a5
    800051ea:	85be                	mv	a1,a5
    800051ec:	8536                	mv	a0,a3
    800051ee:	00000097          	auipc	ra,0x0
    800051f2:	e7c080e7          	jalr	-388(ra) # 8000506a <bzero>
        return b + bi;
    800051f6:	fec42703          	lw	a4,-20(s0)
    800051fa:	fe842783          	lw	a5,-24(s0)
    800051fe:	9fb9                	addw	a5,a5,a4
    80005200:	2781                	sext.w	a5,a5
    80005202:	2781                	sext.w	a5,a5
    80005204:	a88d                	j	80005276 <balloc+0x1a4>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80005206:	fe842783          	lw	a5,-24(s0)
    8000520a:	2785                	addiw	a5,a5,1
    8000520c:	fef42423          	sw	a5,-24(s0)
    80005210:	fe842783          	lw	a5,-24(s0)
    80005214:	0007871b          	sext.w	a4,a5
    80005218:	6789                	lui	a5,0x2
    8000521a:	02f75163          	bge	a4,a5,8000523c <balloc+0x16a>
    8000521e:	fec42703          	lw	a4,-20(s0)
    80005222:	fe842783          	lw	a5,-24(s0)
    80005226:	9fb9                	addw	a5,a5,a4
    80005228:	2781                	sext.w	a5,a5
    8000522a:	0007871b          	sext.w	a4,a5
    8000522e:	0001e797          	auipc	a5,0x1e
    80005232:	d9278793          	addi	a5,a5,-622 # 80022fc0 <sb>
    80005236:	43dc                	lw	a5,4(a5)
    80005238:	eef76ae3          	bltu	a4,a5,8000512c <balloc+0x5a>
      }
    }
    brelse(bp);
    8000523c:	fe043503          	ld	a0,-32(s0)
    80005240:	00000097          	auipc	ra,0x0
    80005244:	bea080e7          	jalr	-1046(ra) # 80004e2a <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80005248:	fec42703          	lw	a4,-20(s0)
    8000524c:	6789                	lui	a5,0x2
    8000524e:	9fb9                	addw	a5,a5,a4
    80005250:	fef42623          	sw	a5,-20(s0)
    80005254:	0001e797          	auipc	a5,0x1e
    80005258:	d6c78793          	addi	a5,a5,-660 # 80022fc0 <sb>
    8000525c:	43d8                	lw	a4,4(a5)
    8000525e:	fec42783          	lw	a5,-20(s0)
    80005262:	e8e7e4e3          	bltu	a5,a4,800050ea <balloc+0x18>
  }
  panic("balloc: out of blocks");
    80005266:	00006517          	auipc	a0,0x6
    8000526a:	1fa50513          	addi	a0,a0,506 # 8000b460 <etext+0x460>
    8000526e:	ffffc097          	auipc	ra,0xffffc
    80005272:	a10080e7          	jalr	-1520(ra) # 80000c7e <panic>
}
    80005276:	853e                	mv	a0,a5
    80005278:	70e2                	ld	ra,56(sp)
    8000527a:	7442                	ld	s0,48(sp)
    8000527c:	6121                	addi	sp,sp,64
    8000527e:	8082                	ret

0000000080005280 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80005280:	7179                	addi	sp,sp,-48
    80005282:	f406                	sd	ra,40(sp)
    80005284:	f022                	sd	s0,32(sp)
    80005286:	1800                	addi	s0,sp,48
    80005288:	87aa                	mv	a5,a0
    8000528a:	872e                	mv	a4,a1
    8000528c:	fcf42e23          	sw	a5,-36(s0)
    80005290:	87ba                	mv	a5,a4
    80005292:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80005296:	fdc42683          	lw	a3,-36(s0)
    8000529a:	fd842783          	lw	a5,-40(s0)
    8000529e:	00d7d79b          	srliw	a5,a5,0xd
    800052a2:	0007871b          	sext.w	a4,a5
    800052a6:	0001e797          	auipc	a5,0x1e
    800052aa:	d1a78793          	addi	a5,a5,-742 # 80022fc0 <sb>
    800052ae:	4fdc                	lw	a5,28(a5)
    800052b0:	9fb9                	addw	a5,a5,a4
    800052b2:	2781                	sext.w	a5,a5
    800052b4:	85be                	mv	a1,a5
    800052b6:	8536                	mv	a0,a3
    800052b8:	00000097          	auipc	ra,0x0
    800052bc:	ad0080e7          	jalr	-1328(ra) # 80004d88 <bread>
    800052c0:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    800052c4:	fd842703          	lw	a4,-40(s0)
    800052c8:	6789                	lui	a5,0x2
    800052ca:	17fd                	addi	a5,a5,-1
    800052cc:	8ff9                	and	a5,a5,a4
    800052ce:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    800052d2:	fe442703          	lw	a4,-28(s0)
    800052d6:	41f7579b          	sraiw	a5,a4,0x1f
    800052da:	01d7d79b          	srliw	a5,a5,0x1d
    800052de:	9f3d                	addw	a4,a4,a5
    800052e0:	8b1d                	andi	a4,a4,7
    800052e2:	40f707bb          	subw	a5,a4,a5
    800052e6:	2781                	sext.w	a5,a5
    800052e8:	4705                	li	a4,1
    800052ea:	00f717bb          	sllw	a5,a4,a5
    800052ee:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    800052f2:	fe442783          	lw	a5,-28(s0)
    800052f6:	41f7d71b          	sraiw	a4,a5,0x1f
    800052fa:	01d7571b          	srliw	a4,a4,0x1d
    800052fe:	9fb9                	addw	a5,a5,a4
    80005300:	4037d79b          	sraiw	a5,a5,0x3
    80005304:	2781                	sext.w	a5,a5
    80005306:	fe843703          	ld	a4,-24(s0)
    8000530a:	97ba                	add	a5,a5,a4
    8000530c:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80005310:	0007871b          	sext.w	a4,a5
    80005314:	fe042783          	lw	a5,-32(s0)
    80005318:	8ff9                	and	a5,a5,a4
    8000531a:	2781                	sext.w	a5,a5
    8000531c:	eb89                	bnez	a5,8000532e <bfree+0xae>
    panic("freeing free block");
    8000531e:	00006517          	auipc	a0,0x6
    80005322:	15a50513          	addi	a0,a0,346 # 8000b478 <etext+0x478>
    80005326:	ffffc097          	auipc	ra,0xffffc
    8000532a:	958080e7          	jalr	-1704(ra) # 80000c7e <panic>
  bp->data[bi/8] &= ~m;
    8000532e:	fe442783          	lw	a5,-28(s0)
    80005332:	41f7d71b          	sraiw	a4,a5,0x1f
    80005336:	01d7571b          	srliw	a4,a4,0x1d
    8000533a:	9fb9                	addw	a5,a5,a4
    8000533c:	4037d79b          	sraiw	a5,a5,0x3
    80005340:	2781                	sext.w	a5,a5
    80005342:	fe843703          	ld	a4,-24(s0)
    80005346:	973e                	add	a4,a4,a5
    80005348:	05874703          	lbu	a4,88(a4)
    8000534c:	0187169b          	slliw	a3,a4,0x18
    80005350:	4186d69b          	sraiw	a3,a3,0x18
    80005354:	fe042703          	lw	a4,-32(s0)
    80005358:	0187171b          	slliw	a4,a4,0x18
    8000535c:	4187571b          	sraiw	a4,a4,0x18
    80005360:	fff74713          	not	a4,a4
    80005364:	0187171b          	slliw	a4,a4,0x18
    80005368:	4187571b          	sraiw	a4,a4,0x18
    8000536c:	8f75                	and	a4,a4,a3
    8000536e:	0187171b          	slliw	a4,a4,0x18
    80005372:	4187571b          	sraiw	a4,a4,0x18
    80005376:	0ff77713          	andi	a4,a4,255
    8000537a:	fe843683          	ld	a3,-24(s0)
    8000537e:	97b6                	add	a5,a5,a3
    80005380:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80005384:	fe843503          	ld	a0,-24(s0)
    80005388:	00001097          	auipc	ra,0x1
    8000538c:	720080e7          	jalr	1824(ra) # 80006aa8 <log_write>
  brelse(bp);
    80005390:	fe843503          	ld	a0,-24(s0)
    80005394:	00000097          	auipc	ra,0x0
    80005398:	a96080e7          	jalr	-1386(ra) # 80004e2a <brelse>
}
    8000539c:	0001                	nop
    8000539e:	70a2                	ld	ra,40(sp)
    800053a0:	7402                	ld	s0,32(sp)
    800053a2:	6145                	addi	sp,sp,48
    800053a4:	8082                	ret

00000000800053a6 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    800053a6:	1101                	addi	sp,sp,-32
    800053a8:	ec06                	sd	ra,24(sp)
    800053aa:	e822                	sd	s0,16(sp)
    800053ac:	1000                	addi	s0,sp,32
  int i = 0;
    800053ae:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    800053b2:	00006597          	auipc	a1,0x6
    800053b6:	0de58593          	addi	a1,a1,222 # 8000b490 <etext+0x490>
    800053ba:	0001e517          	auipc	a0,0x1e
    800053be:	c2650513          	addi	a0,a0,-986 # 80022fe0 <itable>
    800053c2:	ffffc097          	auipc	ra,0xffffc
    800053c6:	e7c080e7          	jalr	-388(ra) # 8000123e <initlock>
  for(i = 0; i < NINODE; i++) {
    800053ca:	fe042623          	sw	zero,-20(s0)
    800053ce:	a82d                	j	80005408 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    800053d0:	fec42703          	lw	a4,-20(s0)
    800053d4:	87ba                	mv	a5,a4
    800053d6:	0792                	slli	a5,a5,0x4
    800053d8:	97ba                	add	a5,a5,a4
    800053da:	078e                	slli	a5,a5,0x3
    800053dc:	02078713          	addi	a4,a5,32
    800053e0:	0001e797          	auipc	a5,0x1e
    800053e4:	c0078793          	addi	a5,a5,-1024 # 80022fe0 <itable>
    800053e8:	97ba                	add	a5,a5,a4
    800053ea:	07a1                	addi	a5,a5,8
    800053ec:	00006597          	auipc	a1,0x6
    800053f0:	0ac58593          	addi	a1,a1,172 # 8000b498 <etext+0x498>
    800053f4:	853e                	mv	a0,a5
    800053f6:	00001097          	auipc	ra,0x1
    800053fa:	7e6080e7          	jalr	2022(ra) # 80006bdc <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    800053fe:	fec42783          	lw	a5,-20(s0)
    80005402:	2785                	addiw	a5,a5,1
    80005404:	fef42623          	sw	a5,-20(s0)
    80005408:	fec42783          	lw	a5,-20(s0)
    8000540c:	0007871b          	sext.w	a4,a5
    80005410:	03100793          	li	a5,49
    80005414:	fae7dee3          	bge	a5,a4,800053d0 <iinit+0x2a>
  }
}
    80005418:	0001                	nop
    8000541a:	0001                	nop
    8000541c:	60e2                	ld	ra,24(sp)
    8000541e:	6442                	ld	s0,16(sp)
    80005420:	6105                	addi	sp,sp,32
    80005422:	8082                	ret

0000000080005424 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
    80005424:	7139                	addi	sp,sp,-64
    80005426:	fc06                	sd	ra,56(sp)
    80005428:	f822                	sd	s0,48(sp)
    8000542a:	0080                	addi	s0,sp,64
    8000542c:	87aa                	mv	a5,a0
    8000542e:	872e                	mv	a4,a1
    80005430:	fcf42623          	sw	a5,-52(s0)
    80005434:	87ba                	mv	a5,a4
    80005436:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    8000543a:	4785                	li	a5,1
    8000543c:	fef42623          	sw	a5,-20(s0)
    80005440:	a855                	j	800054f4 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80005442:	fec42783          	lw	a5,-20(s0)
    80005446:	8391                	srli	a5,a5,0x4
    80005448:	0007871b          	sext.w	a4,a5
    8000544c:	0001e797          	auipc	a5,0x1e
    80005450:	b7478793          	addi	a5,a5,-1164 # 80022fc0 <sb>
    80005454:	4f9c                	lw	a5,24(a5)
    80005456:	9fb9                	addw	a5,a5,a4
    80005458:	0007871b          	sext.w	a4,a5
    8000545c:	fcc42783          	lw	a5,-52(s0)
    80005460:	85ba                	mv	a1,a4
    80005462:	853e                	mv	a0,a5
    80005464:	00000097          	auipc	ra,0x0
    80005468:	924080e7          	jalr	-1756(ra) # 80004d88 <bread>
    8000546c:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80005470:	fe043783          	ld	a5,-32(s0)
    80005474:	05878713          	addi	a4,a5,88
    80005478:	fec42783          	lw	a5,-20(s0)
    8000547c:	8bbd                	andi	a5,a5,15
    8000547e:	079a                	slli	a5,a5,0x6
    80005480:	97ba                	add	a5,a5,a4
    80005482:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80005486:	fd843783          	ld	a5,-40(s0)
    8000548a:	00079783          	lh	a5,0(a5)
    8000548e:	eba1                	bnez	a5,800054de <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80005490:	04000613          	li	a2,64
    80005494:	4581                	li	a1,0
    80005496:	fd843503          	ld	a0,-40(s0)
    8000549a:	ffffc097          	auipc	ra,0xffffc
    8000549e:	fa8080e7          	jalr	-88(ra) # 80001442 <memset>
      dip->type = type;
    800054a2:	fd843783          	ld	a5,-40(s0)
    800054a6:	fca45703          	lhu	a4,-54(s0)
    800054aa:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    800054ae:	fe043503          	ld	a0,-32(s0)
    800054b2:	00001097          	auipc	ra,0x1
    800054b6:	5f6080e7          	jalr	1526(ra) # 80006aa8 <log_write>
      brelse(bp);
    800054ba:	fe043503          	ld	a0,-32(s0)
    800054be:	00000097          	auipc	ra,0x0
    800054c2:	96c080e7          	jalr	-1684(ra) # 80004e2a <brelse>
      return iget(dev, inum);
    800054c6:	fec42703          	lw	a4,-20(s0)
    800054ca:	fcc42783          	lw	a5,-52(s0)
    800054ce:	85ba                	mv	a1,a4
    800054d0:	853e                	mv	a0,a5
    800054d2:	00000097          	auipc	ra,0x0
    800054d6:	136080e7          	jalr	310(ra) # 80005608 <iget>
    800054da:	87aa                	mv	a5,a0
    800054dc:	a82d                	j	80005516 <ialloc+0xf2>
    }
    brelse(bp);
    800054de:	fe043503          	ld	a0,-32(s0)
    800054e2:	00000097          	auipc	ra,0x0
    800054e6:	948080e7          	jalr	-1720(ra) # 80004e2a <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    800054ea:	fec42783          	lw	a5,-20(s0)
    800054ee:	2785                	addiw	a5,a5,1
    800054f0:	fef42623          	sw	a5,-20(s0)
    800054f4:	0001e797          	auipc	a5,0x1e
    800054f8:	acc78793          	addi	a5,a5,-1332 # 80022fc0 <sb>
    800054fc:	47d8                	lw	a4,12(a5)
    800054fe:	fec42783          	lw	a5,-20(s0)
    80005502:	f4e7e0e3          	bltu	a5,a4,80005442 <ialloc+0x1e>
  }
  panic("ialloc: no inodes");
    80005506:	00006517          	auipc	a0,0x6
    8000550a:	f9a50513          	addi	a0,a0,-102 # 8000b4a0 <etext+0x4a0>
    8000550e:	ffffb097          	auipc	ra,0xffffb
    80005512:	770080e7          	jalr	1904(ra) # 80000c7e <panic>
}
    80005516:	853e                	mv	a0,a5
    80005518:	70e2                	ld	ra,56(sp)
    8000551a:	7442                	ld	s0,48(sp)
    8000551c:	6121                	addi	sp,sp,64
    8000551e:	8082                	ret

0000000080005520 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80005520:	7179                	addi	sp,sp,-48
    80005522:	f406                	sd	ra,40(sp)
    80005524:	f022                	sd	s0,32(sp)
    80005526:	1800                	addi	s0,sp,48
    80005528:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    8000552c:	fd843783          	ld	a5,-40(s0)
    80005530:	4394                	lw	a3,0(a5)
    80005532:	fd843783          	ld	a5,-40(s0)
    80005536:	43dc                	lw	a5,4(a5)
    80005538:	0047d79b          	srliw	a5,a5,0x4
    8000553c:	0007871b          	sext.w	a4,a5
    80005540:	0001e797          	auipc	a5,0x1e
    80005544:	a8078793          	addi	a5,a5,-1408 # 80022fc0 <sb>
    80005548:	4f9c                	lw	a5,24(a5)
    8000554a:	9fb9                	addw	a5,a5,a4
    8000554c:	2781                	sext.w	a5,a5
    8000554e:	85be                	mv	a1,a5
    80005550:	8536                	mv	a0,a3
    80005552:	00000097          	auipc	ra,0x0
    80005556:	836080e7          	jalr	-1994(ra) # 80004d88 <bread>
    8000555a:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    8000555e:	fe843783          	ld	a5,-24(s0)
    80005562:	05878713          	addi	a4,a5,88
    80005566:	fd843783          	ld	a5,-40(s0)
    8000556a:	43dc                	lw	a5,4(a5)
    8000556c:	1782                	slli	a5,a5,0x20
    8000556e:	9381                	srli	a5,a5,0x20
    80005570:	8bbd                	andi	a5,a5,15
    80005572:	079a                	slli	a5,a5,0x6
    80005574:	97ba                	add	a5,a5,a4
    80005576:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    8000557a:	fd843783          	ld	a5,-40(s0)
    8000557e:	04479703          	lh	a4,68(a5)
    80005582:	fe043783          	ld	a5,-32(s0)
    80005586:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    8000558a:	fd843783          	ld	a5,-40(s0)
    8000558e:	04679703          	lh	a4,70(a5)
    80005592:	fe043783          	ld	a5,-32(s0)
    80005596:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    8000559a:	fd843783          	ld	a5,-40(s0)
    8000559e:	04879703          	lh	a4,72(a5)
    800055a2:	fe043783          	ld	a5,-32(s0)
    800055a6:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    800055aa:	fd843783          	ld	a5,-40(s0)
    800055ae:	04a79703          	lh	a4,74(a5)
    800055b2:	fe043783          	ld	a5,-32(s0)
    800055b6:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    800055ba:	fd843783          	ld	a5,-40(s0)
    800055be:	47f8                	lw	a4,76(a5)
    800055c0:	fe043783          	ld	a5,-32(s0)
    800055c4:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    800055c6:	fe043783          	ld	a5,-32(s0)
    800055ca:	00c78713          	addi	a4,a5,12
    800055ce:	fd843783          	ld	a5,-40(s0)
    800055d2:	05078793          	addi	a5,a5,80
    800055d6:	03400613          	li	a2,52
    800055da:	85be                	mv	a1,a5
    800055dc:	853a                	mv	a0,a4
    800055de:	ffffc097          	auipc	ra,0xffffc
    800055e2:	f48080e7          	jalr	-184(ra) # 80001526 <memmove>
  log_write(bp);
    800055e6:	fe843503          	ld	a0,-24(s0)
    800055ea:	00001097          	auipc	ra,0x1
    800055ee:	4be080e7          	jalr	1214(ra) # 80006aa8 <log_write>
  brelse(bp);
    800055f2:	fe843503          	ld	a0,-24(s0)
    800055f6:	00000097          	auipc	ra,0x0
    800055fa:	834080e7          	jalr	-1996(ra) # 80004e2a <brelse>
}
    800055fe:	0001                	nop
    80005600:	70a2                	ld	ra,40(sp)
    80005602:	7402                	ld	s0,32(sp)
    80005604:	6145                	addi	sp,sp,48
    80005606:	8082                	ret

0000000080005608 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    80005608:	7179                	addi	sp,sp,-48
    8000560a:	f406                	sd	ra,40(sp)
    8000560c:	f022                	sd	s0,32(sp)
    8000560e:	1800                	addi	s0,sp,48
    80005610:	87aa                	mv	a5,a0
    80005612:	872e                	mv	a4,a1
    80005614:	fcf42e23          	sw	a5,-36(s0)
    80005618:	87ba                	mv	a5,a4
    8000561a:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    8000561e:	0001e517          	auipc	a0,0x1e
    80005622:	9c250513          	addi	a0,a0,-1598 # 80022fe0 <itable>
    80005626:	ffffc097          	auipc	ra,0xffffc
    8000562a:	c48080e7          	jalr	-952(ra) # 8000126e <acquire>

  // Is the inode already in the table?
  empty = 0;
    8000562e:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005632:	0001e797          	auipc	a5,0x1e
    80005636:	9c678793          	addi	a5,a5,-1594 # 80022ff8 <itable+0x18>
    8000563a:	fef43423          	sd	a5,-24(s0)
    8000563e:	a89d                	j	800056b4 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    80005640:	fe843783          	ld	a5,-24(s0)
    80005644:	479c                	lw	a5,8(a5)
    80005646:	04f05663          	blez	a5,80005692 <iget+0x8a>
    8000564a:	fe843783          	ld	a5,-24(s0)
    8000564e:	4398                	lw	a4,0(a5)
    80005650:	fdc42783          	lw	a5,-36(s0)
    80005654:	2781                	sext.w	a5,a5
    80005656:	02e79e63          	bne	a5,a4,80005692 <iget+0x8a>
    8000565a:	fe843783          	ld	a5,-24(s0)
    8000565e:	43d8                	lw	a4,4(a5)
    80005660:	fd842783          	lw	a5,-40(s0)
    80005664:	2781                	sext.w	a5,a5
    80005666:	02e79663          	bne	a5,a4,80005692 <iget+0x8a>
      ip->ref++;
    8000566a:	fe843783          	ld	a5,-24(s0)
    8000566e:	479c                	lw	a5,8(a5)
    80005670:	2785                	addiw	a5,a5,1
    80005672:	0007871b          	sext.w	a4,a5
    80005676:	fe843783          	ld	a5,-24(s0)
    8000567a:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    8000567c:	0001e517          	auipc	a0,0x1e
    80005680:	96450513          	addi	a0,a0,-1692 # 80022fe0 <itable>
    80005684:	ffffc097          	auipc	ra,0xffffc
    80005688:	c4e080e7          	jalr	-946(ra) # 800012d2 <release>
      return ip;
    8000568c:	fe843783          	ld	a5,-24(s0)
    80005690:	a069                	j	8000571a <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80005692:	fe043783          	ld	a5,-32(s0)
    80005696:	eb89                	bnez	a5,800056a8 <iget+0xa0>
    80005698:	fe843783          	ld	a5,-24(s0)
    8000569c:	479c                	lw	a5,8(a5)
    8000569e:	e789                	bnez	a5,800056a8 <iget+0xa0>
      empty = ip;
    800056a0:	fe843783          	ld	a5,-24(s0)
    800056a4:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800056a8:	fe843783          	ld	a5,-24(s0)
    800056ac:	08878793          	addi	a5,a5,136
    800056b0:	fef43423          	sd	a5,-24(s0)
    800056b4:	fe843703          	ld	a4,-24(s0)
    800056b8:	0001f797          	auipc	a5,0x1f
    800056bc:	3d078793          	addi	a5,a5,976 # 80024a88 <log>
    800056c0:	f8f760e3          	bltu	a4,a5,80005640 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    800056c4:	fe043783          	ld	a5,-32(s0)
    800056c8:	eb89                	bnez	a5,800056da <iget+0xd2>
    panic("iget: no inodes");
    800056ca:	00006517          	auipc	a0,0x6
    800056ce:	dee50513          	addi	a0,a0,-530 # 8000b4b8 <etext+0x4b8>
    800056d2:	ffffb097          	auipc	ra,0xffffb
    800056d6:	5ac080e7          	jalr	1452(ra) # 80000c7e <panic>

  ip = empty;
    800056da:	fe043783          	ld	a5,-32(s0)
    800056de:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    800056e2:	fe843783          	ld	a5,-24(s0)
    800056e6:	fdc42703          	lw	a4,-36(s0)
    800056ea:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    800056ec:	fe843783          	ld	a5,-24(s0)
    800056f0:	fd842703          	lw	a4,-40(s0)
    800056f4:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    800056f6:	fe843783          	ld	a5,-24(s0)
    800056fa:	4705                	li	a4,1
    800056fc:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    800056fe:	fe843783          	ld	a5,-24(s0)
    80005702:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80005706:	0001e517          	auipc	a0,0x1e
    8000570a:	8da50513          	addi	a0,a0,-1830 # 80022fe0 <itable>
    8000570e:	ffffc097          	auipc	ra,0xffffc
    80005712:	bc4080e7          	jalr	-1084(ra) # 800012d2 <release>

  return ip;
    80005716:	fe843783          	ld	a5,-24(s0)
}
    8000571a:	853e                	mv	a0,a5
    8000571c:	70a2                	ld	ra,40(sp)
    8000571e:	7402                	ld	s0,32(sp)
    80005720:	6145                	addi	sp,sp,48
    80005722:	8082                	ret

0000000080005724 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    80005724:	1101                	addi	sp,sp,-32
    80005726:	ec06                	sd	ra,24(sp)
    80005728:	e822                	sd	s0,16(sp)
    8000572a:	1000                	addi	s0,sp,32
    8000572c:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    80005730:	0001e517          	auipc	a0,0x1e
    80005734:	8b050513          	addi	a0,a0,-1872 # 80022fe0 <itable>
    80005738:	ffffc097          	auipc	ra,0xffffc
    8000573c:	b36080e7          	jalr	-1226(ra) # 8000126e <acquire>
  ip->ref++;
    80005740:	fe843783          	ld	a5,-24(s0)
    80005744:	479c                	lw	a5,8(a5)
    80005746:	2785                	addiw	a5,a5,1
    80005748:	0007871b          	sext.w	a4,a5
    8000574c:	fe843783          	ld	a5,-24(s0)
    80005750:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005752:	0001e517          	auipc	a0,0x1e
    80005756:	88e50513          	addi	a0,a0,-1906 # 80022fe0 <itable>
    8000575a:	ffffc097          	auipc	ra,0xffffc
    8000575e:	b78080e7          	jalr	-1160(ra) # 800012d2 <release>
  return ip;
    80005762:	fe843783          	ld	a5,-24(s0)
}
    80005766:	853e                	mv	a0,a5
    80005768:	60e2                	ld	ra,24(sp)
    8000576a:	6442                	ld	s0,16(sp)
    8000576c:	6105                	addi	sp,sp,32
    8000576e:	8082                	ret

0000000080005770 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80005770:	7179                	addi	sp,sp,-48
    80005772:	f406                	sd	ra,40(sp)
    80005774:	f022                	sd	s0,32(sp)
    80005776:	1800                	addi	s0,sp,48
    80005778:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    8000577c:	fd843783          	ld	a5,-40(s0)
    80005780:	c791                	beqz	a5,8000578c <ilock+0x1c>
    80005782:	fd843783          	ld	a5,-40(s0)
    80005786:	479c                	lw	a5,8(a5)
    80005788:	00f04a63          	bgtz	a5,8000579c <ilock+0x2c>
    panic("ilock");
    8000578c:	00006517          	auipc	a0,0x6
    80005790:	d3c50513          	addi	a0,a0,-708 # 8000b4c8 <etext+0x4c8>
    80005794:	ffffb097          	auipc	ra,0xffffb
    80005798:	4ea080e7          	jalr	1258(ra) # 80000c7e <panic>

  acquiresleep(&ip->lock);
    8000579c:	fd843783          	ld	a5,-40(s0)
    800057a0:	07c1                	addi	a5,a5,16
    800057a2:	853e                	mv	a0,a5
    800057a4:	00001097          	auipc	ra,0x1
    800057a8:	484080e7          	jalr	1156(ra) # 80006c28 <acquiresleep>

  if(ip->valid == 0){
    800057ac:	fd843783          	ld	a5,-40(s0)
    800057b0:	43bc                	lw	a5,64(a5)
    800057b2:	e7e5                	bnez	a5,8000589a <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800057b4:	fd843783          	ld	a5,-40(s0)
    800057b8:	4394                	lw	a3,0(a5)
    800057ba:	fd843783          	ld	a5,-40(s0)
    800057be:	43dc                	lw	a5,4(a5)
    800057c0:	0047d79b          	srliw	a5,a5,0x4
    800057c4:	0007871b          	sext.w	a4,a5
    800057c8:	0001d797          	auipc	a5,0x1d
    800057cc:	7f878793          	addi	a5,a5,2040 # 80022fc0 <sb>
    800057d0:	4f9c                	lw	a5,24(a5)
    800057d2:	9fb9                	addw	a5,a5,a4
    800057d4:	2781                	sext.w	a5,a5
    800057d6:	85be                	mv	a1,a5
    800057d8:	8536                	mv	a0,a3
    800057da:	fffff097          	auipc	ra,0xfffff
    800057de:	5ae080e7          	jalr	1454(ra) # 80004d88 <bread>
    800057e2:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    800057e6:	fe843783          	ld	a5,-24(s0)
    800057ea:	05878713          	addi	a4,a5,88
    800057ee:	fd843783          	ld	a5,-40(s0)
    800057f2:	43dc                	lw	a5,4(a5)
    800057f4:	1782                	slli	a5,a5,0x20
    800057f6:	9381                	srli	a5,a5,0x20
    800057f8:	8bbd                	andi	a5,a5,15
    800057fa:	079a                	slli	a5,a5,0x6
    800057fc:	97ba                	add	a5,a5,a4
    800057fe:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    80005802:	fe043783          	ld	a5,-32(s0)
    80005806:	00079703          	lh	a4,0(a5)
    8000580a:	fd843783          	ld	a5,-40(s0)
    8000580e:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    80005812:	fe043783          	ld	a5,-32(s0)
    80005816:	00279703          	lh	a4,2(a5)
    8000581a:	fd843783          	ld	a5,-40(s0)
    8000581e:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    80005822:	fe043783          	ld	a5,-32(s0)
    80005826:	00479703          	lh	a4,4(a5)
    8000582a:	fd843783          	ld	a5,-40(s0)
    8000582e:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    80005832:	fe043783          	ld	a5,-32(s0)
    80005836:	00679703          	lh	a4,6(a5)
    8000583a:	fd843783          	ld	a5,-40(s0)
    8000583e:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    80005842:	fe043783          	ld	a5,-32(s0)
    80005846:	4798                	lw	a4,8(a5)
    80005848:	fd843783          	ld	a5,-40(s0)
    8000584c:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    8000584e:	fd843783          	ld	a5,-40(s0)
    80005852:	05078713          	addi	a4,a5,80
    80005856:	fe043783          	ld	a5,-32(s0)
    8000585a:	07b1                	addi	a5,a5,12
    8000585c:	03400613          	li	a2,52
    80005860:	85be                	mv	a1,a5
    80005862:	853a                	mv	a0,a4
    80005864:	ffffc097          	auipc	ra,0xffffc
    80005868:	cc2080e7          	jalr	-830(ra) # 80001526 <memmove>
    brelse(bp);
    8000586c:	fe843503          	ld	a0,-24(s0)
    80005870:	fffff097          	auipc	ra,0xfffff
    80005874:	5ba080e7          	jalr	1466(ra) # 80004e2a <brelse>
    ip->valid = 1;
    80005878:	fd843783          	ld	a5,-40(s0)
    8000587c:	4705                	li	a4,1
    8000587e:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80005880:	fd843783          	ld	a5,-40(s0)
    80005884:	04479783          	lh	a5,68(a5)
    80005888:	eb89                	bnez	a5,8000589a <ilock+0x12a>
      panic("ilock: no type");
    8000588a:	00006517          	auipc	a0,0x6
    8000588e:	c4650513          	addi	a0,a0,-954 # 8000b4d0 <etext+0x4d0>
    80005892:	ffffb097          	auipc	ra,0xffffb
    80005896:	3ec080e7          	jalr	1004(ra) # 80000c7e <panic>
  }
}
    8000589a:	0001                	nop
    8000589c:	70a2                	ld	ra,40(sp)
    8000589e:	7402                	ld	s0,32(sp)
    800058a0:	6145                	addi	sp,sp,48
    800058a2:	8082                	ret

00000000800058a4 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    800058a4:	1101                	addi	sp,sp,-32
    800058a6:	ec06                	sd	ra,24(sp)
    800058a8:	e822                	sd	s0,16(sp)
    800058aa:	1000                	addi	s0,sp,32
    800058ac:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    800058b0:	fe843783          	ld	a5,-24(s0)
    800058b4:	c385                	beqz	a5,800058d4 <iunlock+0x30>
    800058b6:	fe843783          	ld	a5,-24(s0)
    800058ba:	07c1                	addi	a5,a5,16
    800058bc:	853e                	mv	a0,a5
    800058be:	00001097          	auipc	ra,0x1
    800058c2:	42a080e7          	jalr	1066(ra) # 80006ce8 <holdingsleep>
    800058c6:	87aa                	mv	a5,a0
    800058c8:	c791                	beqz	a5,800058d4 <iunlock+0x30>
    800058ca:	fe843783          	ld	a5,-24(s0)
    800058ce:	479c                	lw	a5,8(a5)
    800058d0:	00f04a63          	bgtz	a5,800058e4 <iunlock+0x40>
    panic("iunlock");
    800058d4:	00006517          	auipc	a0,0x6
    800058d8:	c0c50513          	addi	a0,a0,-1012 # 8000b4e0 <etext+0x4e0>
    800058dc:	ffffb097          	auipc	ra,0xffffb
    800058e0:	3a2080e7          	jalr	930(ra) # 80000c7e <panic>

  releasesleep(&ip->lock);
    800058e4:	fe843783          	ld	a5,-24(s0)
    800058e8:	07c1                	addi	a5,a5,16
    800058ea:	853e                	mv	a0,a5
    800058ec:	00001097          	auipc	ra,0x1
    800058f0:	3aa080e7          	jalr	938(ra) # 80006c96 <releasesleep>
}
    800058f4:	0001                	nop
    800058f6:	60e2                	ld	ra,24(sp)
    800058f8:	6442                	ld	s0,16(sp)
    800058fa:	6105                	addi	sp,sp,32
    800058fc:	8082                	ret

00000000800058fe <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    800058fe:	1101                	addi	sp,sp,-32
    80005900:	ec06                	sd	ra,24(sp)
    80005902:	e822                	sd	s0,16(sp)
    80005904:	1000                	addi	s0,sp,32
    80005906:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    8000590a:	0001d517          	auipc	a0,0x1d
    8000590e:	6d650513          	addi	a0,a0,1750 # 80022fe0 <itable>
    80005912:	ffffc097          	auipc	ra,0xffffc
    80005916:	95c080e7          	jalr	-1700(ra) # 8000126e <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    8000591a:	fe843783          	ld	a5,-24(s0)
    8000591e:	479c                	lw	a5,8(a5)
    80005920:	873e                	mv	a4,a5
    80005922:	4785                	li	a5,1
    80005924:	06f71f63          	bne	a4,a5,800059a2 <iput+0xa4>
    80005928:	fe843783          	ld	a5,-24(s0)
    8000592c:	43bc                	lw	a5,64(a5)
    8000592e:	cbb5                	beqz	a5,800059a2 <iput+0xa4>
    80005930:	fe843783          	ld	a5,-24(s0)
    80005934:	04a79783          	lh	a5,74(a5)
    80005938:	e7ad                	bnez	a5,800059a2 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    8000593a:	fe843783          	ld	a5,-24(s0)
    8000593e:	07c1                	addi	a5,a5,16
    80005940:	853e                	mv	a0,a5
    80005942:	00001097          	auipc	ra,0x1
    80005946:	2e6080e7          	jalr	742(ra) # 80006c28 <acquiresleep>

    release(&itable.lock);
    8000594a:	0001d517          	auipc	a0,0x1d
    8000594e:	69650513          	addi	a0,a0,1686 # 80022fe0 <itable>
    80005952:	ffffc097          	auipc	ra,0xffffc
    80005956:	980080e7          	jalr	-1664(ra) # 800012d2 <release>

    itrunc(ip);
    8000595a:	fe843503          	ld	a0,-24(s0)
    8000595e:	00000097          	auipc	ra,0x0
    80005962:	1fa080e7          	jalr	506(ra) # 80005b58 <itrunc>
    ip->type = 0;
    80005966:	fe843783          	ld	a5,-24(s0)
    8000596a:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    8000596e:	fe843503          	ld	a0,-24(s0)
    80005972:	00000097          	auipc	ra,0x0
    80005976:	bae080e7          	jalr	-1106(ra) # 80005520 <iupdate>
    ip->valid = 0;
    8000597a:	fe843783          	ld	a5,-24(s0)
    8000597e:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    80005982:	fe843783          	ld	a5,-24(s0)
    80005986:	07c1                	addi	a5,a5,16
    80005988:	853e                	mv	a0,a5
    8000598a:	00001097          	auipc	ra,0x1
    8000598e:	30c080e7          	jalr	780(ra) # 80006c96 <releasesleep>

    acquire(&itable.lock);
    80005992:	0001d517          	auipc	a0,0x1d
    80005996:	64e50513          	addi	a0,a0,1614 # 80022fe0 <itable>
    8000599a:	ffffc097          	auipc	ra,0xffffc
    8000599e:	8d4080e7          	jalr	-1836(ra) # 8000126e <acquire>
  }

  ip->ref--;
    800059a2:	fe843783          	ld	a5,-24(s0)
    800059a6:	479c                	lw	a5,8(a5)
    800059a8:	37fd                	addiw	a5,a5,-1
    800059aa:	0007871b          	sext.w	a4,a5
    800059ae:	fe843783          	ld	a5,-24(s0)
    800059b2:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800059b4:	0001d517          	auipc	a0,0x1d
    800059b8:	62c50513          	addi	a0,a0,1580 # 80022fe0 <itable>
    800059bc:	ffffc097          	auipc	ra,0xffffc
    800059c0:	916080e7          	jalr	-1770(ra) # 800012d2 <release>
}
    800059c4:	0001                	nop
    800059c6:	60e2                	ld	ra,24(sp)
    800059c8:	6442                	ld	s0,16(sp)
    800059ca:	6105                	addi	sp,sp,32
    800059cc:	8082                	ret

00000000800059ce <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    800059ce:	1101                	addi	sp,sp,-32
    800059d0:	ec06                	sd	ra,24(sp)
    800059d2:	e822                	sd	s0,16(sp)
    800059d4:	1000                	addi	s0,sp,32
    800059d6:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    800059da:	fe843503          	ld	a0,-24(s0)
    800059de:	00000097          	auipc	ra,0x0
    800059e2:	ec6080e7          	jalr	-314(ra) # 800058a4 <iunlock>
  iput(ip);
    800059e6:	fe843503          	ld	a0,-24(s0)
    800059ea:	00000097          	auipc	ra,0x0
    800059ee:	f14080e7          	jalr	-236(ra) # 800058fe <iput>
}
    800059f2:	0001                	nop
    800059f4:	60e2                	ld	ra,24(sp)
    800059f6:	6442                	ld	s0,16(sp)
    800059f8:	6105                	addi	sp,sp,32
    800059fa:	8082                	ret

00000000800059fc <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
    800059fc:	7139                	addi	sp,sp,-64
    800059fe:	fc06                	sd	ra,56(sp)
    80005a00:	f822                	sd	s0,48(sp)
    80005a02:	0080                	addi	s0,sp,64
    80005a04:	fca43423          	sd	a0,-56(s0)
    80005a08:	87ae                	mv	a5,a1
    80005a0a:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    80005a0e:	fc442783          	lw	a5,-60(s0)
    80005a12:	0007871b          	sext.w	a4,a5
    80005a16:	47ad                	li	a5,11
    80005a18:	04e7e863          	bltu	a5,a4,80005a68 <bmap+0x6c>
    if((addr = ip->addrs[bn]) == 0)
    80005a1c:	fc843703          	ld	a4,-56(s0)
    80005a20:	fc446783          	lwu	a5,-60(s0)
    80005a24:	07d1                	addi	a5,a5,20
    80005a26:	078a                	slli	a5,a5,0x2
    80005a28:	97ba                	add	a5,a5,a4
    80005a2a:	439c                	lw	a5,0(a5)
    80005a2c:	fef42623          	sw	a5,-20(s0)
    80005a30:	fec42783          	lw	a5,-20(s0)
    80005a34:	2781                	sext.w	a5,a5
    80005a36:	e795                	bnez	a5,80005a62 <bmap+0x66>
      ip->addrs[bn] = addr = balloc(ip->dev);
    80005a38:	fc843783          	ld	a5,-56(s0)
    80005a3c:	439c                	lw	a5,0(a5)
    80005a3e:	853e                	mv	a0,a5
    80005a40:	fffff097          	auipc	ra,0xfffff
    80005a44:	692080e7          	jalr	1682(ra) # 800050d2 <balloc>
    80005a48:	87aa                	mv	a5,a0
    80005a4a:	fef42623          	sw	a5,-20(s0)
    80005a4e:	fc843703          	ld	a4,-56(s0)
    80005a52:	fc446783          	lwu	a5,-60(s0)
    80005a56:	07d1                	addi	a5,a5,20
    80005a58:	078a                	slli	a5,a5,0x2
    80005a5a:	97ba                	add	a5,a5,a4
    80005a5c:	fec42703          	lw	a4,-20(s0)
    80005a60:	c398                	sw	a4,0(a5)
    return addr;
    80005a62:	fec42783          	lw	a5,-20(s0)
    80005a66:	a0e5                	j	80005b4e <bmap+0x152>
  }
  bn -= NDIRECT;
    80005a68:	fc442783          	lw	a5,-60(s0)
    80005a6c:	37d1                	addiw	a5,a5,-12
    80005a6e:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    80005a72:	fc442783          	lw	a5,-60(s0)
    80005a76:	0007871b          	sext.w	a4,a5
    80005a7a:	0ff00793          	li	a5,255
    80005a7e:	0ce7e063          	bltu	a5,a4,80005b3e <bmap+0x142>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
    80005a82:	fc843783          	ld	a5,-56(s0)
    80005a86:	0807a783          	lw	a5,128(a5)
    80005a8a:	fef42623          	sw	a5,-20(s0)
    80005a8e:	fec42783          	lw	a5,-20(s0)
    80005a92:	2781                	sext.w	a5,a5
    80005a94:	e395                	bnez	a5,80005ab8 <bmap+0xbc>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    80005a96:	fc843783          	ld	a5,-56(s0)
    80005a9a:	439c                	lw	a5,0(a5)
    80005a9c:	853e                	mv	a0,a5
    80005a9e:	fffff097          	auipc	ra,0xfffff
    80005aa2:	634080e7          	jalr	1588(ra) # 800050d2 <balloc>
    80005aa6:	87aa                	mv	a5,a0
    80005aa8:	fef42623          	sw	a5,-20(s0)
    80005aac:	fc843783          	ld	a5,-56(s0)
    80005ab0:	fec42703          	lw	a4,-20(s0)
    80005ab4:	08e7a023          	sw	a4,128(a5)
    bp = bread(ip->dev, addr);
    80005ab8:	fc843783          	ld	a5,-56(s0)
    80005abc:	439c                	lw	a5,0(a5)
    80005abe:	fec42703          	lw	a4,-20(s0)
    80005ac2:	85ba                	mv	a1,a4
    80005ac4:	853e                	mv	a0,a5
    80005ac6:	fffff097          	auipc	ra,0xfffff
    80005aca:	2c2080e7          	jalr	706(ra) # 80004d88 <bread>
    80005ace:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005ad2:	fe043783          	ld	a5,-32(s0)
    80005ad6:	05878793          	addi	a5,a5,88
    80005ada:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80005ade:	fc446783          	lwu	a5,-60(s0)
    80005ae2:	078a                	slli	a5,a5,0x2
    80005ae4:	fd843703          	ld	a4,-40(s0)
    80005ae8:	97ba                	add	a5,a5,a4
    80005aea:	439c                	lw	a5,0(a5)
    80005aec:	fef42623          	sw	a5,-20(s0)
    80005af0:	fec42783          	lw	a5,-20(s0)
    80005af4:	2781                	sext.w	a5,a5
    80005af6:	eb9d                	bnez	a5,80005b2c <bmap+0x130>
      a[bn] = addr = balloc(ip->dev);
    80005af8:	fc843783          	ld	a5,-56(s0)
    80005afc:	439c                	lw	a5,0(a5)
    80005afe:	853e                	mv	a0,a5
    80005b00:	fffff097          	auipc	ra,0xfffff
    80005b04:	5d2080e7          	jalr	1490(ra) # 800050d2 <balloc>
    80005b08:	87aa                	mv	a5,a0
    80005b0a:	fef42623          	sw	a5,-20(s0)
    80005b0e:	fc446783          	lwu	a5,-60(s0)
    80005b12:	078a                	slli	a5,a5,0x2
    80005b14:	fd843703          	ld	a4,-40(s0)
    80005b18:	97ba                	add	a5,a5,a4
    80005b1a:	fec42703          	lw	a4,-20(s0)
    80005b1e:	c398                	sw	a4,0(a5)
      log_write(bp);
    80005b20:	fe043503          	ld	a0,-32(s0)
    80005b24:	00001097          	auipc	ra,0x1
    80005b28:	f84080e7          	jalr	-124(ra) # 80006aa8 <log_write>
    }
    brelse(bp);
    80005b2c:	fe043503          	ld	a0,-32(s0)
    80005b30:	fffff097          	auipc	ra,0xfffff
    80005b34:	2fa080e7          	jalr	762(ra) # 80004e2a <brelse>
    return addr;
    80005b38:	fec42783          	lw	a5,-20(s0)
    80005b3c:	a809                	j	80005b4e <bmap+0x152>
  }

  panic("bmap: out of range");
    80005b3e:	00006517          	auipc	a0,0x6
    80005b42:	9aa50513          	addi	a0,a0,-1622 # 8000b4e8 <etext+0x4e8>
    80005b46:	ffffb097          	auipc	ra,0xffffb
    80005b4a:	138080e7          	jalr	312(ra) # 80000c7e <panic>
}
    80005b4e:	853e                	mv	a0,a5
    80005b50:	70e2                	ld	ra,56(sp)
    80005b52:	7442                	ld	s0,48(sp)
    80005b54:	6121                	addi	sp,sp,64
    80005b56:	8082                	ret

0000000080005b58 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    80005b58:	7139                	addi	sp,sp,-64
    80005b5a:	fc06                	sd	ra,56(sp)
    80005b5c:	f822                	sd	s0,48(sp)
    80005b5e:	0080                	addi	s0,sp,64
    80005b60:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005b64:	fe042623          	sw	zero,-20(s0)
    80005b68:	a899                	j	80005bbe <itrunc+0x66>
    if(ip->addrs[i]){
    80005b6a:	fc843703          	ld	a4,-56(s0)
    80005b6e:	fec42783          	lw	a5,-20(s0)
    80005b72:	07d1                	addi	a5,a5,20
    80005b74:	078a                	slli	a5,a5,0x2
    80005b76:	97ba                	add	a5,a5,a4
    80005b78:	439c                	lw	a5,0(a5)
    80005b7a:	cf8d                	beqz	a5,80005bb4 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    80005b7c:	fc843783          	ld	a5,-56(s0)
    80005b80:	439c                	lw	a5,0(a5)
    80005b82:	0007869b          	sext.w	a3,a5
    80005b86:	fc843703          	ld	a4,-56(s0)
    80005b8a:	fec42783          	lw	a5,-20(s0)
    80005b8e:	07d1                	addi	a5,a5,20
    80005b90:	078a                	slli	a5,a5,0x2
    80005b92:	97ba                	add	a5,a5,a4
    80005b94:	439c                	lw	a5,0(a5)
    80005b96:	85be                	mv	a1,a5
    80005b98:	8536                	mv	a0,a3
    80005b9a:	fffff097          	auipc	ra,0xfffff
    80005b9e:	6e6080e7          	jalr	1766(ra) # 80005280 <bfree>
      ip->addrs[i] = 0;
    80005ba2:	fc843703          	ld	a4,-56(s0)
    80005ba6:	fec42783          	lw	a5,-20(s0)
    80005baa:	07d1                	addi	a5,a5,20
    80005bac:	078a                	slli	a5,a5,0x2
    80005bae:	97ba                	add	a5,a5,a4
    80005bb0:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005bb4:	fec42783          	lw	a5,-20(s0)
    80005bb8:	2785                	addiw	a5,a5,1
    80005bba:	fef42623          	sw	a5,-20(s0)
    80005bbe:	fec42783          	lw	a5,-20(s0)
    80005bc2:	0007871b          	sext.w	a4,a5
    80005bc6:	47ad                	li	a5,11
    80005bc8:	fae7d1e3          	bge	a5,a4,80005b6a <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    80005bcc:	fc843783          	ld	a5,-56(s0)
    80005bd0:	0807a783          	lw	a5,128(a5)
    80005bd4:	cbc5                	beqz	a5,80005c84 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005bd6:	fc843783          	ld	a5,-56(s0)
    80005bda:	4398                	lw	a4,0(a5)
    80005bdc:	fc843783          	ld	a5,-56(s0)
    80005be0:	0807a783          	lw	a5,128(a5)
    80005be4:	85be                	mv	a1,a5
    80005be6:	853a                	mv	a0,a4
    80005be8:	fffff097          	auipc	ra,0xfffff
    80005bec:	1a0080e7          	jalr	416(ra) # 80004d88 <bread>
    80005bf0:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005bf4:	fe043783          	ld	a5,-32(s0)
    80005bf8:	05878793          	addi	a5,a5,88
    80005bfc:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80005c00:	fe042423          	sw	zero,-24(s0)
    80005c04:	a081                	j	80005c44 <itrunc+0xec>
      if(a[j])
    80005c06:	fe842783          	lw	a5,-24(s0)
    80005c0a:	078a                	slli	a5,a5,0x2
    80005c0c:	fd843703          	ld	a4,-40(s0)
    80005c10:	97ba                	add	a5,a5,a4
    80005c12:	439c                	lw	a5,0(a5)
    80005c14:	c39d                	beqz	a5,80005c3a <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    80005c16:	fc843783          	ld	a5,-56(s0)
    80005c1a:	439c                	lw	a5,0(a5)
    80005c1c:	0007869b          	sext.w	a3,a5
    80005c20:	fe842783          	lw	a5,-24(s0)
    80005c24:	078a                	slli	a5,a5,0x2
    80005c26:	fd843703          	ld	a4,-40(s0)
    80005c2a:	97ba                	add	a5,a5,a4
    80005c2c:	439c                	lw	a5,0(a5)
    80005c2e:	85be                	mv	a1,a5
    80005c30:	8536                	mv	a0,a3
    80005c32:	fffff097          	auipc	ra,0xfffff
    80005c36:	64e080e7          	jalr	1614(ra) # 80005280 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    80005c3a:	fe842783          	lw	a5,-24(s0)
    80005c3e:	2785                	addiw	a5,a5,1
    80005c40:	fef42423          	sw	a5,-24(s0)
    80005c44:	fe842783          	lw	a5,-24(s0)
    80005c48:	873e                	mv	a4,a5
    80005c4a:	0ff00793          	li	a5,255
    80005c4e:	fae7fce3          	bgeu	a5,a4,80005c06 <itrunc+0xae>
    }
    brelse(bp);
    80005c52:	fe043503          	ld	a0,-32(s0)
    80005c56:	fffff097          	auipc	ra,0xfffff
    80005c5a:	1d4080e7          	jalr	468(ra) # 80004e2a <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    80005c5e:	fc843783          	ld	a5,-56(s0)
    80005c62:	439c                	lw	a5,0(a5)
    80005c64:	0007871b          	sext.w	a4,a5
    80005c68:	fc843783          	ld	a5,-56(s0)
    80005c6c:	0807a783          	lw	a5,128(a5)
    80005c70:	85be                	mv	a1,a5
    80005c72:	853a                	mv	a0,a4
    80005c74:	fffff097          	auipc	ra,0xfffff
    80005c78:	60c080e7          	jalr	1548(ra) # 80005280 <bfree>
    ip->addrs[NDIRECT] = 0;
    80005c7c:	fc843783          	ld	a5,-56(s0)
    80005c80:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005c84:	fc843783          	ld	a5,-56(s0)
    80005c88:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    80005c8c:	fc843503          	ld	a0,-56(s0)
    80005c90:	00000097          	auipc	ra,0x0
    80005c94:	890080e7          	jalr	-1904(ra) # 80005520 <iupdate>
}
    80005c98:	0001                	nop
    80005c9a:	70e2                	ld	ra,56(sp)
    80005c9c:	7442                	ld	s0,48(sp)
    80005c9e:	6121                	addi	sp,sp,64
    80005ca0:	8082                	ret

0000000080005ca2 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005ca2:	1101                	addi	sp,sp,-32
    80005ca4:	ec22                	sd	s0,24(sp)
    80005ca6:	1000                	addi	s0,sp,32
    80005ca8:	fea43423          	sd	a0,-24(s0)
    80005cac:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005cb0:	fe843783          	ld	a5,-24(s0)
    80005cb4:	439c                	lw	a5,0(a5)
    80005cb6:	0007871b          	sext.w	a4,a5
    80005cba:	fe043783          	ld	a5,-32(s0)
    80005cbe:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005cc0:	fe843783          	ld	a5,-24(s0)
    80005cc4:	43d8                	lw	a4,4(a5)
    80005cc6:	fe043783          	ld	a5,-32(s0)
    80005cca:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    80005ccc:	fe843783          	ld	a5,-24(s0)
    80005cd0:	04479703          	lh	a4,68(a5)
    80005cd4:	fe043783          	ld	a5,-32(s0)
    80005cd8:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    80005cdc:	fe843783          	ld	a5,-24(s0)
    80005ce0:	04a79703          	lh	a4,74(a5)
    80005ce4:	fe043783          	ld	a5,-32(s0)
    80005ce8:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    80005cec:	fe843783          	ld	a5,-24(s0)
    80005cf0:	47fc                	lw	a5,76(a5)
    80005cf2:	02079713          	slli	a4,a5,0x20
    80005cf6:	9301                	srli	a4,a4,0x20
    80005cf8:	fe043783          	ld	a5,-32(s0)
    80005cfc:	eb98                	sd	a4,16(a5)
}
    80005cfe:	0001                	nop
    80005d00:	6462                	ld	s0,24(sp)
    80005d02:	6105                	addi	sp,sp,32
    80005d04:	8082                	ret

0000000080005d06 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80005d06:	711d                	addi	sp,sp,-96
    80005d08:	ec86                	sd	ra,88(sp)
    80005d0a:	e8a2                	sd	s0,80(sp)
    80005d0c:	e4a6                	sd	s1,72(sp)
    80005d0e:	1080                	addi	s0,sp,96
    80005d10:	faa43c23          	sd	a0,-72(s0)
    80005d14:	87ae                	mv	a5,a1
    80005d16:	fac43423          	sd	a2,-88(s0)
    80005d1a:	faf42a23          	sw	a5,-76(s0)
    80005d1e:	87b6                	mv	a5,a3
    80005d20:	faf42823          	sw	a5,-80(s0)
    80005d24:	87ba                	mv	a5,a4
    80005d26:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005d2a:	fb843783          	ld	a5,-72(s0)
    80005d2e:	47f8                	lw	a4,76(a5)
    80005d30:	fb042783          	lw	a5,-80(s0)
    80005d34:	2781                	sext.w	a5,a5
    80005d36:	00f76e63          	bltu	a4,a5,80005d52 <readi+0x4c>
    80005d3a:	fb042703          	lw	a4,-80(s0)
    80005d3e:	fa442783          	lw	a5,-92(s0)
    80005d42:	9fb9                	addw	a5,a5,a4
    80005d44:	0007871b          	sext.w	a4,a5
    80005d48:	fb042783          	lw	a5,-80(s0)
    80005d4c:	2781                	sext.w	a5,a5
    80005d4e:	00f77463          	bgeu	a4,a5,80005d56 <readi+0x50>
    return 0;
    80005d52:	4781                	li	a5,0
    80005d54:	aa05                	j	80005e84 <readi+0x17e>
  if(off + n > ip->size)
    80005d56:	fb042703          	lw	a4,-80(s0)
    80005d5a:	fa442783          	lw	a5,-92(s0)
    80005d5e:	9fb9                	addw	a5,a5,a4
    80005d60:	0007871b          	sext.w	a4,a5
    80005d64:	fb843783          	ld	a5,-72(s0)
    80005d68:	47fc                	lw	a5,76(a5)
    80005d6a:	00e7fb63          	bgeu	a5,a4,80005d80 <readi+0x7a>
    n = ip->size - off;
    80005d6e:	fb843783          	ld	a5,-72(s0)
    80005d72:	47f8                	lw	a4,76(a5)
    80005d74:	fb042783          	lw	a5,-80(s0)
    80005d78:	40f707bb          	subw	a5,a4,a5
    80005d7c:	faf42223          	sw	a5,-92(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005d80:	fc042e23          	sw	zero,-36(s0)
    80005d84:	a0f5                	j	80005e70 <readi+0x16a>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005d86:	fb843783          	ld	a5,-72(s0)
    80005d8a:	4384                	lw	s1,0(a5)
    80005d8c:	fb042783          	lw	a5,-80(s0)
    80005d90:	00a7d79b          	srliw	a5,a5,0xa
    80005d94:	2781                	sext.w	a5,a5
    80005d96:	85be                	mv	a1,a5
    80005d98:	fb843503          	ld	a0,-72(s0)
    80005d9c:	00000097          	auipc	ra,0x0
    80005da0:	c60080e7          	jalr	-928(ra) # 800059fc <bmap>
    80005da4:	87aa                	mv	a5,a0
    80005da6:	2781                	sext.w	a5,a5
    80005da8:	85be                	mv	a1,a5
    80005daa:	8526                	mv	a0,s1
    80005dac:	fffff097          	auipc	ra,0xfffff
    80005db0:	fdc080e7          	jalr	-36(ra) # 80004d88 <bread>
    80005db4:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005db8:	fb042783          	lw	a5,-80(s0)
    80005dbc:	3ff7f793          	andi	a5,a5,1023
    80005dc0:	2781                	sext.w	a5,a5
    80005dc2:	40000713          	li	a4,1024
    80005dc6:	40f707bb          	subw	a5,a4,a5
    80005dca:	0007869b          	sext.w	a3,a5
    80005dce:	fa442703          	lw	a4,-92(s0)
    80005dd2:	fdc42783          	lw	a5,-36(s0)
    80005dd6:	40f707bb          	subw	a5,a4,a5
    80005dda:	2781                	sext.w	a5,a5
    80005ddc:	863e                	mv	a2,a5
    80005dde:	87b6                	mv	a5,a3
    80005de0:	0007869b          	sext.w	a3,a5
    80005de4:	0006071b          	sext.w	a4,a2
    80005de8:	00d77363          	bgeu	a4,a3,80005dee <readi+0xe8>
    80005dec:	87b2                	mv	a5,a2
    80005dee:	fcf42623          	sw	a5,-52(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005df2:	fd043783          	ld	a5,-48(s0)
    80005df6:	05878713          	addi	a4,a5,88
    80005dfa:	fb046783          	lwu	a5,-80(s0)
    80005dfe:	3ff7f793          	andi	a5,a5,1023
    80005e02:	973e                	add	a4,a4,a5
    80005e04:	fcc46683          	lwu	a3,-52(s0)
    80005e08:	fb442783          	lw	a5,-76(s0)
    80005e0c:	863a                	mv	a2,a4
    80005e0e:	fa843583          	ld	a1,-88(s0)
    80005e12:	853e                	mv	a0,a5
    80005e14:	ffffe097          	auipc	ra,0xffffe
    80005e18:	d14080e7          	jalr	-748(ra) # 80003b28 <either_copyout>
    80005e1c:	87aa                	mv	a5,a0
    80005e1e:	873e                	mv	a4,a5
    80005e20:	57fd                	li	a5,-1
    80005e22:	00f71c63          	bne	a4,a5,80005e3a <readi+0x134>
      brelse(bp);
    80005e26:	fd043503          	ld	a0,-48(s0)
    80005e2a:	fffff097          	auipc	ra,0xfffff
    80005e2e:	000080e7          	jalr	ra # 80004e2a <brelse>
      tot = -1;
    80005e32:	57fd                	li	a5,-1
    80005e34:	fcf42e23          	sw	a5,-36(s0)
      break;
    80005e38:	a0a1                	j	80005e80 <readi+0x17a>
    }
    brelse(bp);
    80005e3a:	fd043503          	ld	a0,-48(s0)
    80005e3e:	fffff097          	auipc	ra,0xfffff
    80005e42:	fec080e7          	jalr	-20(ra) # 80004e2a <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005e46:	fdc42703          	lw	a4,-36(s0)
    80005e4a:	fcc42783          	lw	a5,-52(s0)
    80005e4e:	9fb9                	addw	a5,a5,a4
    80005e50:	fcf42e23          	sw	a5,-36(s0)
    80005e54:	fb042703          	lw	a4,-80(s0)
    80005e58:	fcc42783          	lw	a5,-52(s0)
    80005e5c:	9fb9                	addw	a5,a5,a4
    80005e5e:	faf42823          	sw	a5,-80(s0)
    80005e62:	fcc46783          	lwu	a5,-52(s0)
    80005e66:	fa843703          	ld	a4,-88(s0)
    80005e6a:	97ba                	add	a5,a5,a4
    80005e6c:	faf43423          	sd	a5,-88(s0)
    80005e70:	fdc42703          	lw	a4,-36(s0)
    80005e74:	fa442783          	lw	a5,-92(s0)
    80005e78:	2701                	sext.w	a4,a4
    80005e7a:	2781                	sext.w	a5,a5
    80005e7c:	f0f765e3          	bltu	a4,a5,80005d86 <readi+0x80>
  }
  return tot;
    80005e80:	fdc42783          	lw	a5,-36(s0)
}
    80005e84:	853e                	mv	a0,a5
    80005e86:	60e6                	ld	ra,88(sp)
    80005e88:	6446                	ld	s0,80(sp)
    80005e8a:	64a6                	ld	s1,72(sp)
    80005e8c:	6125                	addi	sp,sp,96
    80005e8e:	8082                	ret

0000000080005e90 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005e90:	711d                	addi	sp,sp,-96
    80005e92:	ec86                	sd	ra,88(sp)
    80005e94:	e8a2                	sd	s0,80(sp)
    80005e96:	e4a6                	sd	s1,72(sp)
    80005e98:	1080                	addi	s0,sp,96
    80005e9a:	faa43c23          	sd	a0,-72(s0)
    80005e9e:	87ae                	mv	a5,a1
    80005ea0:	fac43423          	sd	a2,-88(s0)
    80005ea4:	faf42a23          	sw	a5,-76(s0)
    80005ea8:	87b6                	mv	a5,a3
    80005eaa:	faf42823          	sw	a5,-80(s0)
    80005eae:	87ba                	mv	a5,a4
    80005eb0:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005eb4:	fb843783          	ld	a5,-72(s0)
    80005eb8:	47f8                	lw	a4,76(a5)
    80005eba:	fb042783          	lw	a5,-80(s0)
    80005ebe:	2781                	sext.w	a5,a5
    80005ec0:	00f76e63          	bltu	a4,a5,80005edc <writei+0x4c>
    80005ec4:	fb042703          	lw	a4,-80(s0)
    80005ec8:	fa442783          	lw	a5,-92(s0)
    80005ecc:	9fb9                	addw	a5,a5,a4
    80005ece:	0007871b          	sext.w	a4,a5
    80005ed2:	fb042783          	lw	a5,-80(s0)
    80005ed6:	2781                	sext.w	a5,a5
    80005ed8:	00f77463          	bgeu	a4,a5,80005ee0 <writei+0x50>
    return -1;
    80005edc:	57fd                	li	a5,-1
    80005ede:	a2b1                	j	8000602a <writei+0x19a>
  if(off + n > MAXFILE*BSIZE)
    80005ee0:	fb042703          	lw	a4,-80(s0)
    80005ee4:	fa442783          	lw	a5,-92(s0)
    80005ee8:	9fb9                	addw	a5,a5,a4
    80005eea:	2781                	sext.w	a5,a5
    80005eec:	873e                	mv	a4,a5
    80005eee:	000437b7          	lui	a5,0x43
    80005ef2:	00e7f463          	bgeu	a5,a4,80005efa <writei+0x6a>
    return -1;
    80005ef6:	57fd                	li	a5,-1
    80005ef8:	aa0d                	j	8000602a <writei+0x19a>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005efa:	fc042e23          	sw	zero,-36(s0)
    80005efe:	a8cd                	j	80005ff0 <writei+0x160>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005f00:	fb843783          	ld	a5,-72(s0)
    80005f04:	4384                	lw	s1,0(a5)
    80005f06:	fb042783          	lw	a5,-80(s0)
    80005f0a:	00a7d79b          	srliw	a5,a5,0xa
    80005f0e:	2781                	sext.w	a5,a5
    80005f10:	85be                	mv	a1,a5
    80005f12:	fb843503          	ld	a0,-72(s0)
    80005f16:	00000097          	auipc	ra,0x0
    80005f1a:	ae6080e7          	jalr	-1306(ra) # 800059fc <bmap>
    80005f1e:	87aa                	mv	a5,a0
    80005f20:	2781                	sext.w	a5,a5
    80005f22:	85be                	mv	a1,a5
    80005f24:	8526                	mv	a0,s1
    80005f26:	fffff097          	auipc	ra,0xfffff
    80005f2a:	e62080e7          	jalr	-414(ra) # 80004d88 <bread>
    80005f2e:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005f32:	fb042783          	lw	a5,-80(s0)
    80005f36:	3ff7f793          	andi	a5,a5,1023
    80005f3a:	2781                	sext.w	a5,a5
    80005f3c:	40000713          	li	a4,1024
    80005f40:	40f707bb          	subw	a5,a4,a5
    80005f44:	0007869b          	sext.w	a3,a5
    80005f48:	fa442703          	lw	a4,-92(s0)
    80005f4c:	fdc42783          	lw	a5,-36(s0)
    80005f50:	40f707bb          	subw	a5,a4,a5
    80005f54:	2781                	sext.w	a5,a5
    80005f56:	863e                	mv	a2,a5
    80005f58:	87b6                	mv	a5,a3
    80005f5a:	0007869b          	sext.w	a3,a5
    80005f5e:	0006071b          	sext.w	a4,a2
    80005f62:	00d77363          	bgeu	a4,a3,80005f68 <writei+0xd8>
    80005f66:	87b2                	mv	a5,a2
    80005f68:	fcf42623          	sw	a5,-52(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005f6c:	fd043783          	ld	a5,-48(s0)
    80005f70:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005f74:	fb046783          	lwu	a5,-80(s0)
    80005f78:	3ff7f793          	andi	a5,a5,1023
    80005f7c:	97ba                	add	a5,a5,a4
    80005f7e:	fcc46683          	lwu	a3,-52(s0)
    80005f82:	fb442703          	lw	a4,-76(s0)
    80005f86:	fa843603          	ld	a2,-88(s0)
    80005f8a:	85ba                	mv	a1,a4
    80005f8c:	853e                	mv	a0,a5
    80005f8e:	ffffe097          	auipc	ra,0xffffe
    80005f92:	c0e080e7          	jalr	-1010(ra) # 80003b9c <either_copyin>
    80005f96:	87aa                	mv	a5,a0
    80005f98:	873e                	mv	a4,a5
    80005f9a:	57fd                	li	a5,-1
    80005f9c:	00f71963          	bne	a4,a5,80005fae <writei+0x11e>
      brelse(bp);
    80005fa0:	fd043503          	ld	a0,-48(s0)
    80005fa4:	fffff097          	auipc	ra,0xfffff
    80005fa8:	e86080e7          	jalr	-378(ra) # 80004e2a <brelse>
      break;
    80005fac:	a891                	j	80006000 <writei+0x170>
    }
    log_write(bp);
    80005fae:	fd043503          	ld	a0,-48(s0)
    80005fb2:	00001097          	auipc	ra,0x1
    80005fb6:	af6080e7          	jalr	-1290(ra) # 80006aa8 <log_write>
    brelse(bp);
    80005fba:	fd043503          	ld	a0,-48(s0)
    80005fbe:	fffff097          	auipc	ra,0xfffff
    80005fc2:	e6c080e7          	jalr	-404(ra) # 80004e2a <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005fc6:	fdc42703          	lw	a4,-36(s0)
    80005fca:	fcc42783          	lw	a5,-52(s0)
    80005fce:	9fb9                	addw	a5,a5,a4
    80005fd0:	fcf42e23          	sw	a5,-36(s0)
    80005fd4:	fb042703          	lw	a4,-80(s0)
    80005fd8:	fcc42783          	lw	a5,-52(s0)
    80005fdc:	9fb9                	addw	a5,a5,a4
    80005fde:	faf42823          	sw	a5,-80(s0)
    80005fe2:	fcc46783          	lwu	a5,-52(s0)
    80005fe6:	fa843703          	ld	a4,-88(s0)
    80005fea:	97ba                	add	a5,a5,a4
    80005fec:	faf43423          	sd	a5,-88(s0)
    80005ff0:	fdc42703          	lw	a4,-36(s0)
    80005ff4:	fa442783          	lw	a5,-92(s0)
    80005ff8:	2701                	sext.w	a4,a4
    80005ffa:	2781                	sext.w	a5,a5
    80005ffc:	f0f762e3          	bltu	a4,a5,80005f00 <writei+0x70>
  }

  if(off > ip->size)
    80006000:	fb843783          	ld	a5,-72(s0)
    80006004:	47f8                	lw	a4,76(a5)
    80006006:	fb042783          	lw	a5,-80(s0)
    8000600a:	2781                	sext.w	a5,a5
    8000600c:	00f77763          	bgeu	a4,a5,8000601a <writei+0x18a>
    ip->size = off;
    80006010:	fb843783          	ld	a5,-72(s0)
    80006014:	fb042703          	lw	a4,-80(s0)
    80006018:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    8000601a:	fb843503          	ld	a0,-72(s0)
    8000601e:	fffff097          	auipc	ra,0xfffff
    80006022:	502080e7          	jalr	1282(ra) # 80005520 <iupdate>

  return tot;
    80006026:	fdc42783          	lw	a5,-36(s0)
}
    8000602a:	853e                	mv	a0,a5
    8000602c:	60e6                	ld	ra,88(sp)
    8000602e:	6446                	ld	s0,80(sp)
    80006030:	64a6                	ld	s1,72(sp)
    80006032:	6125                	addi	sp,sp,96
    80006034:	8082                	ret

0000000080006036 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80006036:	1101                	addi	sp,sp,-32
    80006038:	ec06                	sd	ra,24(sp)
    8000603a:	e822                	sd	s0,16(sp)
    8000603c:	1000                	addi	s0,sp,32
    8000603e:	fea43423          	sd	a0,-24(s0)
    80006042:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80006046:	4639                	li	a2,14
    80006048:	fe043583          	ld	a1,-32(s0)
    8000604c:	fe843503          	ld	a0,-24(s0)
    80006050:	ffffb097          	auipc	ra,0xffffb
    80006054:	5ea080e7          	jalr	1514(ra) # 8000163a <strncmp>
    80006058:	87aa                	mv	a5,a0
}
    8000605a:	853e                	mv	a0,a5
    8000605c:	60e2                	ld	ra,24(sp)
    8000605e:	6442                	ld	s0,16(sp)
    80006060:	6105                	addi	sp,sp,32
    80006062:	8082                	ret

0000000080006064 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80006064:	715d                	addi	sp,sp,-80
    80006066:	e486                	sd	ra,72(sp)
    80006068:	e0a2                	sd	s0,64(sp)
    8000606a:	0880                	addi	s0,sp,80
    8000606c:	fca43423          	sd	a0,-56(s0)
    80006070:	fcb43023          	sd	a1,-64(s0)
    80006074:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80006078:	fc843783          	ld	a5,-56(s0)
    8000607c:	04479783          	lh	a5,68(a5)
    80006080:	0007871b          	sext.w	a4,a5
    80006084:	4785                	li	a5,1
    80006086:	00f70a63          	beq	a4,a5,8000609a <dirlookup+0x36>
    panic("dirlookup not DIR");
    8000608a:	00005517          	auipc	a0,0x5
    8000608e:	47650513          	addi	a0,a0,1142 # 8000b500 <etext+0x500>
    80006092:	ffffb097          	auipc	ra,0xffffb
    80006096:	bec080e7          	jalr	-1044(ra) # 80000c7e <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    8000609a:	fe042623          	sw	zero,-20(s0)
    8000609e:	a849                	j	80006130 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    800060a0:	fd840793          	addi	a5,s0,-40
    800060a4:	fec42683          	lw	a3,-20(s0)
    800060a8:	4741                	li	a4,16
    800060aa:	863e                	mv	a2,a5
    800060ac:	4581                	li	a1,0
    800060ae:	fc843503          	ld	a0,-56(s0)
    800060b2:	00000097          	auipc	ra,0x0
    800060b6:	c54080e7          	jalr	-940(ra) # 80005d06 <readi>
    800060ba:	87aa                	mv	a5,a0
    800060bc:	873e                	mv	a4,a5
    800060be:	47c1                	li	a5,16
    800060c0:	00f70a63          	beq	a4,a5,800060d4 <dirlookup+0x70>
      panic("dirlookup read");
    800060c4:	00005517          	auipc	a0,0x5
    800060c8:	45450513          	addi	a0,a0,1108 # 8000b518 <etext+0x518>
    800060cc:	ffffb097          	auipc	ra,0xffffb
    800060d0:	bb2080e7          	jalr	-1102(ra) # 80000c7e <panic>
    if(de.inum == 0)
    800060d4:	fd845783          	lhu	a5,-40(s0)
    800060d8:	c7b1                	beqz	a5,80006124 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    800060da:	fd840793          	addi	a5,s0,-40
    800060de:	0789                	addi	a5,a5,2
    800060e0:	85be                	mv	a1,a5
    800060e2:	fc043503          	ld	a0,-64(s0)
    800060e6:	00000097          	auipc	ra,0x0
    800060ea:	f50080e7          	jalr	-176(ra) # 80006036 <namecmp>
    800060ee:	87aa                	mv	a5,a0
    800060f0:	eb9d                	bnez	a5,80006126 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    800060f2:	fb843783          	ld	a5,-72(s0)
    800060f6:	c791                	beqz	a5,80006102 <dirlookup+0x9e>
        *poff = off;
    800060f8:	fb843783          	ld	a5,-72(s0)
    800060fc:	fec42703          	lw	a4,-20(s0)
    80006100:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80006102:	fd845783          	lhu	a5,-40(s0)
    80006106:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    8000610a:	fc843783          	ld	a5,-56(s0)
    8000610e:	439c                	lw	a5,0(a5)
    80006110:	fe842703          	lw	a4,-24(s0)
    80006114:	85ba                	mv	a1,a4
    80006116:	853e                	mv	a0,a5
    80006118:	fffff097          	auipc	ra,0xfffff
    8000611c:	4f0080e7          	jalr	1264(ra) # 80005608 <iget>
    80006120:	87aa                	mv	a5,a0
    80006122:	a005                	j	80006142 <dirlookup+0xde>
      continue;
    80006124:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80006126:	fec42783          	lw	a5,-20(s0)
    8000612a:	27c1                	addiw	a5,a5,16
    8000612c:	fef42623          	sw	a5,-20(s0)
    80006130:	fc843783          	ld	a5,-56(s0)
    80006134:	47f8                	lw	a4,76(a5)
    80006136:	fec42783          	lw	a5,-20(s0)
    8000613a:	2781                	sext.w	a5,a5
    8000613c:	f6e7e2e3          	bltu	a5,a4,800060a0 <dirlookup+0x3c>
    }
  }

  return 0;
    80006140:	4781                	li	a5,0
}
    80006142:	853e                	mv	a0,a5
    80006144:	60a6                	ld	ra,72(sp)
    80006146:	6406                	ld	s0,64(sp)
    80006148:	6161                	addi	sp,sp,80
    8000614a:	8082                	ret

000000008000614c <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
    8000614c:	715d                	addi	sp,sp,-80
    8000614e:	e486                	sd	ra,72(sp)
    80006150:	e0a2                	sd	s0,64(sp)
    80006152:	0880                	addi	s0,sp,80
    80006154:	fca43423          	sd	a0,-56(s0)
    80006158:	fcb43023          	sd	a1,-64(s0)
    8000615c:	87b2                	mv	a5,a2
    8000615e:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80006162:	4601                	li	a2,0
    80006164:	fc043583          	ld	a1,-64(s0)
    80006168:	fc843503          	ld	a0,-56(s0)
    8000616c:	00000097          	auipc	ra,0x0
    80006170:	ef8080e7          	jalr	-264(ra) # 80006064 <dirlookup>
    80006174:	fea43023          	sd	a0,-32(s0)
    80006178:	fe043783          	ld	a5,-32(s0)
    8000617c:	cb89                	beqz	a5,8000618e <dirlink+0x42>
    iput(ip);
    8000617e:	fe043503          	ld	a0,-32(s0)
    80006182:	fffff097          	auipc	ra,0xfffff
    80006186:	77c080e7          	jalr	1916(ra) # 800058fe <iput>
    return -1;
    8000618a:	57fd                	li	a5,-1
    8000618c:	a865                	j	80006244 <dirlink+0xf8>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    8000618e:	fe042623          	sw	zero,-20(s0)
    80006192:	a0a1                	j	800061da <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80006194:	fd040793          	addi	a5,s0,-48
    80006198:	fec42683          	lw	a3,-20(s0)
    8000619c:	4741                	li	a4,16
    8000619e:	863e                	mv	a2,a5
    800061a0:	4581                	li	a1,0
    800061a2:	fc843503          	ld	a0,-56(s0)
    800061a6:	00000097          	auipc	ra,0x0
    800061aa:	b60080e7          	jalr	-1184(ra) # 80005d06 <readi>
    800061ae:	87aa                	mv	a5,a0
    800061b0:	873e                	mv	a4,a5
    800061b2:	47c1                	li	a5,16
    800061b4:	00f70a63          	beq	a4,a5,800061c8 <dirlink+0x7c>
      panic("dirlink read");
    800061b8:	00005517          	auipc	a0,0x5
    800061bc:	37050513          	addi	a0,a0,880 # 8000b528 <etext+0x528>
    800061c0:	ffffb097          	auipc	ra,0xffffb
    800061c4:	abe080e7          	jalr	-1346(ra) # 80000c7e <panic>
    if(de.inum == 0)
    800061c8:	fd045783          	lhu	a5,-48(s0)
    800061cc:	cf99                	beqz	a5,800061ea <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    800061ce:	fec42783          	lw	a5,-20(s0)
    800061d2:	27c1                	addiw	a5,a5,16
    800061d4:	2781                	sext.w	a5,a5
    800061d6:	fef42623          	sw	a5,-20(s0)
    800061da:	fc843783          	ld	a5,-56(s0)
    800061de:	47f8                	lw	a4,76(a5)
    800061e0:	fec42783          	lw	a5,-20(s0)
    800061e4:	fae7e8e3          	bltu	a5,a4,80006194 <dirlink+0x48>
    800061e8:	a011                	j	800061ec <dirlink+0xa0>
      break;
    800061ea:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    800061ec:	fd040793          	addi	a5,s0,-48
    800061f0:	0789                	addi	a5,a5,2
    800061f2:	4639                	li	a2,14
    800061f4:	fc043583          	ld	a1,-64(s0)
    800061f8:	853e                	mv	a0,a5
    800061fa:	ffffb097          	auipc	ra,0xffffb
    800061fe:	4ca080e7          	jalr	1226(ra) # 800016c4 <strncpy>
  de.inum = inum;
    80006202:	fbc42783          	lw	a5,-68(s0)
    80006206:	17c2                	slli	a5,a5,0x30
    80006208:	93c1                	srli	a5,a5,0x30
    8000620a:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    8000620e:	fd040793          	addi	a5,s0,-48
    80006212:	fec42683          	lw	a3,-20(s0)
    80006216:	4741                	li	a4,16
    80006218:	863e                	mv	a2,a5
    8000621a:	4581                	li	a1,0
    8000621c:	fc843503          	ld	a0,-56(s0)
    80006220:	00000097          	auipc	ra,0x0
    80006224:	c70080e7          	jalr	-912(ra) # 80005e90 <writei>
    80006228:	87aa                	mv	a5,a0
    8000622a:	873e                	mv	a4,a5
    8000622c:	47c1                	li	a5,16
    8000622e:	00f70a63          	beq	a4,a5,80006242 <dirlink+0xf6>
    panic("dirlink");
    80006232:	00005517          	auipc	a0,0x5
    80006236:	30650513          	addi	a0,a0,774 # 8000b538 <etext+0x538>
    8000623a:	ffffb097          	auipc	ra,0xffffb
    8000623e:	a44080e7          	jalr	-1468(ra) # 80000c7e <panic>

  return 0;
    80006242:	4781                	li	a5,0
}
    80006244:	853e                	mv	a0,a5
    80006246:	60a6                	ld	ra,72(sp)
    80006248:	6406                	ld	s0,64(sp)
    8000624a:	6161                	addi	sp,sp,80
    8000624c:	8082                	ret

000000008000624e <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    8000624e:	7179                	addi	sp,sp,-48
    80006250:	f406                	sd	ra,40(sp)
    80006252:	f022                	sd	s0,32(sp)
    80006254:	1800                	addi	s0,sp,48
    80006256:	fca43c23          	sd	a0,-40(s0)
    8000625a:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    8000625e:	a031                	j	8000626a <skipelem+0x1c>
    path++;
    80006260:	fd843783          	ld	a5,-40(s0)
    80006264:	0785                	addi	a5,a5,1
    80006266:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    8000626a:	fd843783          	ld	a5,-40(s0)
    8000626e:	0007c783          	lbu	a5,0(a5)
    80006272:	873e                	mv	a4,a5
    80006274:	02f00793          	li	a5,47
    80006278:	fef704e3          	beq	a4,a5,80006260 <skipelem+0x12>
  if(*path == 0)
    8000627c:	fd843783          	ld	a5,-40(s0)
    80006280:	0007c783          	lbu	a5,0(a5)
    80006284:	e399                	bnez	a5,8000628a <skipelem+0x3c>
    return 0;
    80006286:	4781                	li	a5,0
    80006288:	a06d                	j	80006332 <skipelem+0xe4>
  s = path;
    8000628a:	fd843783          	ld	a5,-40(s0)
    8000628e:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80006292:	a031                	j	8000629e <skipelem+0x50>
    path++;
    80006294:	fd843783          	ld	a5,-40(s0)
    80006298:	0785                	addi	a5,a5,1
    8000629a:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    8000629e:	fd843783          	ld	a5,-40(s0)
    800062a2:	0007c783          	lbu	a5,0(a5)
    800062a6:	873e                	mv	a4,a5
    800062a8:	02f00793          	li	a5,47
    800062ac:	00f70763          	beq	a4,a5,800062ba <skipelem+0x6c>
    800062b0:	fd843783          	ld	a5,-40(s0)
    800062b4:	0007c783          	lbu	a5,0(a5)
    800062b8:	fff1                	bnez	a5,80006294 <skipelem+0x46>
  len = path - s;
    800062ba:	fd843703          	ld	a4,-40(s0)
    800062be:	fe843783          	ld	a5,-24(s0)
    800062c2:	40f707b3          	sub	a5,a4,a5
    800062c6:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    800062ca:	fe442783          	lw	a5,-28(s0)
    800062ce:	0007871b          	sext.w	a4,a5
    800062d2:	47b5                	li	a5,13
    800062d4:	00e7dc63          	bge	a5,a4,800062ec <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    800062d8:	4639                	li	a2,14
    800062da:	fe843583          	ld	a1,-24(s0)
    800062de:	fd043503          	ld	a0,-48(s0)
    800062e2:	ffffb097          	auipc	ra,0xffffb
    800062e6:	244080e7          	jalr	580(ra) # 80001526 <memmove>
    800062ea:	a80d                	j	8000631c <skipelem+0xce>
  else {
    memmove(name, s, len);
    800062ec:	fe442783          	lw	a5,-28(s0)
    800062f0:	863e                	mv	a2,a5
    800062f2:	fe843583          	ld	a1,-24(s0)
    800062f6:	fd043503          	ld	a0,-48(s0)
    800062fa:	ffffb097          	auipc	ra,0xffffb
    800062fe:	22c080e7          	jalr	556(ra) # 80001526 <memmove>
    name[len] = 0;
    80006302:	fe442783          	lw	a5,-28(s0)
    80006306:	fd043703          	ld	a4,-48(s0)
    8000630a:	97ba                	add	a5,a5,a4
    8000630c:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80006310:	a031                	j	8000631c <skipelem+0xce>
    path++;
    80006312:	fd843783          	ld	a5,-40(s0)
    80006316:	0785                	addi	a5,a5,1
    80006318:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    8000631c:	fd843783          	ld	a5,-40(s0)
    80006320:	0007c783          	lbu	a5,0(a5)
    80006324:	873e                	mv	a4,a5
    80006326:	02f00793          	li	a5,47
    8000632a:	fef704e3          	beq	a4,a5,80006312 <skipelem+0xc4>
  return path;
    8000632e:	fd843783          	ld	a5,-40(s0)
}
    80006332:	853e                	mv	a0,a5
    80006334:	70a2                	ld	ra,40(sp)
    80006336:	7402                	ld	s0,32(sp)
    80006338:	6145                	addi	sp,sp,48
    8000633a:	8082                	ret

000000008000633c <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    8000633c:	7139                	addi	sp,sp,-64
    8000633e:	fc06                	sd	ra,56(sp)
    80006340:	f822                	sd	s0,48(sp)
    80006342:	0080                	addi	s0,sp,64
    80006344:	fca43c23          	sd	a0,-40(s0)
    80006348:	87ae                	mv	a5,a1
    8000634a:	fcc43423          	sd	a2,-56(s0)
    8000634e:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80006352:	fd843783          	ld	a5,-40(s0)
    80006356:	0007c783          	lbu	a5,0(a5)
    8000635a:	873e                	mv	a4,a5
    8000635c:	02f00793          	li	a5,47
    80006360:	00f71b63          	bne	a4,a5,80006376 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80006364:	4585                	li	a1,1
    80006366:	4505                	li	a0,1
    80006368:	fffff097          	auipc	ra,0xfffff
    8000636c:	2a0080e7          	jalr	672(ra) # 80005608 <iget>
    80006370:	fea43423          	sd	a0,-24(s0)
    80006374:	a84d                	j	80006426 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80006376:	ffffc097          	auipc	ra,0xffffc
    8000637a:	49e080e7          	jalr	1182(ra) # 80002814 <myproc>
    8000637e:	87aa                	mv	a5,a0
    80006380:	1707b783          	ld	a5,368(a5)
    80006384:	853e                	mv	a0,a5
    80006386:	fffff097          	auipc	ra,0xfffff
    8000638a:	39e080e7          	jalr	926(ra) # 80005724 <idup>
    8000638e:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80006392:	a851                	j	80006426 <namex+0xea>
    ilock(ip);
    80006394:	fe843503          	ld	a0,-24(s0)
    80006398:	fffff097          	auipc	ra,0xfffff
    8000639c:	3d8080e7          	jalr	984(ra) # 80005770 <ilock>
    if(ip->type != T_DIR){
    800063a0:	fe843783          	ld	a5,-24(s0)
    800063a4:	04479783          	lh	a5,68(a5)
    800063a8:	0007871b          	sext.w	a4,a5
    800063ac:	4785                	li	a5,1
    800063ae:	00f70a63          	beq	a4,a5,800063c2 <namex+0x86>
      iunlockput(ip);
    800063b2:	fe843503          	ld	a0,-24(s0)
    800063b6:	fffff097          	auipc	ra,0xfffff
    800063ba:	618080e7          	jalr	1560(ra) # 800059ce <iunlockput>
      return 0;
    800063be:	4781                	li	a5,0
    800063c0:	a871                	j	8000645c <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    800063c2:	fd442783          	lw	a5,-44(s0)
    800063c6:	2781                	sext.w	a5,a5
    800063c8:	cf99                	beqz	a5,800063e6 <namex+0xaa>
    800063ca:	fd843783          	ld	a5,-40(s0)
    800063ce:	0007c783          	lbu	a5,0(a5)
    800063d2:	eb91                	bnez	a5,800063e6 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    800063d4:	fe843503          	ld	a0,-24(s0)
    800063d8:	fffff097          	auipc	ra,0xfffff
    800063dc:	4cc080e7          	jalr	1228(ra) # 800058a4 <iunlock>
      return ip;
    800063e0:	fe843783          	ld	a5,-24(s0)
    800063e4:	a8a5                	j	8000645c <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    800063e6:	4601                	li	a2,0
    800063e8:	fc843583          	ld	a1,-56(s0)
    800063ec:	fe843503          	ld	a0,-24(s0)
    800063f0:	00000097          	auipc	ra,0x0
    800063f4:	c74080e7          	jalr	-908(ra) # 80006064 <dirlookup>
    800063f8:	fea43023          	sd	a0,-32(s0)
    800063fc:	fe043783          	ld	a5,-32(s0)
    80006400:	eb89                	bnez	a5,80006412 <namex+0xd6>
      iunlockput(ip);
    80006402:	fe843503          	ld	a0,-24(s0)
    80006406:	fffff097          	auipc	ra,0xfffff
    8000640a:	5c8080e7          	jalr	1480(ra) # 800059ce <iunlockput>
      return 0;
    8000640e:	4781                	li	a5,0
    80006410:	a0b1                	j	8000645c <namex+0x120>
    }
    iunlockput(ip);
    80006412:	fe843503          	ld	a0,-24(s0)
    80006416:	fffff097          	auipc	ra,0xfffff
    8000641a:	5b8080e7          	jalr	1464(ra) # 800059ce <iunlockput>
    ip = next;
    8000641e:	fe043783          	ld	a5,-32(s0)
    80006422:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80006426:	fc843583          	ld	a1,-56(s0)
    8000642a:	fd843503          	ld	a0,-40(s0)
    8000642e:	00000097          	auipc	ra,0x0
    80006432:	e20080e7          	jalr	-480(ra) # 8000624e <skipelem>
    80006436:	fca43c23          	sd	a0,-40(s0)
    8000643a:	fd843783          	ld	a5,-40(s0)
    8000643e:	fbb9                	bnez	a5,80006394 <namex+0x58>
  }
  if(nameiparent){
    80006440:	fd442783          	lw	a5,-44(s0)
    80006444:	2781                	sext.w	a5,a5
    80006446:	cb89                	beqz	a5,80006458 <namex+0x11c>
    iput(ip);
    80006448:	fe843503          	ld	a0,-24(s0)
    8000644c:	fffff097          	auipc	ra,0xfffff
    80006450:	4b2080e7          	jalr	1202(ra) # 800058fe <iput>
    return 0;
    80006454:	4781                	li	a5,0
    80006456:	a019                	j	8000645c <namex+0x120>
  }
  return ip;
    80006458:	fe843783          	ld	a5,-24(s0)
}
    8000645c:	853e                	mv	a0,a5
    8000645e:	70e2                	ld	ra,56(sp)
    80006460:	7442                	ld	s0,48(sp)
    80006462:	6121                	addi	sp,sp,64
    80006464:	8082                	ret

0000000080006466 <namei>:

struct inode*
namei(char *path)
{
    80006466:	7179                	addi	sp,sp,-48
    80006468:	f406                	sd	ra,40(sp)
    8000646a:	f022                	sd	s0,32(sp)
    8000646c:	1800                	addi	s0,sp,48
    8000646e:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80006472:	fe040793          	addi	a5,s0,-32
    80006476:	863e                	mv	a2,a5
    80006478:	4581                	li	a1,0
    8000647a:	fd843503          	ld	a0,-40(s0)
    8000647e:	00000097          	auipc	ra,0x0
    80006482:	ebe080e7          	jalr	-322(ra) # 8000633c <namex>
    80006486:	87aa                	mv	a5,a0
}
    80006488:	853e                	mv	a0,a5
    8000648a:	70a2                	ld	ra,40(sp)
    8000648c:	7402                	ld	s0,32(sp)
    8000648e:	6145                	addi	sp,sp,48
    80006490:	8082                	ret

0000000080006492 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80006492:	1101                	addi	sp,sp,-32
    80006494:	ec06                	sd	ra,24(sp)
    80006496:	e822                	sd	s0,16(sp)
    80006498:	1000                	addi	s0,sp,32
    8000649a:	fea43423          	sd	a0,-24(s0)
    8000649e:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    800064a2:	fe043603          	ld	a2,-32(s0)
    800064a6:	4585                	li	a1,1
    800064a8:	fe843503          	ld	a0,-24(s0)
    800064ac:	00000097          	auipc	ra,0x0
    800064b0:	e90080e7          	jalr	-368(ra) # 8000633c <namex>
    800064b4:	87aa                	mv	a5,a0
}
    800064b6:	853e                	mv	a0,a5
    800064b8:	60e2                	ld	ra,24(sp)
    800064ba:	6442                	ld	s0,16(sp)
    800064bc:	6105                	addi	sp,sp,32
    800064be:	8082                	ret

00000000800064c0 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    800064c0:	1101                	addi	sp,sp,-32
    800064c2:	ec06                	sd	ra,24(sp)
    800064c4:	e822                	sd	s0,16(sp)
    800064c6:	1000                	addi	s0,sp,32
    800064c8:	87aa                	mv	a5,a0
    800064ca:	feb43023          	sd	a1,-32(s0)
    800064ce:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    800064d2:	00005597          	auipc	a1,0x5
    800064d6:	06e58593          	addi	a1,a1,110 # 8000b540 <etext+0x540>
    800064da:	0001e517          	auipc	a0,0x1e
    800064de:	5ae50513          	addi	a0,a0,1454 # 80024a88 <log>
    800064e2:	ffffb097          	auipc	ra,0xffffb
    800064e6:	d5c080e7          	jalr	-676(ra) # 8000123e <initlock>
  log.start = sb->logstart;
    800064ea:	fe043783          	ld	a5,-32(s0)
    800064ee:	4bdc                	lw	a5,20(a5)
    800064f0:	0007871b          	sext.w	a4,a5
    800064f4:	0001e797          	auipc	a5,0x1e
    800064f8:	59478793          	addi	a5,a5,1428 # 80024a88 <log>
    800064fc:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    800064fe:	fe043783          	ld	a5,-32(s0)
    80006502:	4b9c                	lw	a5,16(a5)
    80006504:	0007871b          	sext.w	a4,a5
    80006508:	0001e797          	auipc	a5,0x1e
    8000650c:	58078793          	addi	a5,a5,1408 # 80024a88 <log>
    80006510:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80006512:	0001e797          	auipc	a5,0x1e
    80006516:	57678793          	addi	a5,a5,1398 # 80024a88 <log>
    8000651a:	fec42703          	lw	a4,-20(s0)
    8000651e:	d798                	sw	a4,40(a5)
  recover_from_log();
    80006520:	00000097          	auipc	ra,0x0
    80006524:	272080e7          	jalr	626(ra) # 80006792 <recover_from_log>
}
    80006528:	0001                	nop
    8000652a:	60e2                	ld	ra,24(sp)
    8000652c:	6442                	ld	s0,16(sp)
    8000652e:	6105                	addi	sp,sp,32
    80006530:	8082                	ret

0000000080006532 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    80006532:	7139                	addi	sp,sp,-64
    80006534:	fc06                	sd	ra,56(sp)
    80006536:	f822                	sd	s0,48(sp)
    80006538:	0080                	addi	s0,sp,64
    8000653a:	87aa                	mv	a5,a0
    8000653c:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006540:	fe042623          	sw	zero,-20(s0)
    80006544:	a0f9                	j	80006612 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80006546:	0001e797          	auipc	a5,0x1e
    8000654a:	54278793          	addi	a5,a5,1346 # 80024a88 <log>
    8000654e:	579c                	lw	a5,40(a5)
    80006550:	0007869b          	sext.w	a3,a5
    80006554:	0001e797          	auipc	a5,0x1e
    80006558:	53478793          	addi	a5,a5,1332 # 80024a88 <log>
    8000655c:	4f9c                	lw	a5,24(a5)
    8000655e:	fec42703          	lw	a4,-20(s0)
    80006562:	9fb9                	addw	a5,a5,a4
    80006564:	2781                	sext.w	a5,a5
    80006566:	2785                	addiw	a5,a5,1
    80006568:	2781                	sext.w	a5,a5
    8000656a:	2781                	sext.w	a5,a5
    8000656c:	85be                	mv	a1,a5
    8000656e:	8536                	mv	a0,a3
    80006570:	fffff097          	auipc	ra,0xfffff
    80006574:	818080e7          	jalr	-2024(ra) # 80004d88 <bread>
    80006578:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    8000657c:	0001e797          	auipc	a5,0x1e
    80006580:	50c78793          	addi	a5,a5,1292 # 80024a88 <log>
    80006584:	579c                	lw	a5,40(a5)
    80006586:	0007869b          	sext.w	a3,a5
    8000658a:	0001e717          	auipc	a4,0x1e
    8000658e:	4fe70713          	addi	a4,a4,1278 # 80024a88 <log>
    80006592:	fec42783          	lw	a5,-20(s0)
    80006596:	07a1                	addi	a5,a5,8
    80006598:	078a                	slli	a5,a5,0x2
    8000659a:	97ba                	add	a5,a5,a4
    8000659c:	4b9c                	lw	a5,16(a5)
    8000659e:	2781                	sext.w	a5,a5
    800065a0:	85be                	mv	a1,a5
    800065a2:	8536                	mv	a0,a3
    800065a4:	ffffe097          	auipc	ra,0xffffe
    800065a8:	7e4080e7          	jalr	2020(ra) # 80004d88 <bread>
    800065ac:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    800065b0:	fd843783          	ld	a5,-40(s0)
    800065b4:	05878713          	addi	a4,a5,88
    800065b8:	fe043783          	ld	a5,-32(s0)
    800065bc:	05878793          	addi	a5,a5,88
    800065c0:	40000613          	li	a2,1024
    800065c4:	85be                	mv	a1,a5
    800065c6:	853a                	mv	a0,a4
    800065c8:	ffffb097          	auipc	ra,0xffffb
    800065cc:	f5e080e7          	jalr	-162(ra) # 80001526 <memmove>
    bwrite(dbuf);  // write dst to disk
    800065d0:	fd843503          	ld	a0,-40(s0)
    800065d4:	fffff097          	auipc	ra,0xfffff
    800065d8:	80e080e7          	jalr	-2034(ra) # 80004de2 <bwrite>
    if(recovering == 0)
    800065dc:	fcc42783          	lw	a5,-52(s0)
    800065e0:	2781                	sext.w	a5,a5
    800065e2:	e799                	bnez	a5,800065f0 <install_trans+0xbe>
      bunpin(dbuf);
    800065e4:	fd843503          	ld	a0,-40(s0)
    800065e8:	fffff097          	auipc	ra,0xfffff
    800065ec:	978080e7          	jalr	-1672(ra) # 80004f60 <bunpin>
    brelse(lbuf);
    800065f0:	fe043503          	ld	a0,-32(s0)
    800065f4:	fffff097          	auipc	ra,0xfffff
    800065f8:	836080e7          	jalr	-1994(ra) # 80004e2a <brelse>
    brelse(dbuf);
    800065fc:	fd843503          	ld	a0,-40(s0)
    80006600:	fffff097          	auipc	ra,0xfffff
    80006604:	82a080e7          	jalr	-2006(ra) # 80004e2a <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006608:	fec42783          	lw	a5,-20(s0)
    8000660c:	2785                	addiw	a5,a5,1
    8000660e:	fef42623          	sw	a5,-20(s0)
    80006612:	0001e797          	auipc	a5,0x1e
    80006616:	47678793          	addi	a5,a5,1142 # 80024a88 <log>
    8000661a:	57d8                	lw	a4,44(a5)
    8000661c:	fec42783          	lw	a5,-20(s0)
    80006620:	2781                	sext.w	a5,a5
    80006622:	f2e7c2e3          	blt	a5,a4,80006546 <install_trans+0x14>
  }
}
    80006626:	0001                	nop
    80006628:	0001                	nop
    8000662a:	70e2                	ld	ra,56(sp)
    8000662c:	7442                	ld	s0,48(sp)
    8000662e:	6121                	addi	sp,sp,64
    80006630:	8082                	ret

0000000080006632 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    80006632:	7179                	addi	sp,sp,-48
    80006634:	f406                	sd	ra,40(sp)
    80006636:	f022                	sd	s0,32(sp)
    80006638:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    8000663a:	0001e797          	auipc	a5,0x1e
    8000663e:	44e78793          	addi	a5,a5,1102 # 80024a88 <log>
    80006642:	579c                	lw	a5,40(a5)
    80006644:	0007871b          	sext.w	a4,a5
    80006648:	0001e797          	auipc	a5,0x1e
    8000664c:	44078793          	addi	a5,a5,1088 # 80024a88 <log>
    80006650:	4f9c                	lw	a5,24(a5)
    80006652:	2781                	sext.w	a5,a5
    80006654:	85be                	mv	a1,a5
    80006656:	853a                	mv	a0,a4
    80006658:	ffffe097          	auipc	ra,0xffffe
    8000665c:	730080e7          	jalr	1840(ra) # 80004d88 <bread>
    80006660:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    80006664:	fe043783          	ld	a5,-32(s0)
    80006668:	05878793          	addi	a5,a5,88
    8000666c:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80006670:	fd843783          	ld	a5,-40(s0)
    80006674:	4398                	lw	a4,0(a5)
    80006676:	0001e797          	auipc	a5,0x1e
    8000667a:	41278793          	addi	a5,a5,1042 # 80024a88 <log>
    8000667e:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006680:	fe042623          	sw	zero,-20(s0)
    80006684:	a03d                	j	800066b2 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    80006686:	fd843703          	ld	a4,-40(s0)
    8000668a:	fec42783          	lw	a5,-20(s0)
    8000668e:	078a                	slli	a5,a5,0x2
    80006690:	97ba                	add	a5,a5,a4
    80006692:	43d8                	lw	a4,4(a5)
    80006694:	0001e697          	auipc	a3,0x1e
    80006698:	3f468693          	addi	a3,a3,1012 # 80024a88 <log>
    8000669c:	fec42783          	lw	a5,-20(s0)
    800066a0:	07a1                	addi	a5,a5,8
    800066a2:	078a                	slli	a5,a5,0x2
    800066a4:	97b6                	add	a5,a5,a3
    800066a6:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    800066a8:	fec42783          	lw	a5,-20(s0)
    800066ac:	2785                	addiw	a5,a5,1
    800066ae:	fef42623          	sw	a5,-20(s0)
    800066b2:	0001e797          	auipc	a5,0x1e
    800066b6:	3d678793          	addi	a5,a5,982 # 80024a88 <log>
    800066ba:	57d8                	lw	a4,44(a5)
    800066bc:	fec42783          	lw	a5,-20(s0)
    800066c0:	2781                	sext.w	a5,a5
    800066c2:	fce7c2e3          	blt	a5,a4,80006686 <read_head+0x54>
  }
  brelse(buf);
    800066c6:	fe043503          	ld	a0,-32(s0)
    800066ca:	ffffe097          	auipc	ra,0xffffe
    800066ce:	760080e7          	jalr	1888(ra) # 80004e2a <brelse>
}
    800066d2:	0001                	nop
    800066d4:	70a2                	ld	ra,40(sp)
    800066d6:	7402                	ld	s0,32(sp)
    800066d8:	6145                	addi	sp,sp,48
    800066da:	8082                	ret

00000000800066dc <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    800066dc:	7179                	addi	sp,sp,-48
    800066de:	f406                	sd	ra,40(sp)
    800066e0:	f022                	sd	s0,32(sp)
    800066e2:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800066e4:	0001e797          	auipc	a5,0x1e
    800066e8:	3a478793          	addi	a5,a5,932 # 80024a88 <log>
    800066ec:	579c                	lw	a5,40(a5)
    800066ee:	0007871b          	sext.w	a4,a5
    800066f2:	0001e797          	auipc	a5,0x1e
    800066f6:	39678793          	addi	a5,a5,918 # 80024a88 <log>
    800066fa:	4f9c                	lw	a5,24(a5)
    800066fc:	2781                	sext.w	a5,a5
    800066fe:	85be                	mv	a1,a5
    80006700:	853a                	mv	a0,a4
    80006702:	ffffe097          	auipc	ra,0xffffe
    80006706:	686080e7          	jalr	1670(ra) # 80004d88 <bread>
    8000670a:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    8000670e:	fe043783          	ld	a5,-32(s0)
    80006712:	05878793          	addi	a5,a5,88
    80006716:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    8000671a:	0001e797          	auipc	a5,0x1e
    8000671e:	36e78793          	addi	a5,a5,878 # 80024a88 <log>
    80006722:	57d8                	lw	a4,44(a5)
    80006724:	fd843783          	ld	a5,-40(s0)
    80006728:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000672a:	fe042623          	sw	zero,-20(s0)
    8000672e:	a03d                	j	8000675c <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    80006730:	0001e717          	auipc	a4,0x1e
    80006734:	35870713          	addi	a4,a4,856 # 80024a88 <log>
    80006738:	fec42783          	lw	a5,-20(s0)
    8000673c:	07a1                	addi	a5,a5,8
    8000673e:	078a                	slli	a5,a5,0x2
    80006740:	97ba                	add	a5,a5,a4
    80006742:	4b98                	lw	a4,16(a5)
    80006744:	fd843683          	ld	a3,-40(s0)
    80006748:	fec42783          	lw	a5,-20(s0)
    8000674c:	078a                	slli	a5,a5,0x2
    8000674e:	97b6                	add	a5,a5,a3
    80006750:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006752:	fec42783          	lw	a5,-20(s0)
    80006756:	2785                	addiw	a5,a5,1
    80006758:	fef42623          	sw	a5,-20(s0)
    8000675c:	0001e797          	auipc	a5,0x1e
    80006760:	32c78793          	addi	a5,a5,812 # 80024a88 <log>
    80006764:	57d8                	lw	a4,44(a5)
    80006766:	fec42783          	lw	a5,-20(s0)
    8000676a:	2781                	sext.w	a5,a5
    8000676c:	fce7c2e3          	blt	a5,a4,80006730 <write_head+0x54>
  }
  bwrite(buf);
    80006770:	fe043503          	ld	a0,-32(s0)
    80006774:	ffffe097          	auipc	ra,0xffffe
    80006778:	66e080e7          	jalr	1646(ra) # 80004de2 <bwrite>
  brelse(buf);
    8000677c:	fe043503          	ld	a0,-32(s0)
    80006780:	ffffe097          	auipc	ra,0xffffe
    80006784:	6aa080e7          	jalr	1706(ra) # 80004e2a <brelse>
}
    80006788:	0001                	nop
    8000678a:	70a2                	ld	ra,40(sp)
    8000678c:	7402                	ld	s0,32(sp)
    8000678e:	6145                	addi	sp,sp,48
    80006790:	8082                	ret

0000000080006792 <recover_from_log>:

static void
recover_from_log(void)
{
    80006792:	1141                	addi	sp,sp,-16
    80006794:	e406                	sd	ra,8(sp)
    80006796:	e022                	sd	s0,0(sp)
    80006798:	0800                	addi	s0,sp,16
  read_head();
    8000679a:	00000097          	auipc	ra,0x0
    8000679e:	e98080e7          	jalr	-360(ra) # 80006632 <read_head>
  install_trans(1); // if committed, copy from log to disk
    800067a2:	4505                	li	a0,1
    800067a4:	00000097          	auipc	ra,0x0
    800067a8:	d8e080e7          	jalr	-626(ra) # 80006532 <install_trans>
  log.lh.n = 0;
    800067ac:	0001e797          	auipc	a5,0x1e
    800067b0:	2dc78793          	addi	a5,a5,732 # 80024a88 <log>
    800067b4:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    800067b8:	00000097          	auipc	ra,0x0
    800067bc:	f24080e7          	jalr	-220(ra) # 800066dc <write_head>
}
    800067c0:	0001                	nop
    800067c2:	60a2                	ld	ra,8(sp)
    800067c4:	6402                	ld	s0,0(sp)
    800067c6:	0141                	addi	sp,sp,16
    800067c8:	8082                	ret

00000000800067ca <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    800067ca:	1141                	addi	sp,sp,-16
    800067cc:	e406                	sd	ra,8(sp)
    800067ce:	e022                	sd	s0,0(sp)
    800067d0:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    800067d2:	0001e517          	auipc	a0,0x1e
    800067d6:	2b650513          	addi	a0,a0,694 # 80024a88 <log>
    800067da:	ffffb097          	auipc	ra,0xffffb
    800067de:	a94080e7          	jalr	-1388(ra) # 8000126e <acquire>
  while(1){
    if(log.committing){
    800067e2:	0001e797          	auipc	a5,0x1e
    800067e6:	2a678793          	addi	a5,a5,678 # 80024a88 <log>
    800067ea:	53dc                	lw	a5,36(a5)
    800067ec:	cf91                	beqz	a5,80006808 <begin_op+0x3e>
      sleep(&log, &log.lock);
    800067ee:	0001e597          	auipc	a1,0x1e
    800067f2:	29a58593          	addi	a1,a1,666 # 80024a88 <log>
    800067f6:	0001e517          	auipc	a0,0x1e
    800067fa:	29250513          	addi	a0,a0,658 # 80024a88 <log>
    800067fe:	ffffd097          	auipc	ra,0xffffd
    80006802:	142080e7          	jalr	322(ra) # 80003940 <sleep>
    80006806:	bff1                	j	800067e2 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    80006808:	0001e797          	auipc	a5,0x1e
    8000680c:	28078793          	addi	a5,a5,640 # 80024a88 <log>
    80006810:	57d8                	lw	a4,44(a5)
    80006812:	0001e797          	auipc	a5,0x1e
    80006816:	27678793          	addi	a5,a5,630 # 80024a88 <log>
    8000681a:	539c                	lw	a5,32(a5)
    8000681c:	2785                	addiw	a5,a5,1
    8000681e:	2781                	sext.w	a5,a5
    80006820:	86be                	mv	a3,a5
    80006822:	87b6                	mv	a5,a3
    80006824:	0027979b          	slliw	a5,a5,0x2
    80006828:	9fb5                	addw	a5,a5,a3
    8000682a:	0017979b          	slliw	a5,a5,0x1
    8000682e:	2781                	sext.w	a5,a5
    80006830:	9fb9                	addw	a5,a5,a4
    80006832:	2781                	sext.w	a5,a5
    80006834:	873e                	mv	a4,a5
    80006836:	47f9                	li	a5,30
    80006838:	00e7df63          	bge	a5,a4,80006856 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    8000683c:	0001e597          	auipc	a1,0x1e
    80006840:	24c58593          	addi	a1,a1,588 # 80024a88 <log>
    80006844:	0001e517          	auipc	a0,0x1e
    80006848:	24450513          	addi	a0,a0,580 # 80024a88 <log>
    8000684c:	ffffd097          	auipc	ra,0xffffd
    80006850:	0f4080e7          	jalr	244(ra) # 80003940 <sleep>
    80006854:	b779                	j	800067e2 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    80006856:	0001e797          	auipc	a5,0x1e
    8000685a:	23278793          	addi	a5,a5,562 # 80024a88 <log>
    8000685e:	539c                	lw	a5,32(a5)
    80006860:	2785                	addiw	a5,a5,1
    80006862:	0007871b          	sext.w	a4,a5
    80006866:	0001e797          	auipc	a5,0x1e
    8000686a:	22278793          	addi	a5,a5,546 # 80024a88 <log>
    8000686e:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006870:	0001e517          	auipc	a0,0x1e
    80006874:	21850513          	addi	a0,a0,536 # 80024a88 <log>
    80006878:	ffffb097          	auipc	ra,0xffffb
    8000687c:	a5a080e7          	jalr	-1446(ra) # 800012d2 <release>
      break;
    80006880:	0001                	nop
    }
  }
}
    80006882:	0001                	nop
    80006884:	60a2                	ld	ra,8(sp)
    80006886:	6402                	ld	s0,0(sp)
    80006888:	0141                	addi	sp,sp,16
    8000688a:	8082                	ret

000000008000688c <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    8000688c:	1101                	addi	sp,sp,-32
    8000688e:	ec06                	sd	ra,24(sp)
    80006890:	e822                	sd	s0,16(sp)
    80006892:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80006894:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    80006898:	0001e517          	auipc	a0,0x1e
    8000689c:	1f050513          	addi	a0,a0,496 # 80024a88 <log>
    800068a0:	ffffb097          	auipc	ra,0xffffb
    800068a4:	9ce080e7          	jalr	-1586(ra) # 8000126e <acquire>
  log.outstanding -= 1;
    800068a8:	0001e797          	auipc	a5,0x1e
    800068ac:	1e078793          	addi	a5,a5,480 # 80024a88 <log>
    800068b0:	539c                	lw	a5,32(a5)
    800068b2:	37fd                	addiw	a5,a5,-1
    800068b4:	0007871b          	sext.w	a4,a5
    800068b8:	0001e797          	auipc	a5,0x1e
    800068bc:	1d078793          	addi	a5,a5,464 # 80024a88 <log>
    800068c0:	d398                	sw	a4,32(a5)
  if(log.committing)
    800068c2:	0001e797          	auipc	a5,0x1e
    800068c6:	1c678793          	addi	a5,a5,454 # 80024a88 <log>
    800068ca:	53dc                	lw	a5,36(a5)
    800068cc:	cb89                	beqz	a5,800068de <end_op+0x52>
    panic("log.committing");
    800068ce:	00005517          	auipc	a0,0x5
    800068d2:	c7a50513          	addi	a0,a0,-902 # 8000b548 <etext+0x548>
    800068d6:	ffffa097          	auipc	ra,0xffffa
    800068da:	3a8080e7          	jalr	936(ra) # 80000c7e <panic>
  if(log.outstanding == 0){
    800068de:	0001e797          	auipc	a5,0x1e
    800068e2:	1aa78793          	addi	a5,a5,426 # 80024a88 <log>
    800068e6:	539c                	lw	a5,32(a5)
    800068e8:	eb99                	bnez	a5,800068fe <end_op+0x72>
    do_commit = 1;
    800068ea:	4785                	li	a5,1
    800068ec:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    800068f0:	0001e797          	auipc	a5,0x1e
    800068f4:	19878793          	addi	a5,a5,408 # 80024a88 <log>
    800068f8:	4705                	li	a4,1
    800068fa:	d3d8                	sw	a4,36(a5)
    800068fc:	a809                	j	8000690e <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800068fe:	0001e517          	auipc	a0,0x1e
    80006902:	18a50513          	addi	a0,a0,394 # 80024a88 <log>
    80006906:	ffffd097          	auipc	ra,0xffffd
    8000690a:	0b6080e7          	jalr	182(ra) # 800039bc <wakeup>
  }
  release(&log.lock);
    8000690e:	0001e517          	auipc	a0,0x1e
    80006912:	17a50513          	addi	a0,a0,378 # 80024a88 <log>
    80006916:	ffffb097          	auipc	ra,0xffffb
    8000691a:	9bc080e7          	jalr	-1604(ra) # 800012d2 <release>

  if(do_commit){
    8000691e:	fec42783          	lw	a5,-20(s0)
    80006922:	2781                	sext.w	a5,a5
    80006924:	c3b9                	beqz	a5,8000696a <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    80006926:	00000097          	auipc	ra,0x0
    8000692a:	134080e7          	jalr	308(ra) # 80006a5a <commit>
    acquire(&log.lock);
    8000692e:	0001e517          	auipc	a0,0x1e
    80006932:	15a50513          	addi	a0,a0,346 # 80024a88 <log>
    80006936:	ffffb097          	auipc	ra,0xffffb
    8000693a:	938080e7          	jalr	-1736(ra) # 8000126e <acquire>
    log.committing = 0;
    8000693e:	0001e797          	auipc	a5,0x1e
    80006942:	14a78793          	addi	a5,a5,330 # 80024a88 <log>
    80006946:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    8000694a:	0001e517          	auipc	a0,0x1e
    8000694e:	13e50513          	addi	a0,a0,318 # 80024a88 <log>
    80006952:	ffffd097          	auipc	ra,0xffffd
    80006956:	06a080e7          	jalr	106(ra) # 800039bc <wakeup>
    release(&log.lock);
    8000695a:	0001e517          	auipc	a0,0x1e
    8000695e:	12e50513          	addi	a0,a0,302 # 80024a88 <log>
    80006962:	ffffb097          	auipc	ra,0xffffb
    80006966:	970080e7          	jalr	-1680(ra) # 800012d2 <release>
  }
}
    8000696a:	0001                	nop
    8000696c:	60e2                	ld	ra,24(sp)
    8000696e:	6442                	ld	s0,16(sp)
    80006970:	6105                	addi	sp,sp,32
    80006972:	8082                	ret

0000000080006974 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    80006974:	7179                	addi	sp,sp,-48
    80006976:	f406                	sd	ra,40(sp)
    80006978:	f022                	sd	s0,32(sp)
    8000697a:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    8000697c:	fe042623          	sw	zero,-20(s0)
    80006980:	a86d                	j	80006a3a <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80006982:	0001e797          	auipc	a5,0x1e
    80006986:	10678793          	addi	a5,a5,262 # 80024a88 <log>
    8000698a:	579c                	lw	a5,40(a5)
    8000698c:	0007869b          	sext.w	a3,a5
    80006990:	0001e797          	auipc	a5,0x1e
    80006994:	0f878793          	addi	a5,a5,248 # 80024a88 <log>
    80006998:	4f9c                	lw	a5,24(a5)
    8000699a:	fec42703          	lw	a4,-20(s0)
    8000699e:	9fb9                	addw	a5,a5,a4
    800069a0:	2781                	sext.w	a5,a5
    800069a2:	2785                	addiw	a5,a5,1
    800069a4:	2781                	sext.w	a5,a5
    800069a6:	2781                	sext.w	a5,a5
    800069a8:	85be                	mv	a1,a5
    800069aa:	8536                	mv	a0,a3
    800069ac:	ffffe097          	auipc	ra,0xffffe
    800069b0:	3dc080e7          	jalr	988(ra) # 80004d88 <bread>
    800069b4:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    800069b8:	0001e797          	auipc	a5,0x1e
    800069bc:	0d078793          	addi	a5,a5,208 # 80024a88 <log>
    800069c0:	579c                	lw	a5,40(a5)
    800069c2:	0007869b          	sext.w	a3,a5
    800069c6:	0001e717          	auipc	a4,0x1e
    800069ca:	0c270713          	addi	a4,a4,194 # 80024a88 <log>
    800069ce:	fec42783          	lw	a5,-20(s0)
    800069d2:	07a1                	addi	a5,a5,8
    800069d4:	078a                	slli	a5,a5,0x2
    800069d6:	97ba                	add	a5,a5,a4
    800069d8:	4b9c                	lw	a5,16(a5)
    800069da:	2781                	sext.w	a5,a5
    800069dc:	85be                	mv	a1,a5
    800069de:	8536                	mv	a0,a3
    800069e0:	ffffe097          	auipc	ra,0xffffe
    800069e4:	3a8080e7          	jalr	936(ra) # 80004d88 <bread>
    800069e8:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    800069ec:	fe043783          	ld	a5,-32(s0)
    800069f0:	05878713          	addi	a4,a5,88
    800069f4:	fd843783          	ld	a5,-40(s0)
    800069f8:	05878793          	addi	a5,a5,88
    800069fc:	40000613          	li	a2,1024
    80006a00:	85be                	mv	a1,a5
    80006a02:	853a                	mv	a0,a4
    80006a04:	ffffb097          	auipc	ra,0xffffb
    80006a08:	b22080e7          	jalr	-1246(ra) # 80001526 <memmove>
    bwrite(to);  // write the log
    80006a0c:	fe043503          	ld	a0,-32(s0)
    80006a10:	ffffe097          	auipc	ra,0xffffe
    80006a14:	3d2080e7          	jalr	978(ra) # 80004de2 <bwrite>
    brelse(from);
    80006a18:	fd843503          	ld	a0,-40(s0)
    80006a1c:	ffffe097          	auipc	ra,0xffffe
    80006a20:	40e080e7          	jalr	1038(ra) # 80004e2a <brelse>
    brelse(to);
    80006a24:	fe043503          	ld	a0,-32(s0)
    80006a28:	ffffe097          	auipc	ra,0xffffe
    80006a2c:	402080e7          	jalr	1026(ra) # 80004e2a <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006a30:	fec42783          	lw	a5,-20(s0)
    80006a34:	2785                	addiw	a5,a5,1
    80006a36:	fef42623          	sw	a5,-20(s0)
    80006a3a:	0001e797          	auipc	a5,0x1e
    80006a3e:	04e78793          	addi	a5,a5,78 # 80024a88 <log>
    80006a42:	57d8                	lw	a4,44(a5)
    80006a44:	fec42783          	lw	a5,-20(s0)
    80006a48:	2781                	sext.w	a5,a5
    80006a4a:	f2e7cce3          	blt	a5,a4,80006982 <write_log+0xe>
  }
}
    80006a4e:	0001                	nop
    80006a50:	0001                	nop
    80006a52:	70a2                	ld	ra,40(sp)
    80006a54:	7402                	ld	s0,32(sp)
    80006a56:	6145                	addi	sp,sp,48
    80006a58:	8082                	ret

0000000080006a5a <commit>:

static void
commit()
{
    80006a5a:	1141                	addi	sp,sp,-16
    80006a5c:	e406                	sd	ra,8(sp)
    80006a5e:	e022                	sd	s0,0(sp)
    80006a60:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80006a62:	0001e797          	auipc	a5,0x1e
    80006a66:	02678793          	addi	a5,a5,38 # 80024a88 <log>
    80006a6a:	57dc                	lw	a5,44(a5)
    80006a6c:	02f05963          	blez	a5,80006a9e <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006a70:	00000097          	auipc	ra,0x0
    80006a74:	f04080e7          	jalr	-252(ra) # 80006974 <write_log>
    write_head();    // Write header to disk -- the real commit
    80006a78:	00000097          	auipc	ra,0x0
    80006a7c:	c64080e7          	jalr	-924(ra) # 800066dc <write_head>
    install_trans(0); // Now install writes to home locations
    80006a80:	4501                	li	a0,0
    80006a82:	00000097          	auipc	ra,0x0
    80006a86:	ab0080e7          	jalr	-1360(ra) # 80006532 <install_trans>
    log.lh.n = 0;
    80006a8a:	0001e797          	auipc	a5,0x1e
    80006a8e:	ffe78793          	addi	a5,a5,-2 # 80024a88 <log>
    80006a92:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006a96:	00000097          	auipc	ra,0x0
    80006a9a:	c46080e7          	jalr	-954(ra) # 800066dc <write_head>
  }
}
    80006a9e:	0001                	nop
    80006aa0:	60a2                	ld	ra,8(sp)
    80006aa2:	6402                	ld	s0,0(sp)
    80006aa4:	0141                	addi	sp,sp,16
    80006aa6:	8082                	ret

0000000080006aa8 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006aa8:	7179                	addi	sp,sp,-48
    80006aaa:	f406                	sd	ra,40(sp)
    80006aac:	f022                	sd	s0,32(sp)
    80006aae:	1800                	addi	s0,sp,48
    80006ab0:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80006ab4:	0001e517          	auipc	a0,0x1e
    80006ab8:	fd450513          	addi	a0,a0,-44 # 80024a88 <log>
    80006abc:	ffffa097          	auipc	ra,0xffffa
    80006ac0:	7b2080e7          	jalr	1970(ra) # 8000126e <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80006ac4:	0001e797          	auipc	a5,0x1e
    80006ac8:	fc478793          	addi	a5,a5,-60 # 80024a88 <log>
    80006acc:	57dc                	lw	a5,44(a5)
    80006ace:	873e                	mv	a4,a5
    80006ad0:	47f5                	li	a5,29
    80006ad2:	02e7c063          	blt	a5,a4,80006af2 <log_write+0x4a>
    80006ad6:	0001e797          	auipc	a5,0x1e
    80006ada:	fb278793          	addi	a5,a5,-78 # 80024a88 <log>
    80006ade:	57d8                	lw	a4,44(a5)
    80006ae0:	0001e797          	auipc	a5,0x1e
    80006ae4:	fa878793          	addi	a5,a5,-88 # 80024a88 <log>
    80006ae8:	4fdc                	lw	a5,28(a5)
    80006aea:	37fd                	addiw	a5,a5,-1
    80006aec:	2781                	sext.w	a5,a5
    80006aee:	00f74a63          	blt	a4,a5,80006b02 <log_write+0x5a>
    panic("too big a transaction");
    80006af2:	00005517          	auipc	a0,0x5
    80006af6:	a6650513          	addi	a0,a0,-1434 # 8000b558 <etext+0x558>
    80006afa:	ffffa097          	auipc	ra,0xffffa
    80006afe:	184080e7          	jalr	388(ra) # 80000c7e <panic>
  if (log.outstanding < 1)
    80006b02:	0001e797          	auipc	a5,0x1e
    80006b06:	f8678793          	addi	a5,a5,-122 # 80024a88 <log>
    80006b0a:	539c                	lw	a5,32(a5)
    80006b0c:	00f04a63          	bgtz	a5,80006b20 <log_write+0x78>
    panic("log_write outside of trans");
    80006b10:	00005517          	auipc	a0,0x5
    80006b14:	a6050513          	addi	a0,a0,-1440 # 8000b570 <etext+0x570>
    80006b18:	ffffa097          	auipc	ra,0xffffa
    80006b1c:	166080e7          	jalr	358(ra) # 80000c7e <panic>

  for (i = 0; i < log.lh.n; i++) {
    80006b20:	fe042623          	sw	zero,-20(s0)
    80006b24:	a03d                	j	80006b52 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    80006b26:	0001e717          	auipc	a4,0x1e
    80006b2a:	f6270713          	addi	a4,a4,-158 # 80024a88 <log>
    80006b2e:	fec42783          	lw	a5,-20(s0)
    80006b32:	07a1                	addi	a5,a5,8
    80006b34:	078a                	slli	a5,a5,0x2
    80006b36:	97ba                	add	a5,a5,a4
    80006b38:	4b9c                	lw	a5,16(a5)
    80006b3a:	0007871b          	sext.w	a4,a5
    80006b3e:	fd843783          	ld	a5,-40(s0)
    80006b42:	47dc                	lw	a5,12(a5)
    80006b44:	02f70263          	beq	a4,a5,80006b68 <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    80006b48:	fec42783          	lw	a5,-20(s0)
    80006b4c:	2785                	addiw	a5,a5,1
    80006b4e:	fef42623          	sw	a5,-20(s0)
    80006b52:	0001e797          	auipc	a5,0x1e
    80006b56:	f3678793          	addi	a5,a5,-202 # 80024a88 <log>
    80006b5a:	57d8                	lw	a4,44(a5)
    80006b5c:	fec42783          	lw	a5,-20(s0)
    80006b60:	2781                	sext.w	a5,a5
    80006b62:	fce7c2e3          	blt	a5,a4,80006b26 <log_write+0x7e>
    80006b66:	a011                	j	80006b6a <log_write+0xc2>
      break;
    80006b68:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    80006b6a:	fd843783          	ld	a5,-40(s0)
    80006b6e:	47dc                	lw	a5,12(a5)
    80006b70:	0007871b          	sext.w	a4,a5
    80006b74:	0001e697          	auipc	a3,0x1e
    80006b78:	f1468693          	addi	a3,a3,-236 # 80024a88 <log>
    80006b7c:	fec42783          	lw	a5,-20(s0)
    80006b80:	07a1                	addi	a5,a5,8
    80006b82:	078a                	slli	a5,a5,0x2
    80006b84:	97b6                	add	a5,a5,a3
    80006b86:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80006b88:	0001e797          	auipc	a5,0x1e
    80006b8c:	f0078793          	addi	a5,a5,-256 # 80024a88 <log>
    80006b90:	57d8                	lw	a4,44(a5)
    80006b92:	fec42783          	lw	a5,-20(s0)
    80006b96:	2781                	sext.w	a5,a5
    80006b98:	02e79563          	bne	a5,a4,80006bc2 <log_write+0x11a>
    bpin(b);
    80006b9c:	fd843503          	ld	a0,-40(s0)
    80006ba0:	ffffe097          	auipc	ra,0xffffe
    80006ba4:	378080e7          	jalr	888(ra) # 80004f18 <bpin>
    log.lh.n++;
    80006ba8:	0001e797          	auipc	a5,0x1e
    80006bac:	ee078793          	addi	a5,a5,-288 # 80024a88 <log>
    80006bb0:	57dc                	lw	a5,44(a5)
    80006bb2:	2785                	addiw	a5,a5,1
    80006bb4:	0007871b          	sext.w	a4,a5
    80006bb8:	0001e797          	auipc	a5,0x1e
    80006bbc:	ed078793          	addi	a5,a5,-304 # 80024a88 <log>
    80006bc0:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80006bc2:	0001e517          	auipc	a0,0x1e
    80006bc6:	ec650513          	addi	a0,a0,-314 # 80024a88 <log>
    80006bca:	ffffa097          	auipc	ra,0xffffa
    80006bce:	708080e7          	jalr	1800(ra) # 800012d2 <release>
}
    80006bd2:	0001                	nop
    80006bd4:	70a2                	ld	ra,40(sp)
    80006bd6:	7402                	ld	s0,32(sp)
    80006bd8:	6145                	addi	sp,sp,48
    80006bda:	8082                	ret

0000000080006bdc <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80006bdc:	1101                	addi	sp,sp,-32
    80006bde:	ec06                	sd	ra,24(sp)
    80006be0:	e822                	sd	s0,16(sp)
    80006be2:	1000                	addi	s0,sp,32
    80006be4:	fea43423          	sd	a0,-24(s0)
    80006be8:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    80006bec:	fe843783          	ld	a5,-24(s0)
    80006bf0:	07a1                	addi	a5,a5,8
    80006bf2:	00005597          	auipc	a1,0x5
    80006bf6:	99e58593          	addi	a1,a1,-1634 # 8000b590 <etext+0x590>
    80006bfa:	853e                	mv	a0,a5
    80006bfc:	ffffa097          	auipc	ra,0xffffa
    80006c00:	642080e7          	jalr	1602(ra) # 8000123e <initlock>
  lk->name = name;
    80006c04:	fe843783          	ld	a5,-24(s0)
    80006c08:	fe043703          	ld	a4,-32(s0)
    80006c0c:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80006c0e:	fe843783          	ld	a5,-24(s0)
    80006c12:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006c16:	fe843783          	ld	a5,-24(s0)
    80006c1a:	0207a423          	sw	zero,40(a5)
}
    80006c1e:	0001                	nop
    80006c20:	60e2                	ld	ra,24(sp)
    80006c22:	6442                	ld	s0,16(sp)
    80006c24:	6105                	addi	sp,sp,32
    80006c26:	8082                	ret

0000000080006c28 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80006c28:	1101                	addi	sp,sp,-32
    80006c2a:	ec06                	sd	ra,24(sp)
    80006c2c:	e822                	sd	s0,16(sp)
    80006c2e:	1000                	addi	s0,sp,32
    80006c30:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006c34:	fe843783          	ld	a5,-24(s0)
    80006c38:	07a1                	addi	a5,a5,8
    80006c3a:	853e                	mv	a0,a5
    80006c3c:	ffffa097          	auipc	ra,0xffffa
    80006c40:	632080e7          	jalr	1586(ra) # 8000126e <acquire>
  while (lk->locked) {
    80006c44:	a819                	j	80006c5a <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80006c46:	fe843783          	ld	a5,-24(s0)
    80006c4a:	07a1                	addi	a5,a5,8
    80006c4c:	85be                	mv	a1,a5
    80006c4e:	fe843503          	ld	a0,-24(s0)
    80006c52:	ffffd097          	auipc	ra,0xffffd
    80006c56:	cee080e7          	jalr	-786(ra) # 80003940 <sleep>
  while (lk->locked) {
    80006c5a:	fe843783          	ld	a5,-24(s0)
    80006c5e:	439c                	lw	a5,0(a5)
    80006c60:	f3fd                	bnez	a5,80006c46 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006c62:	fe843783          	ld	a5,-24(s0)
    80006c66:	4705                	li	a4,1
    80006c68:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    80006c6a:	ffffc097          	auipc	ra,0xffffc
    80006c6e:	baa080e7          	jalr	-1110(ra) # 80002814 <myproc>
    80006c72:	87aa                	mv	a5,a0
    80006c74:	5b98                	lw	a4,48(a5)
    80006c76:	fe843783          	ld	a5,-24(s0)
    80006c7a:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    80006c7c:	fe843783          	ld	a5,-24(s0)
    80006c80:	07a1                	addi	a5,a5,8
    80006c82:	853e                	mv	a0,a5
    80006c84:	ffffa097          	auipc	ra,0xffffa
    80006c88:	64e080e7          	jalr	1614(ra) # 800012d2 <release>
}
    80006c8c:	0001                	nop
    80006c8e:	60e2                	ld	ra,24(sp)
    80006c90:	6442                	ld	s0,16(sp)
    80006c92:	6105                	addi	sp,sp,32
    80006c94:	8082                	ret

0000000080006c96 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006c96:	1101                	addi	sp,sp,-32
    80006c98:	ec06                	sd	ra,24(sp)
    80006c9a:	e822                	sd	s0,16(sp)
    80006c9c:	1000                	addi	s0,sp,32
    80006c9e:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006ca2:	fe843783          	ld	a5,-24(s0)
    80006ca6:	07a1                	addi	a5,a5,8
    80006ca8:	853e                	mv	a0,a5
    80006caa:	ffffa097          	auipc	ra,0xffffa
    80006cae:	5c4080e7          	jalr	1476(ra) # 8000126e <acquire>
  lk->locked = 0;
    80006cb2:	fe843783          	ld	a5,-24(s0)
    80006cb6:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006cba:	fe843783          	ld	a5,-24(s0)
    80006cbe:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80006cc2:	fe843503          	ld	a0,-24(s0)
    80006cc6:	ffffd097          	auipc	ra,0xffffd
    80006cca:	cf6080e7          	jalr	-778(ra) # 800039bc <wakeup>
  release(&lk->lk);
    80006cce:	fe843783          	ld	a5,-24(s0)
    80006cd2:	07a1                	addi	a5,a5,8
    80006cd4:	853e                	mv	a0,a5
    80006cd6:	ffffa097          	auipc	ra,0xffffa
    80006cda:	5fc080e7          	jalr	1532(ra) # 800012d2 <release>
}
    80006cde:	0001                	nop
    80006ce0:	60e2                	ld	ra,24(sp)
    80006ce2:	6442                	ld	s0,16(sp)
    80006ce4:	6105                	addi	sp,sp,32
    80006ce6:	8082                	ret

0000000080006ce8 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80006ce8:	7139                	addi	sp,sp,-64
    80006cea:	fc06                	sd	ra,56(sp)
    80006cec:	f822                	sd	s0,48(sp)
    80006cee:	f426                	sd	s1,40(sp)
    80006cf0:	0080                	addi	s0,sp,64
    80006cf2:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006cf6:	fc843783          	ld	a5,-56(s0)
    80006cfa:	07a1                	addi	a5,a5,8
    80006cfc:	853e                	mv	a0,a5
    80006cfe:	ffffa097          	auipc	ra,0xffffa
    80006d02:	570080e7          	jalr	1392(ra) # 8000126e <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006d06:	fc843783          	ld	a5,-56(s0)
    80006d0a:	439c                	lw	a5,0(a5)
    80006d0c:	cf99                	beqz	a5,80006d2a <holdingsleep+0x42>
    80006d0e:	fc843783          	ld	a5,-56(s0)
    80006d12:	5784                	lw	s1,40(a5)
    80006d14:	ffffc097          	auipc	ra,0xffffc
    80006d18:	b00080e7          	jalr	-1280(ra) # 80002814 <myproc>
    80006d1c:	87aa                	mv	a5,a0
    80006d1e:	5b9c                	lw	a5,48(a5)
    80006d20:	8726                	mv	a4,s1
    80006d22:	00f71463          	bne	a4,a5,80006d2a <holdingsleep+0x42>
    80006d26:	4785                	li	a5,1
    80006d28:	a011                	j	80006d2c <holdingsleep+0x44>
    80006d2a:	4781                	li	a5,0
    80006d2c:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006d30:	fc843783          	ld	a5,-56(s0)
    80006d34:	07a1                	addi	a5,a5,8
    80006d36:	853e                	mv	a0,a5
    80006d38:	ffffa097          	auipc	ra,0xffffa
    80006d3c:	59a080e7          	jalr	1434(ra) # 800012d2 <release>
  return r;
    80006d40:	fdc42783          	lw	a5,-36(s0)
}
    80006d44:	853e                	mv	a0,a5
    80006d46:	70e2                	ld	ra,56(sp)
    80006d48:	7442                	ld	s0,48(sp)
    80006d4a:	74a2                	ld	s1,40(sp)
    80006d4c:	6121                	addi	sp,sp,64
    80006d4e:	8082                	ret

0000000080006d50 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006d50:	1141                	addi	sp,sp,-16
    80006d52:	e406                	sd	ra,8(sp)
    80006d54:	e022                	sd	s0,0(sp)
    80006d56:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006d58:	00005597          	auipc	a1,0x5
    80006d5c:	84858593          	addi	a1,a1,-1976 # 8000b5a0 <etext+0x5a0>
    80006d60:	0001e517          	auipc	a0,0x1e
    80006d64:	e7050513          	addi	a0,a0,-400 # 80024bd0 <ftable>
    80006d68:	ffffa097          	auipc	ra,0xffffa
    80006d6c:	4d6080e7          	jalr	1238(ra) # 8000123e <initlock>
}
    80006d70:	0001                	nop
    80006d72:	60a2                	ld	ra,8(sp)
    80006d74:	6402                	ld	s0,0(sp)
    80006d76:	0141                	addi	sp,sp,16
    80006d78:	8082                	ret

0000000080006d7a <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80006d7a:	1101                	addi	sp,sp,-32
    80006d7c:	ec06                	sd	ra,24(sp)
    80006d7e:	e822                	sd	s0,16(sp)
    80006d80:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006d82:	0001e517          	auipc	a0,0x1e
    80006d86:	e4e50513          	addi	a0,a0,-434 # 80024bd0 <ftable>
    80006d8a:	ffffa097          	auipc	ra,0xffffa
    80006d8e:	4e4080e7          	jalr	1252(ra) # 8000126e <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006d92:	0001e797          	auipc	a5,0x1e
    80006d96:	e5678793          	addi	a5,a5,-426 # 80024be8 <ftable+0x18>
    80006d9a:	fef43423          	sd	a5,-24(s0)
    80006d9e:	a815                	j	80006dd2 <filealloc+0x58>
    if(f->ref == 0){
    80006da0:	fe843783          	ld	a5,-24(s0)
    80006da4:	43dc                	lw	a5,4(a5)
    80006da6:	e385                	bnez	a5,80006dc6 <filealloc+0x4c>
      f->ref = 1;
    80006da8:	fe843783          	ld	a5,-24(s0)
    80006dac:	4705                	li	a4,1
    80006dae:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006db0:	0001e517          	auipc	a0,0x1e
    80006db4:	e2050513          	addi	a0,a0,-480 # 80024bd0 <ftable>
    80006db8:	ffffa097          	auipc	ra,0xffffa
    80006dbc:	51a080e7          	jalr	1306(ra) # 800012d2 <release>
      return f;
    80006dc0:	fe843783          	ld	a5,-24(s0)
    80006dc4:	a805                	j	80006df4 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006dc6:	fe843783          	ld	a5,-24(s0)
    80006dca:	02878793          	addi	a5,a5,40
    80006dce:	fef43423          	sd	a5,-24(s0)
    80006dd2:	0001f797          	auipc	a5,0x1f
    80006dd6:	db678793          	addi	a5,a5,-586 # 80025b88 <ftable+0xfb8>
    80006dda:	fe843703          	ld	a4,-24(s0)
    80006dde:	fcf761e3          	bltu	a4,a5,80006da0 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006de2:	0001e517          	auipc	a0,0x1e
    80006de6:	dee50513          	addi	a0,a0,-530 # 80024bd0 <ftable>
    80006dea:	ffffa097          	auipc	ra,0xffffa
    80006dee:	4e8080e7          	jalr	1256(ra) # 800012d2 <release>
  return 0;
    80006df2:	4781                	li	a5,0
}
    80006df4:	853e                	mv	a0,a5
    80006df6:	60e2                	ld	ra,24(sp)
    80006df8:	6442                	ld	s0,16(sp)
    80006dfa:	6105                	addi	sp,sp,32
    80006dfc:	8082                	ret

0000000080006dfe <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006dfe:	1101                	addi	sp,sp,-32
    80006e00:	ec06                	sd	ra,24(sp)
    80006e02:	e822                	sd	s0,16(sp)
    80006e04:	1000                	addi	s0,sp,32
    80006e06:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    80006e0a:	0001e517          	auipc	a0,0x1e
    80006e0e:	dc650513          	addi	a0,a0,-570 # 80024bd0 <ftable>
    80006e12:	ffffa097          	auipc	ra,0xffffa
    80006e16:	45c080e7          	jalr	1116(ra) # 8000126e <acquire>
  if(f->ref < 1)
    80006e1a:	fe843783          	ld	a5,-24(s0)
    80006e1e:	43dc                	lw	a5,4(a5)
    80006e20:	00f04a63          	bgtz	a5,80006e34 <filedup+0x36>
    panic("filedup");
    80006e24:	00004517          	auipc	a0,0x4
    80006e28:	78450513          	addi	a0,a0,1924 # 8000b5a8 <etext+0x5a8>
    80006e2c:	ffffa097          	auipc	ra,0xffffa
    80006e30:	e52080e7          	jalr	-430(ra) # 80000c7e <panic>
  f->ref++;
    80006e34:	fe843783          	ld	a5,-24(s0)
    80006e38:	43dc                	lw	a5,4(a5)
    80006e3a:	2785                	addiw	a5,a5,1
    80006e3c:	0007871b          	sext.w	a4,a5
    80006e40:	fe843783          	ld	a5,-24(s0)
    80006e44:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006e46:	0001e517          	auipc	a0,0x1e
    80006e4a:	d8a50513          	addi	a0,a0,-630 # 80024bd0 <ftable>
    80006e4e:	ffffa097          	auipc	ra,0xffffa
    80006e52:	484080e7          	jalr	1156(ra) # 800012d2 <release>
  return f;
    80006e56:	fe843783          	ld	a5,-24(s0)
}
    80006e5a:	853e                	mv	a0,a5
    80006e5c:	60e2                	ld	ra,24(sp)
    80006e5e:	6442                	ld	s0,16(sp)
    80006e60:	6105                	addi	sp,sp,32
    80006e62:	8082                	ret

0000000080006e64 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006e64:	715d                	addi	sp,sp,-80
    80006e66:	e486                	sd	ra,72(sp)
    80006e68:	e0a2                	sd	s0,64(sp)
    80006e6a:	0880                	addi	s0,sp,80
    80006e6c:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006e70:	0001e517          	auipc	a0,0x1e
    80006e74:	d6050513          	addi	a0,a0,-672 # 80024bd0 <ftable>
    80006e78:	ffffa097          	auipc	ra,0xffffa
    80006e7c:	3f6080e7          	jalr	1014(ra) # 8000126e <acquire>
  if(f->ref < 1)
    80006e80:	fb843783          	ld	a5,-72(s0)
    80006e84:	43dc                	lw	a5,4(a5)
    80006e86:	00f04a63          	bgtz	a5,80006e9a <fileclose+0x36>
    panic("fileclose");
    80006e8a:	00004517          	auipc	a0,0x4
    80006e8e:	72650513          	addi	a0,a0,1830 # 8000b5b0 <etext+0x5b0>
    80006e92:	ffffa097          	auipc	ra,0xffffa
    80006e96:	dec080e7          	jalr	-532(ra) # 80000c7e <panic>
  if(--f->ref > 0){
    80006e9a:	fb843783          	ld	a5,-72(s0)
    80006e9e:	43dc                	lw	a5,4(a5)
    80006ea0:	37fd                	addiw	a5,a5,-1
    80006ea2:	0007871b          	sext.w	a4,a5
    80006ea6:	fb843783          	ld	a5,-72(s0)
    80006eaa:	c3d8                	sw	a4,4(a5)
    80006eac:	fb843783          	ld	a5,-72(s0)
    80006eb0:	43dc                	lw	a5,4(a5)
    80006eb2:	00f05b63          	blez	a5,80006ec8 <fileclose+0x64>
    release(&ftable.lock);
    80006eb6:	0001e517          	auipc	a0,0x1e
    80006eba:	d1a50513          	addi	a0,a0,-742 # 80024bd0 <ftable>
    80006ebe:	ffffa097          	auipc	ra,0xffffa
    80006ec2:	414080e7          	jalr	1044(ra) # 800012d2 <release>
    80006ec6:	a879                	j	80006f64 <fileclose+0x100>
    return;
  }
  ff = *f;
    80006ec8:	fb843783          	ld	a5,-72(s0)
    80006ecc:	638c                	ld	a1,0(a5)
    80006ece:	6790                	ld	a2,8(a5)
    80006ed0:	6b94                	ld	a3,16(a5)
    80006ed2:	6f98                	ld	a4,24(a5)
    80006ed4:	739c                	ld	a5,32(a5)
    80006ed6:	fcb43423          	sd	a1,-56(s0)
    80006eda:	fcc43823          	sd	a2,-48(s0)
    80006ede:	fcd43c23          	sd	a3,-40(s0)
    80006ee2:	fee43023          	sd	a4,-32(s0)
    80006ee6:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006eea:	fb843783          	ld	a5,-72(s0)
    80006eee:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006ef2:	fb843783          	ld	a5,-72(s0)
    80006ef6:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006efa:	0001e517          	auipc	a0,0x1e
    80006efe:	cd650513          	addi	a0,a0,-810 # 80024bd0 <ftable>
    80006f02:	ffffa097          	auipc	ra,0xffffa
    80006f06:	3d0080e7          	jalr	976(ra) # 800012d2 <release>

  if(ff.type == FD_PIPE){
    80006f0a:	fc842783          	lw	a5,-56(s0)
    80006f0e:	873e                	mv	a4,a5
    80006f10:	4785                	li	a5,1
    80006f12:	00f71e63          	bne	a4,a5,80006f2e <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006f16:	fd843783          	ld	a5,-40(s0)
    80006f1a:	fd144703          	lbu	a4,-47(s0)
    80006f1e:	2701                	sext.w	a4,a4
    80006f20:	85ba                	mv	a1,a4
    80006f22:	853e                	mv	a0,a5
    80006f24:	00000097          	auipc	ra,0x0
    80006f28:	5aa080e7          	jalr	1450(ra) # 800074ce <pipeclose>
    80006f2c:	a825                	j	80006f64 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006f2e:	fc842783          	lw	a5,-56(s0)
    80006f32:	873e                	mv	a4,a5
    80006f34:	4789                	li	a5,2
    80006f36:	00f70863          	beq	a4,a5,80006f46 <fileclose+0xe2>
    80006f3a:	fc842783          	lw	a5,-56(s0)
    80006f3e:	873e                	mv	a4,a5
    80006f40:	478d                	li	a5,3
    80006f42:	02f71163          	bne	a4,a5,80006f64 <fileclose+0x100>
    begin_op();
    80006f46:	00000097          	auipc	ra,0x0
    80006f4a:	884080e7          	jalr	-1916(ra) # 800067ca <begin_op>
    iput(ff.ip);
    80006f4e:	fe043783          	ld	a5,-32(s0)
    80006f52:	853e                	mv	a0,a5
    80006f54:	fffff097          	auipc	ra,0xfffff
    80006f58:	9aa080e7          	jalr	-1622(ra) # 800058fe <iput>
    end_op();
    80006f5c:	00000097          	auipc	ra,0x0
    80006f60:	930080e7          	jalr	-1744(ra) # 8000688c <end_op>
  }
}
    80006f64:	60a6                	ld	ra,72(sp)
    80006f66:	6406                	ld	s0,64(sp)
    80006f68:	6161                	addi	sp,sp,80
    80006f6a:	8082                	ret

0000000080006f6c <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006f6c:	7139                	addi	sp,sp,-64
    80006f6e:	fc06                	sd	ra,56(sp)
    80006f70:	f822                	sd	s0,48(sp)
    80006f72:	0080                	addi	s0,sp,64
    80006f74:	fca43423          	sd	a0,-56(s0)
    80006f78:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006f7c:	ffffc097          	auipc	ra,0xffffc
    80006f80:	898080e7          	jalr	-1896(ra) # 80002814 <myproc>
    80006f84:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006f88:	fc843783          	ld	a5,-56(s0)
    80006f8c:	439c                	lw	a5,0(a5)
    80006f8e:	873e                	mv	a4,a5
    80006f90:	4789                	li	a5,2
    80006f92:	00f70963          	beq	a4,a5,80006fa4 <filestat+0x38>
    80006f96:	fc843783          	ld	a5,-56(s0)
    80006f9a:	439c                	lw	a5,0(a5)
    80006f9c:	873e                	mv	a4,a5
    80006f9e:	478d                	li	a5,3
    80006fa0:	06f71263          	bne	a4,a5,80007004 <filestat+0x98>
    ilock(f->ip);
    80006fa4:	fc843783          	ld	a5,-56(s0)
    80006fa8:	6f9c                	ld	a5,24(a5)
    80006faa:	853e                	mv	a0,a5
    80006fac:	ffffe097          	auipc	ra,0xffffe
    80006fb0:	7c4080e7          	jalr	1988(ra) # 80005770 <ilock>
    stati(f->ip, &st);
    80006fb4:	fc843783          	ld	a5,-56(s0)
    80006fb8:	6f9c                	ld	a5,24(a5)
    80006fba:	fd040713          	addi	a4,s0,-48
    80006fbe:	85ba                	mv	a1,a4
    80006fc0:	853e                	mv	a0,a5
    80006fc2:	fffff097          	auipc	ra,0xfffff
    80006fc6:	ce0080e7          	jalr	-800(ra) # 80005ca2 <stati>
    iunlock(f->ip);
    80006fca:	fc843783          	ld	a5,-56(s0)
    80006fce:	6f9c                	ld	a5,24(a5)
    80006fd0:	853e                	mv	a0,a5
    80006fd2:	fffff097          	auipc	ra,0xfffff
    80006fd6:	8d2080e7          	jalr	-1838(ra) # 800058a4 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006fda:	fe843783          	ld	a5,-24(s0)
    80006fde:	7bbc                	ld	a5,112(a5)
    80006fe0:	fd040713          	addi	a4,s0,-48
    80006fe4:	46e1                	li	a3,24
    80006fe6:	863a                	mv	a2,a4
    80006fe8:	fc043583          	ld	a1,-64(s0)
    80006fec:	853e                	mv	a0,a5
    80006fee:	ffffb097          	auipc	ra,0xffffb
    80006ff2:	2f8080e7          	jalr	760(ra) # 800022e6 <copyout>
    80006ff6:	87aa                	mv	a5,a0
    80006ff8:	0007d463          	bgez	a5,80007000 <filestat+0x94>
      return -1;
    80006ffc:	57fd                	li	a5,-1
    80006ffe:	a021                	j	80007006 <filestat+0x9a>
    return 0;
    80007000:	4781                	li	a5,0
    80007002:	a011                	j	80007006 <filestat+0x9a>
  }
  return -1;
    80007004:	57fd                	li	a5,-1
}
    80007006:	853e                	mv	a0,a5
    80007008:	70e2                	ld	ra,56(sp)
    8000700a:	7442                	ld	s0,48(sp)
    8000700c:	6121                	addi	sp,sp,64
    8000700e:	8082                	ret

0000000080007010 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80007010:	7139                	addi	sp,sp,-64
    80007012:	fc06                	sd	ra,56(sp)
    80007014:	f822                	sd	s0,48(sp)
    80007016:	0080                	addi	s0,sp,64
    80007018:	fca43c23          	sd	a0,-40(s0)
    8000701c:	fcb43823          	sd	a1,-48(s0)
    80007020:	87b2                	mv	a5,a2
    80007022:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80007026:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    8000702a:	fd843783          	ld	a5,-40(s0)
    8000702e:	0087c783          	lbu	a5,8(a5)
    80007032:	e399                	bnez	a5,80007038 <fileread+0x28>
    return -1;
    80007034:	57fd                	li	a5,-1
    80007036:	aa1d                	j	8000716c <fileread+0x15c>

  if(f->type == FD_PIPE){
    80007038:	fd843783          	ld	a5,-40(s0)
    8000703c:	439c                	lw	a5,0(a5)
    8000703e:	873e                	mv	a4,a5
    80007040:	4785                	li	a5,1
    80007042:	02f71363          	bne	a4,a5,80007068 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80007046:	fd843783          	ld	a5,-40(s0)
    8000704a:	6b9c                	ld	a5,16(a5)
    8000704c:	fcc42703          	lw	a4,-52(s0)
    80007050:	863a                	mv	a2,a4
    80007052:	fd043583          	ld	a1,-48(s0)
    80007056:	853e                	mv	a0,a5
    80007058:	00000097          	auipc	ra,0x0
    8000705c:	668080e7          	jalr	1640(ra) # 800076c0 <piperead>
    80007060:	87aa                	mv	a5,a0
    80007062:	fef42623          	sw	a5,-20(s0)
    80007066:	a209                	j	80007168 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80007068:	fd843783          	ld	a5,-40(s0)
    8000706c:	439c                	lw	a5,0(a5)
    8000706e:	873e                	mv	a4,a5
    80007070:	478d                	li	a5,3
    80007072:	06f71863          	bne	a4,a5,800070e2 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80007076:	fd843783          	ld	a5,-40(s0)
    8000707a:	02479783          	lh	a5,36(a5)
    8000707e:	2781                	sext.w	a5,a5
    80007080:	0207c863          	bltz	a5,800070b0 <fileread+0xa0>
    80007084:	fd843783          	ld	a5,-40(s0)
    80007088:	02479783          	lh	a5,36(a5)
    8000708c:	0007871b          	sext.w	a4,a5
    80007090:	47a5                	li	a5,9
    80007092:	00e7cf63          	blt	a5,a4,800070b0 <fileread+0xa0>
    80007096:	fd843783          	ld	a5,-40(s0)
    8000709a:	02479783          	lh	a5,36(a5)
    8000709e:	2781                	sext.w	a5,a5
    800070a0:	0001e717          	auipc	a4,0x1e
    800070a4:	a9070713          	addi	a4,a4,-1392 # 80024b30 <devsw>
    800070a8:	0792                	slli	a5,a5,0x4
    800070aa:	97ba                	add	a5,a5,a4
    800070ac:	639c                	ld	a5,0(a5)
    800070ae:	e399                	bnez	a5,800070b4 <fileread+0xa4>
      return -1;
    800070b0:	57fd                	li	a5,-1
    800070b2:	a86d                	j	8000716c <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    800070b4:	fd843783          	ld	a5,-40(s0)
    800070b8:	02479783          	lh	a5,36(a5)
    800070bc:	2781                	sext.w	a5,a5
    800070be:	0001e717          	auipc	a4,0x1e
    800070c2:	a7270713          	addi	a4,a4,-1422 # 80024b30 <devsw>
    800070c6:	0792                	slli	a5,a5,0x4
    800070c8:	97ba                	add	a5,a5,a4
    800070ca:	6398                	ld	a4,0(a5)
    800070cc:	fcc42783          	lw	a5,-52(s0)
    800070d0:	863e                	mv	a2,a5
    800070d2:	fd043583          	ld	a1,-48(s0)
    800070d6:	4505                	li	a0,1
    800070d8:	9702                	jalr	a4
    800070da:	87aa                	mv	a5,a0
    800070dc:	fef42623          	sw	a5,-20(s0)
    800070e0:	a061                	j	80007168 <fileread+0x158>
  } else if(f->type == FD_INODE){
    800070e2:	fd843783          	ld	a5,-40(s0)
    800070e6:	439c                	lw	a5,0(a5)
    800070e8:	873e                	mv	a4,a5
    800070ea:	4789                	li	a5,2
    800070ec:	06f71663          	bne	a4,a5,80007158 <fileread+0x148>
    ilock(f->ip);
    800070f0:	fd843783          	ld	a5,-40(s0)
    800070f4:	6f9c                	ld	a5,24(a5)
    800070f6:	853e                	mv	a0,a5
    800070f8:	ffffe097          	auipc	ra,0xffffe
    800070fc:	678080e7          	jalr	1656(ra) # 80005770 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80007100:	fd843783          	ld	a5,-40(s0)
    80007104:	6f88                	ld	a0,24(a5)
    80007106:	fd843783          	ld	a5,-40(s0)
    8000710a:	539c                	lw	a5,32(a5)
    8000710c:	fcc42703          	lw	a4,-52(s0)
    80007110:	86be                	mv	a3,a5
    80007112:	fd043603          	ld	a2,-48(s0)
    80007116:	4585                	li	a1,1
    80007118:	fffff097          	auipc	ra,0xfffff
    8000711c:	bee080e7          	jalr	-1042(ra) # 80005d06 <readi>
    80007120:	87aa                	mv	a5,a0
    80007122:	fef42623          	sw	a5,-20(s0)
    80007126:	fec42783          	lw	a5,-20(s0)
    8000712a:	2781                	sext.w	a5,a5
    8000712c:	00f05d63          	blez	a5,80007146 <fileread+0x136>
      f->off += r;
    80007130:	fd843783          	ld	a5,-40(s0)
    80007134:	5398                	lw	a4,32(a5)
    80007136:	fec42783          	lw	a5,-20(s0)
    8000713a:	9fb9                	addw	a5,a5,a4
    8000713c:	0007871b          	sext.w	a4,a5
    80007140:	fd843783          	ld	a5,-40(s0)
    80007144:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80007146:	fd843783          	ld	a5,-40(s0)
    8000714a:	6f9c                	ld	a5,24(a5)
    8000714c:	853e                	mv	a0,a5
    8000714e:	ffffe097          	auipc	ra,0xffffe
    80007152:	756080e7          	jalr	1878(ra) # 800058a4 <iunlock>
    80007156:	a809                	j	80007168 <fileread+0x158>
  } else {
    panic("fileread");
    80007158:	00004517          	auipc	a0,0x4
    8000715c:	46850513          	addi	a0,a0,1128 # 8000b5c0 <etext+0x5c0>
    80007160:	ffffa097          	auipc	ra,0xffffa
    80007164:	b1e080e7          	jalr	-1250(ra) # 80000c7e <panic>
  }

  return r;
    80007168:	fec42783          	lw	a5,-20(s0)
}
    8000716c:	853e                	mv	a0,a5
    8000716e:	70e2                	ld	ra,56(sp)
    80007170:	7442                	ld	s0,48(sp)
    80007172:	6121                	addi	sp,sp,64
    80007174:	8082                	ret

0000000080007176 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80007176:	715d                	addi	sp,sp,-80
    80007178:	e486                	sd	ra,72(sp)
    8000717a:	e0a2                	sd	s0,64(sp)
    8000717c:	0880                	addi	s0,sp,80
    8000717e:	fca43423          	sd	a0,-56(s0)
    80007182:	fcb43023          	sd	a1,-64(s0)
    80007186:	87b2                	mv	a5,a2
    80007188:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    8000718c:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80007190:	fc843783          	ld	a5,-56(s0)
    80007194:	0097c783          	lbu	a5,9(a5)
    80007198:	e399                	bnez	a5,8000719e <filewrite+0x28>
    return -1;
    8000719a:	57fd                	li	a5,-1
    8000719c:	aad1                	j	80007370 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    8000719e:	fc843783          	ld	a5,-56(s0)
    800071a2:	439c                	lw	a5,0(a5)
    800071a4:	873e                	mv	a4,a5
    800071a6:	4785                	li	a5,1
    800071a8:	02f71363          	bne	a4,a5,800071ce <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    800071ac:	fc843783          	ld	a5,-56(s0)
    800071b0:	6b9c                	ld	a5,16(a5)
    800071b2:	fbc42703          	lw	a4,-68(s0)
    800071b6:	863a                	mv	a2,a4
    800071b8:	fc043583          	ld	a1,-64(s0)
    800071bc:	853e                	mv	a0,a5
    800071be:	00000097          	auipc	ra,0x0
    800071c2:	3b8080e7          	jalr	952(ra) # 80007576 <pipewrite>
    800071c6:	87aa                	mv	a5,a0
    800071c8:	fef42623          	sw	a5,-20(s0)
    800071cc:	a245                	j	8000736c <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    800071ce:	fc843783          	ld	a5,-56(s0)
    800071d2:	439c                	lw	a5,0(a5)
    800071d4:	873e                	mv	a4,a5
    800071d6:	478d                	li	a5,3
    800071d8:	06f71863          	bne	a4,a5,80007248 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    800071dc:	fc843783          	ld	a5,-56(s0)
    800071e0:	02479783          	lh	a5,36(a5)
    800071e4:	2781                	sext.w	a5,a5
    800071e6:	0207c863          	bltz	a5,80007216 <filewrite+0xa0>
    800071ea:	fc843783          	ld	a5,-56(s0)
    800071ee:	02479783          	lh	a5,36(a5)
    800071f2:	0007871b          	sext.w	a4,a5
    800071f6:	47a5                	li	a5,9
    800071f8:	00e7cf63          	blt	a5,a4,80007216 <filewrite+0xa0>
    800071fc:	fc843783          	ld	a5,-56(s0)
    80007200:	02479783          	lh	a5,36(a5)
    80007204:	2781                	sext.w	a5,a5
    80007206:	0001e717          	auipc	a4,0x1e
    8000720a:	92a70713          	addi	a4,a4,-1750 # 80024b30 <devsw>
    8000720e:	0792                	slli	a5,a5,0x4
    80007210:	97ba                	add	a5,a5,a4
    80007212:	679c                	ld	a5,8(a5)
    80007214:	e399                	bnez	a5,8000721a <filewrite+0xa4>
      return -1;
    80007216:	57fd                	li	a5,-1
    80007218:	aaa1                	j	80007370 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    8000721a:	fc843783          	ld	a5,-56(s0)
    8000721e:	02479783          	lh	a5,36(a5)
    80007222:	2781                	sext.w	a5,a5
    80007224:	0001e717          	auipc	a4,0x1e
    80007228:	90c70713          	addi	a4,a4,-1780 # 80024b30 <devsw>
    8000722c:	0792                	slli	a5,a5,0x4
    8000722e:	97ba                	add	a5,a5,a4
    80007230:	6798                	ld	a4,8(a5)
    80007232:	fbc42783          	lw	a5,-68(s0)
    80007236:	863e                	mv	a2,a5
    80007238:	fc043583          	ld	a1,-64(s0)
    8000723c:	4505                	li	a0,1
    8000723e:	9702                	jalr	a4
    80007240:	87aa                	mv	a5,a0
    80007242:	fef42623          	sw	a5,-20(s0)
    80007246:	a21d                	j	8000736c <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80007248:	fc843783          	ld	a5,-56(s0)
    8000724c:	439c                	lw	a5,0(a5)
    8000724e:	873e                	mv	a4,a5
    80007250:	4789                	li	a5,2
    80007252:	10f71563          	bne	a4,a5,8000735c <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80007256:	6785                	lui	a5,0x1
    80007258:	c007879b          	addiw	a5,a5,-1024
    8000725c:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80007260:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80007264:	a0d9                	j	8000732a <filewrite+0x1b4>
      int n1 = n - i;
    80007266:	fbc42703          	lw	a4,-68(s0)
    8000726a:	fe842783          	lw	a5,-24(s0)
    8000726e:	40f707bb          	subw	a5,a4,a5
    80007272:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80007276:	fe442703          	lw	a4,-28(s0)
    8000727a:	fe042783          	lw	a5,-32(s0)
    8000727e:	2701                	sext.w	a4,a4
    80007280:	2781                	sext.w	a5,a5
    80007282:	00e7d663          	bge	a5,a4,8000728e <filewrite+0x118>
        n1 = max;
    80007286:	fe042783          	lw	a5,-32(s0)
    8000728a:	fef42223          	sw	a5,-28(s0)

      begin_op();
    8000728e:	fffff097          	auipc	ra,0xfffff
    80007292:	53c080e7          	jalr	1340(ra) # 800067ca <begin_op>
      ilock(f->ip);
    80007296:	fc843783          	ld	a5,-56(s0)
    8000729a:	6f9c                	ld	a5,24(a5)
    8000729c:	853e                	mv	a0,a5
    8000729e:	ffffe097          	auipc	ra,0xffffe
    800072a2:	4d2080e7          	jalr	1234(ra) # 80005770 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    800072a6:	fc843783          	ld	a5,-56(s0)
    800072aa:	6f88                	ld	a0,24(a5)
    800072ac:	fe842703          	lw	a4,-24(s0)
    800072b0:	fc043783          	ld	a5,-64(s0)
    800072b4:	00f70633          	add	a2,a4,a5
    800072b8:	fc843783          	ld	a5,-56(s0)
    800072bc:	539c                	lw	a5,32(a5)
    800072be:	fe442703          	lw	a4,-28(s0)
    800072c2:	86be                	mv	a3,a5
    800072c4:	4585                	li	a1,1
    800072c6:	fffff097          	auipc	ra,0xfffff
    800072ca:	bca080e7          	jalr	-1078(ra) # 80005e90 <writei>
    800072ce:	87aa                	mv	a5,a0
    800072d0:	fcf42e23          	sw	a5,-36(s0)
    800072d4:	fdc42783          	lw	a5,-36(s0)
    800072d8:	2781                	sext.w	a5,a5
    800072da:	00f05d63          	blez	a5,800072f4 <filewrite+0x17e>
        f->off += r;
    800072de:	fc843783          	ld	a5,-56(s0)
    800072e2:	5398                	lw	a4,32(a5)
    800072e4:	fdc42783          	lw	a5,-36(s0)
    800072e8:	9fb9                	addw	a5,a5,a4
    800072ea:	0007871b          	sext.w	a4,a5
    800072ee:	fc843783          	ld	a5,-56(s0)
    800072f2:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    800072f4:	fc843783          	ld	a5,-56(s0)
    800072f8:	6f9c                	ld	a5,24(a5)
    800072fa:	853e                	mv	a0,a5
    800072fc:	ffffe097          	auipc	ra,0xffffe
    80007300:	5a8080e7          	jalr	1448(ra) # 800058a4 <iunlock>
      end_op();
    80007304:	fffff097          	auipc	ra,0xfffff
    80007308:	588080e7          	jalr	1416(ra) # 8000688c <end_op>

      if(r != n1){
    8000730c:	fdc42703          	lw	a4,-36(s0)
    80007310:	fe442783          	lw	a5,-28(s0)
    80007314:	2701                	sext.w	a4,a4
    80007316:	2781                	sext.w	a5,a5
    80007318:	02f71263          	bne	a4,a5,8000733c <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    8000731c:	fe842703          	lw	a4,-24(s0)
    80007320:	fdc42783          	lw	a5,-36(s0)
    80007324:	9fb9                	addw	a5,a5,a4
    80007326:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    8000732a:	fe842703          	lw	a4,-24(s0)
    8000732e:	fbc42783          	lw	a5,-68(s0)
    80007332:	2701                	sext.w	a4,a4
    80007334:	2781                	sext.w	a5,a5
    80007336:	f2f748e3          	blt	a4,a5,80007266 <filewrite+0xf0>
    8000733a:	a011                	j	8000733e <filewrite+0x1c8>
        break;
    8000733c:	0001                	nop
    }
    ret = (i == n ? n : -1);
    8000733e:	fe842703          	lw	a4,-24(s0)
    80007342:	fbc42783          	lw	a5,-68(s0)
    80007346:	2701                	sext.w	a4,a4
    80007348:	2781                	sext.w	a5,a5
    8000734a:	00f71563          	bne	a4,a5,80007354 <filewrite+0x1de>
    8000734e:	fbc42783          	lw	a5,-68(s0)
    80007352:	a011                	j	80007356 <filewrite+0x1e0>
    80007354:	57fd                	li	a5,-1
    80007356:	fef42623          	sw	a5,-20(s0)
    8000735a:	a809                	j	8000736c <filewrite+0x1f6>
  } else {
    panic("filewrite");
    8000735c:	00004517          	auipc	a0,0x4
    80007360:	27450513          	addi	a0,a0,628 # 8000b5d0 <etext+0x5d0>
    80007364:	ffffa097          	auipc	ra,0xffffa
    80007368:	91a080e7          	jalr	-1766(ra) # 80000c7e <panic>
  }

  return ret;
    8000736c:	fec42783          	lw	a5,-20(s0)
}
    80007370:	853e                	mv	a0,a5
    80007372:	60a6                	ld	ra,72(sp)
    80007374:	6406                	ld	s0,64(sp)
    80007376:	6161                	addi	sp,sp,80
    80007378:	8082                	ret

000000008000737a <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    8000737a:	7179                	addi	sp,sp,-48
    8000737c:	f406                	sd	ra,40(sp)
    8000737e:	f022                	sd	s0,32(sp)
    80007380:	1800                	addi	s0,sp,48
    80007382:	fca43c23          	sd	a0,-40(s0)
    80007386:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    8000738a:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    8000738e:	fd043783          	ld	a5,-48(s0)
    80007392:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80007396:	fd043783          	ld	a5,-48(s0)
    8000739a:	6398                	ld	a4,0(a5)
    8000739c:	fd843783          	ld	a5,-40(s0)
    800073a0:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    800073a2:	00000097          	auipc	ra,0x0
    800073a6:	9d8080e7          	jalr	-1576(ra) # 80006d7a <filealloc>
    800073aa:	872a                	mv	a4,a0
    800073ac:	fd843783          	ld	a5,-40(s0)
    800073b0:	e398                	sd	a4,0(a5)
    800073b2:	fd843783          	ld	a5,-40(s0)
    800073b6:	639c                	ld	a5,0(a5)
    800073b8:	c3e9                	beqz	a5,8000747a <pipealloc+0x100>
    800073ba:	00000097          	auipc	ra,0x0
    800073be:	9c0080e7          	jalr	-1600(ra) # 80006d7a <filealloc>
    800073c2:	872a                	mv	a4,a0
    800073c4:	fd043783          	ld	a5,-48(s0)
    800073c8:	e398                	sd	a4,0(a5)
    800073ca:	fd043783          	ld	a5,-48(s0)
    800073ce:	639c                	ld	a5,0(a5)
    800073d0:	c7cd                	beqz	a5,8000747a <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    800073d2:	ffffa097          	auipc	ra,0xffffa
    800073d6:	d48080e7          	jalr	-696(ra) # 8000111a <kalloc>
    800073da:	fea43423          	sd	a0,-24(s0)
    800073de:	fe843783          	ld	a5,-24(s0)
    800073e2:	cfd1                	beqz	a5,8000747e <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    800073e4:	fe843783          	ld	a5,-24(s0)
    800073e8:	4705                	li	a4,1
    800073ea:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    800073ee:	fe843783          	ld	a5,-24(s0)
    800073f2:	4705                	li	a4,1
    800073f4:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    800073f8:	fe843783          	ld	a5,-24(s0)
    800073fc:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80007400:	fe843783          	ld	a5,-24(s0)
    80007404:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80007408:	fe843783          	ld	a5,-24(s0)
    8000740c:	00004597          	auipc	a1,0x4
    80007410:	1d458593          	addi	a1,a1,468 # 8000b5e0 <etext+0x5e0>
    80007414:	853e                	mv	a0,a5
    80007416:	ffffa097          	auipc	ra,0xffffa
    8000741a:	e28080e7          	jalr	-472(ra) # 8000123e <initlock>
  (*f0)->type = FD_PIPE;
    8000741e:	fd843783          	ld	a5,-40(s0)
    80007422:	639c                	ld	a5,0(a5)
    80007424:	4705                	li	a4,1
    80007426:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80007428:	fd843783          	ld	a5,-40(s0)
    8000742c:	639c                	ld	a5,0(a5)
    8000742e:	4705                	li	a4,1
    80007430:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80007434:	fd843783          	ld	a5,-40(s0)
    80007438:	639c                	ld	a5,0(a5)
    8000743a:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    8000743e:	fd843783          	ld	a5,-40(s0)
    80007442:	639c                	ld	a5,0(a5)
    80007444:	fe843703          	ld	a4,-24(s0)
    80007448:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    8000744a:	fd043783          	ld	a5,-48(s0)
    8000744e:	639c                	ld	a5,0(a5)
    80007450:	4705                	li	a4,1
    80007452:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80007454:	fd043783          	ld	a5,-48(s0)
    80007458:	639c                	ld	a5,0(a5)
    8000745a:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    8000745e:	fd043783          	ld	a5,-48(s0)
    80007462:	639c                	ld	a5,0(a5)
    80007464:	4705                	li	a4,1
    80007466:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    8000746a:	fd043783          	ld	a5,-48(s0)
    8000746e:	639c                	ld	a5,0(a5)
    80007470:	fe843703          	ld	a4,-24(s0)
    80007474:	eb98                	sd	a4,16(a5)
  return 0;
    80007476:	4781                	li	a5,0
    80007478:	a0b1                	j	800074c4 <pipealloc+0x14a>
    goto bad;
    8000747a:	0001                	nop
    8000747c:	a011                	j	80007480 <pipealloc+0x106>
    goto bad;
    8000747e:	0001                	nop

 bad:
  if(pi)
    80007480:	fe843783          	ld	a5,-24(s0)
    80007484:	c799                	beqz	a5,80007492 <pipealloc+0x118>
    kfree((char*)pi);
    80007486:	fe843503          	ld	a0,-24(s0)
    8000748a:	ffffa097          	auipc	ra,0xffffa
    8000748e:	bec080e7          	jalr	-1044(ra) # 80001076 <kfree>
  if(*f0)
    80007492:	fd843783          	ld	a5,-40(s0)
    80007496:	639c                	ld	a5,0(a5)
    80007498:	cb89                	beqz	a5,800074aa <pipealloc+0x130>
    fileclose(*f0);
    8000749a:	fd843783          	ld	a5,-40(s0)
    8000749e:	639c                	ld	a5,0(a5)
    800074a0:	853e                	mv	a0,a5
    800074a2:	00000097          	auipc	ra,0x0
    800074a6:	9c2080e7          	jalr	-1598(ra) # 80006e64 <fileclose>
  if(*f1)
    800074aa:	fd043783          	ld	a5,-48(s0)
    800074ae:	639c                	ld	a5,0(a5)
    800074b0:	cb89                	beqz	a5,800074c2 <pipealloc+0x148>
    fileclose(*f1);
    800074b2:	fd043783          	ld	a5,-48(s0)
    800074b6:	639c                	ld	a5,0(a5)
    800074b8:	853e                	mv	a0,a5
    800074ba:	00000097          	auipc	ra,0x0
    800074be:	9aa080e7          	jalr	-1622(ra) # 80006e64 <fileclose>
  return -1;
    800074c2:	57fd                	li	a5,-1
}
    800074c4:	853e                	mv	a0,a5
    800074c6:	70a2                	ld	ra,40(sp)
    800074c8:	7402                	ld	s0,32(sp)
    800074ca:	6145                	addi	sp,sp,48
    800074cc:	8082                	ret

00000000800074ce <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    800074ce:	1101                	addi	sp,sp,-32
    800074d0:	ec06                	sd	ra,24(sp)
    800074d2:	e822                	sd	s0,16(sp)
    800074d4:	1000                	addi	s0,sp,32
    800074d6:	fea43423          	sd	a0,-24(s0)
    800074da:	87ae                	mv	a5,a1
    800074dc:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    800074e0:	fe843783          	ld	a5,-24(s0)
    800074e4:	853e                	mv	a0,a5
    800074e6:	ffffa097          	auipc	ra,0xffffa
    800074ea:	d88080e7          	jalr	-632(ra) # 8000126e <acquire>
  if(writable){
    800074ee:	fe442783          	lw	a5,-28(s0)
    800074f2:	2781                	sext.w	a5,a5
    800074f4:	cf99                	beqz	a5,80007512 <pipeclose+0x44>
    pi->writeopen = 0;
    800074f6:	fe843783          	ld	a5,-24(s0)
    800074fa:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    800074fe:	fe843783          	ld	a5,-24(s0)
    80007502:	21878793          	addi	a5,a5,536
    80007506:	853e                	mv	a0,a5
    80007508:	ffffc097          	auipc	ra,0xffffc
    8000750c:	4b4080e7          	jalr	1204(ra) # 800039bc <wakeup>
    80007510:	a831                	j	8000752c <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    80007512:	fe843783          	ld	a5,-24(s0)
    80007516:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    8000751a:	fe843783          	ld	a5,-24(s0)
    8000751e:	21c78793          	addi	a5,a5,540
    80007522:	853e                	mv	a0,a5
    80007524:	ffffc097          	auipc	ra,0xffffc
    80007528:	498080e7          	jalr	1176(ra) # 800039bc <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    8000752c:	fe843783          	ld	a5,-24(s0)
    80007530:	2207a783          	lw	a5,544(a5)
    80007534:	e785                	bnez	a5,8000755c <pipeclose+0x8e>
    80007536:	fe843783          	ld	a5,-24(s0)
    8000753a:	2247a783          	lw	a5,548(a5)
    8000753e:	ef99                	bnez	a5,8000755c <pipeclose+0x8e>
    release(&pi->lock);
    80007540:	fe843783          	ld	a5,-24(s0)
    80007544:	853e                	mv	a0,a5
    80007546:	ffffa097          	auipc	ra,0xffffa
    8000754a:	d8c080e7          	jalr	-628(ra) # 800012d2 <release>
    kfree((char*)pi);
    8000754e:	fe843503          	ld	a0,-24(s0)
    80007552:	ffffa097          	auipc	ra,0xffffa
    80007556:	b24080e7          	jalr	-1244(ra) # 80001076 <kfree>
    8000755a:	a809                	j	8000756c <pipeclose+0x9e>
  } else
    release(&pi->lock);
    8000755c:	fe843783          	ld	a5,-24(s0)
    80007560:	853e                	mv	a0,a5
    80007562:	ffffa097          	auipc	ra,0xffffa
    80007566:	d70080e7          	jalr	-656(ra) # 800012d2 <release>
}
    8000756a:	0001                	nop
    8000756c:	0001                	nop
    8000756e:	60e2                	ld	ra,24(sp)
    80007570:	6442                	ld	s0,16(sp)
    80007572:	6105                	addi	sp,sp,32
    80007574:	8082                	ret

0000000080007576 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80007576:	715d                	addi	sp,sp,-80
    80007578:	e486                	sd	ra,72(sp)
    8000757a:	e0a2                	sd	s0,64(sp)
    8000757c:	0880                	addi	s0,sp,80
    8000757e:	fca43423          	sd	a0,-56(s0)
    80007582:	fcb43023          	sd	a1,-64(s0)
    80007586:	87b2                	mv	a5,a2
    80007588:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    8000758c:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80007590:	ffffb097          	auipc	ra,0xffffb
    80007594:	284080e7          	jalr	644(ra) # 80002814 <myproc>
    80007598:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    8000759c:	fc843783          	ld	a5,-56(s0)
    800075a0:	853e                	mv	a0,a5
    800075a2:	ffffa097          	auipc	ra,0xffffa
    800075a6:	ccc080e7          	jalr	-820(ra) # 8000126e <acquire>
  while(i < n){
    800075aa:	a8d1                	j	8000767e <pipewrite+0x108>
    if(pi->readopen == 0 || pr->killed){
    800075ac:	fc843783          	ld	a5,-56(s0)
    800075b0:	2207a783          	lw	a5,544(a5)
    800075b4:	c789                	beqz	a5,800075be <pipewrite+0x48>
    800075b6:	fe043783          	ld	a5,-32(s0)
    800075ba:	579c                	lw	a5,40(a5)
    800075bc:	cb91                	beqz	a5,800075d0 <pipewrite+0x5a>
      release(&pi->lock);
    800075be:	fc843783          	ld	a5,-56(s0)
    800075c2:	853e                	mv	a0,a5
    800075c4:	ffffa097          	auipc	ra,0xffffa
    800075c8:	d0e080e7          	jalr	-754(ra) # 800012d2 <release>
      return -1;
    800075cc:	57fd                	li	a5,-1
    800075ce:	a0e5                	j	800076b6 <pipewrite+0x140>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    800075d0:	fc843783          	ld	a5,-56(s0)
    800075d4:	21c7a703          	lw	a4,540(a5)
    800075d8:	fc843783          	ld	a5,-56(s0)
    800075dc:	2187a783          	lw	a5,536(a5)
    800075e0:	2007879b          	addiw	a5,a5,512
    800075e4:	2781                	sext.w	a5,a5
    800075e6:	02f71863          	bne	a4,a5,80007616 <pipewrite+0xa0>
      wakeup(&pi->nread);
    800075ea:	fc843783          	ld	a5,-56(s0)
    800075ee:	21878793          	addi	a5,a5,536
    800075f2:	853e                	mv	a0,a5
    800075f4:	ffffc097          	auipc	ra,0xffffc
    800075f8:	3c8080e7          	jalr	968(ra) # 800039bc <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    800075fc:	fc843783          	ld	a5,-56(s0)
    80007600:	21c78793          	addi	a5,a5,540
    80007604:	fc843703          	ld	a4,-56(s0)
    80007608:	85ba                	mv	a1,a4
    8000760a:	853e                	mv	a0,a5
    8000760c:	ffffc097          	auipc	ra,0xffffc
    80007610:	334080e7          	jalr	820(ra) # 80003940 <sleep>
    80007614:	a0ad                	j	8000767e <pipewrite+0x108>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80007616:	fe043783          	ld	a5,-32(s0)
    8000761a:	7ba8                	ld	a0,112(a5)
    8000761c:	fec42703          	lw	a4,-20(s0)
    80007620:	fc043783          	ld	a5,-64(s0)
    80007624:	973e                	add	a4,a4,a5
    80007626:	fdf40793          	addi	a5,s0,-33
    8000762a:	4685                	li	a3,1
    8000762c:	863a                	mv	a2,a4
    8000762e:	85be                	mv	a1,a5
    80007630:	ffffb097          	auipc	ra,0xffffb
    80007634:	d84080e7          	jalr	-636(ra) # 800023b4 <copyin>
    80007638:	87aa                	mv	a5,a0
    8000763a:	873e                	mv	a4,a5
    8000763c:	57fd                	li	a5,-1
    8000763e:	04f70963          	beq	a4,a5,80007690 <pipewrite+0x11a>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80007642:	fc843783          	ld	a5,-56(s0)
    80007646:	21c7a783          	lw	a5,540(a5)
    8000764a:	2781                	sext.w	a5,a5
    8000764c:	0017871b          	addiw	a4,a5,1
    80007650:	0007069b          	sext.w	a3,a4
    80007654:	fc843703          	ld	a4,-56(s0)
    80007658:	20d72e23          	sw	a3,540(a4)
    8000765c:	1ff7f793          	andi	a5,a5,511
    80007660:	2781                	sext.w	a5,a5
    80007662:	fdf44703          	lbu	a4,-33(s0)
    80007666:	fc843683          	ld	a3,-56(s0)
    8000766a:	1782                	slli	a5,a5,0x20
    8000766c:	9381                	srli	a5,a5,0x20
    8000766e:	97b6                	add	a5,a5,a3
    80007670:	00e78c23          	sb	a4,24(a5)
      i++;
    80007674:	fec42783          	lw	a5,-20(s0)
    80007678:	2785                	addiw	a5,a5,1
    8000767a:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    8000767e:	fec42703          	lw	a4,-20(s0)
    80007682:	fbc42783          	lw	a5,-68(s0)
    80007686:	2701                	sext.w	a4,a4
    80007688:	2781                	sext.w	a5,a5
    8000768a:	f2f741e3          	blt	a4,a5,800075ac <pipewrite+0x36>
    8000768e:	a011                	j	80007692 <pipewrite+0x11c>
        break;
    80007690:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80007692:	fc843783          	ld	a5,-56(s0)
    80007696:	21878793          	addi	a5,a5,536
    8000769a:	853e                	mv	a0,a5
    8000769c:	ffffc097          	auipc	ra,0xffffc
    800076a0:	320080e7          	jalr	800(ra) # 800039bc <wakeup>
  release(&pi->lock);
    800076a4:	fc843783          	ld	a5,-56(s0)
    800076a8:	853e                	mv	a0,a5
    800076aa:	ffffa097          	auipc	ra,0xffffa
    800076ae:	c28080e7          	jalr	-984(ra) # 800012d2 <release>

  return i;
    800076b2:	fec42783          	lw	a5,-20(s0)
}
    800076b6:	853e                	mv	a0,a5
    800076b8:	60a6                	ld	ra,72(sp)
    800076ba:	6406                	ld	s0,64(sp)
    800076bc:	6161                	addi	sp,sp,80
    800076be:	8082                	ret

00000000800076c0 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    800076c0:	715d                	addi	sp,sp,-80
    800076c2:	e486                	sd	ra,72(sp)
    800076c4:	e0a2                	sd	s0,64(sp)
    800076c6:	0880                	addi	s0,sp,80
    800076c8:	fca43423          	sd	a0,-56(s0)
    800076cc:	fcb43023          	sd	a1,-64(s0)
    800076d0:	87b2                	mv	a5,a2
    800076d2:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    800076d6:	ffffb097          	auipc	ra,0xffffb
    800076da:	13e080e7          	jalr	318(ra) # 80002814 <myproc>
    800076de:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    800076e2:	fc843783          	ld	a5,-56(s0)
    800076e6:	853e                	mv	a0,a5
    800076e8:	ffffa097          	auipc	ra,0xffffa
    800076ec:	b86080e7          	jalr	-1146(ra) # 8000126e <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800076f0:	a815                	j	80007724 <piperead+0x64>
    if(pr->killed){
    800076f2:	fe043783          	ld	a5,-32(s0)
    800076f6:	579c                	lw	a5,40(a5)
    800076f8:	cb91                	beqz	a5,8000770c <piperead+0x4c>
      release(&pi->lock);
    800076fa:	fc843783          	ld	a5,-56(s0)
    800076fe:	853e                	mv	a0,a5
    80007700:	ffffa097          	auipc	ra,0xffffa
    80007704:	bd2080e7          	jalr	-1070(ra) # 800012d2 <release>
      return -1;
    80007708:	57fd                	li	a5,-1
    8000770a:	a8dd                	j	80007800 <piperead+0x140>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8000770c:	fc843783          	ld	a5,-56(s0)
    80007710:	21878793          	addi	a5,a5,536
    80007714:	fc843703          	ld	a4,-56(s0)
    80007718:	85ba                	mv	a1,a4
    8000771a:	853e                	mv	a0,a5
    8000771c:	ffffc097          	auipc	ra,0xffffc
    80007720:	224080e7          	jalr	548(ra) # 80003940 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007724:	fc843783          	ld	a5,-56(s0)
    80007728:	2187a703          	lw	a4,536(a5)
    8000772c:	fc843783          	ld	a5,-56(s0)
    80007730:	21c7a783          	lw	a5,540(a5)
    80007734:	00f71763          	bne	a4,a5,80007742 <piperead+0x82>
    80007738:	fc843783          	ld	a5,-56(s0)
    8000773c:	2247a783          	lw	a5,548(a5)
    80007740:	fbcd                	bnez	a5,800076f2 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007742:	fe042623          	sw	zero,-20(s0)
    80007746:	a8bd                	j	800077c4 <piperead+0x104>
    if(pi->nread == pi->nwrite)
    80007748:	fc843783          	ld	a5,-56(s0)
    8000774c:	2187a703          	lw	a4,536(a5)
    80007750:	fc843783          	ld	a5,-56(s0)
    80007754:	21c7a783          	lw	a5,540(a5)
    80007758:	06f70f63          	beq	a4,a5,800077d6 <piperead+0x116>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    8000775c:	fc843783          	ld	a5,-56(s0)
    80007760:	2187a783          	lw	a5,536(a5)
    80007764:	2781                	sext.w	a5,a5
    80007766:	0017871b          	addiw	a4,a5,1
    8000776a:	0007069b          	sext.w	a3,a4
    8000776e:	fc843703          	ld	a4,-56(s0)
    80007772:	20d72c23          	sw	a3,536(a4)
    80007776:	1ff7f793          	andi	a5,a5,511
    8000777a:	2781                	sext.w	a5,a5
    8000777c:	fc843703          	ld	a4,-56(s0)
    80007780:	1782                	slli	a5,a5,0x20
    80007782:	9381                	srli	a5,a5,0x20
    80007784:	97ba                	add	a5,a5,a4
    80007786:	0187c783          	lbu	a5,24(a5)
    8000778a:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    8000778e:	fe043783          	ld	a5,-32(s0)
    80007792:	7ba8                	ld	a0,112(a5)
    80007794:	fec42703          	lw	a4,-20(s0)
    80007798:	fc043783          	ld	a5,-64(s0)
    8000779c:	97ba                	add	a5,a5,a4
    8000779e:	fdf40713          	addi	a4,s0,-33
    800077a2:	4685                	li	a3,1
    800077a4:	863a                	mv	a2,a4
    800077a6:	85be                	mv	a1,a5
    800077a8:	ffffb097          	auipc	ra,0xffffb
    800077ac:	b3e080e7          	jalr	-1218(ra) # 800022e6 <copyout>
    800077b0:	87aa                	mv	a5,a0
    800077b2:	873e                	mv	a4,a5
    800077b4:	57fd                	li	a5,-1
    800077b6:	02f70263          	beq	a4,a5,800077da <piperead+0x11a>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800077ba:	fec42783          	lw	a5,-20(s0)
    800077be:	2785                	addiw	a5,a5,1
    800077c0:	fef42623          	sw	a5,-20(s0)
    800077c4:	fec42703          	lw	a4,-20(s0)
    800077c8:	fbc42783          	lw	a5,-68(s0)
    800077cc:	2701                	sext.w	a4,a4
    800077ce:	2781                	sext.w	a5,a5
    800077d0:	f6f74ce3          	blt	a4,a5,80007748 <piperead+0x88>
    800077d4:	a021                	j	800077dc <piperead+0x11c>
      break;
    800077d6:	0001                	nop
    800077d8:	a011                	j	800077dc <piperead+0x11c>
      break;
    800077da:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800077dc:	fc843783          	ld	a5,-56(s0)
    800077e0:	21c78793          	addi	a5,a5,540
    800077e4:	853e                	mv	a0,a5
    800077e6:	ffffc097          	auipc	ra,0xffffc
    800077ea:	1d6080e7          	jalr	470(ra) # 800039bc <wakeup>
  release(&pi->lock);
    800077ee:	fc843783          	ld	a5,-56(s0)
    800077f2:	853e                	mv	a0,a5
    800077f4:	ffffa097          	auipc	ra,0xffffa
    800077f8:	ade080e7          	jalr	-1314(ra) # 800012d2 <release>
  return i;
    800077fc:	fec42783          	lw	a5,-20(s0)
}
    80007800:	853e                	mv	a0,a5
    80007802:	60a6                	ld	ra,72(sp)
    80007804:	6406                	ld	s0,64(sp)
    80007806:	6161                	addi	sp,sp,80
    80007808:	8082                	ret

000000008000780a <exec>:

static int loadseg(pde_t *pgdir, uint64 addr, struct inode *ip, uint offset, uint sz);

int
exec(char *path, char **argv)
{
    8000780a:	de010113          	addi	sp,sp,-544
    8000780e:	20113c23          	sd	ra,536(sp)
    80007812:	20813823          	sd	s0,528(sp)
    80007816:	20913423          	sd	s1,520(sp)
    8000781a:	1400                	addi	s0,sp,544
    8000781c:	dea43423          	sd	a0,-536(s0)
    80007820:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    80007824:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007828:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    8000782c:	ffffb097          	auipc	ra,0xffffb
    80007830:	fe8080e7          	jalr	-24(ra) # 80002814 <myproc>
    80007834:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    80007838:	fffff097          	auipc	ra,0xfffff
    8000783c:	f92080e7          	jalr	-110(ra) # 800067ca <begin_op>

  if((ip = namei(path)) == 0){
    80007840:	de843503          	ld	a0,-536(s0)
    80007844:	fffff097          	auipc	ra,0xfffff
    80007848:	c22080e7          	jalr	-990(ra) # 80006466 <namei>
    8000784c:	faa43423          	sd	a0,-88(s0)
    80007850:	fa843783          	ld	a5,-88(s0)
    80007854:	e799                	bnez	a5,80007862 <exec+0x58>
    end_op();
    80007856:	fffff097          	auipc	ra,0xfffff
    8000785a:	036080e7          	jalr	54(ra) # 8000688c <end_op>
    return -1;
    8000785e:	57fd                	li	a5,-1
    80007860:	a90d                	j	80007c92 <exec+0x488>
  }
  ilock(ip);
    80007862:	fa843503          	ld	a0,-88(s0)
    80007866:	ffffe097          	auipc	ra,0xffffe
    8000786a:	f0a080e7          	jalr	-246(ra) # 80005770 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    8000786e:	e3040793          	addi	a5,s0,-464
    80007872:	04000713          	li	a4,64
    80007876:	4681                	li	a3,0
    80007878:	863e                	mv	a2,a5
    8000787a:	4581                	li	a1,0
    8000787c:	fa843503          	ld	a0,-88(s0)
    80007880:	ffffe097          	auipc	ra,0xffffe
    80007884:	486080e7          	jalr	1158(ra) # 80005d06 <readi>
    80007888:	87aa                	mv	a5,a0
    8000788a:	873e                	mv	a4,a5
    8000788c:	04000793          	li	a5,64
    80007890:	38f71b63          	bne	a4,a5,80007c26 <exec+0x41c>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80007894:	e3042783          	lw	a5,-464(s0)
    80007898:	873e                	mv	a4,a5
    8000789a:	464c47b7          	lui	a5,0x464c4
    8000789e:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    800078a2:	38f71463          	bne	a4,a5,80007c2a <exec+0x420>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    800078a6:	f9843503          	ld	a0,-104(s0)
    800078aa:	ffffb097          	auipc	ra,0xffffb
    800078ae:	1fc080e7          	jalr	508(ra) # 80002aa6 <proc_pagetable>
    800078b2:	faa43023          	sd	a0,-96(s0)
    800078b6:	fa043783          	ld	a5,-96(s0)
    800078ba:	36078a63          	beqz	a5,80007c2e <exec+0x424>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800078be:	fc042623          	sw	zero,-52(s0)
    800078c2:	e5043783          	ld	a5,-432(s0)
    800078c6:	fcf42423          	sw	a5,-56(s0)
    800078ca:	a8e1                	j	800079a2 <exec+0x198>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    800078cc:	df840793          	addi	a5,s0,-520
    800078d0:	fc842683          	lw	a3,-56(s0)
    800078d4:	03800713          	li	a4,56
    800078d8:	863e                	mv	a2,a5
    800078da:	4581                	li	a1,0
    800078dc:	fa843503          	ld	a0,-88(s0)
    800078e0:	ffffe097          	auipc	ra,0xffffe
    800078e4:	426080e7          	jalr	1062(ra) # 80005d06 <readi>
    800078e8:	87aa                	mv	a5,a0
    800078ea:	873e                	mv	a4,a5
    800078ec:	03800793          	li	a5,56
    800078f0:	34f71163          	bne	a4,a5,80007c32 <exec+0x428>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    800078f4:	df842783          	lw	a5,-520(s0)
    800078f8:	873e                	mv	a4,a5
    800078fa:	4785                	li	a5,1
    800078fc:	08f71663          	bne	a4,a5,80007988 <exec+0x17e>
      continue;
    if(ph.memsz < ph.filesz)
    80007900:	e2043703          	ld	a4,-480(s0)
    80007904:	e1843783          	ld	a5,-488(s0)
    80007908:	32f76763          	bltu	a4,a5,80007c36 <exec+0x42c>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    8000790c:	e0843703          	ld	a4,-504(s0)
    80007910:	e2043783          	ld	a5,-480(s0)
    80007914:	973e                	add	a4,a4,a5
    80007916:	e0843783          	ld	a5,-504(s0)
    8000791a:	32f76063          	bltu	a4,a5,80007c3a <exec+0x430>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8000791e:	e0843703          	ld	a4,-504(s0)
    80007922:	e2043783          	ld	a5,-480(s0)
    80007926:	97ba                	add	a5,a5,a4
    80007928:	863e                	mv	a2,a5
    8000792a:	fb843583          	ld	a1,-72(s0)
    8000792e:	fa043503          	ld	a0,-96(s0)
    80007932:	ffffa097          	auipc	ra,0xffffa
    80007936:	5d6080e7          	jalr	1494(ra) # 80001f08 <uvmalloc>
    8000793a:	f6a43823          	sd	a0,-144(s0)
    8000793e:	f7043783          	ld	a5,-144(s0)
    80007942:	2e078e63          	beqz	a5,80007c3e <exec+0x434>
      goto bad;
    sz = sz1;
    80007946:	f7043783          	ld	a5,-144(s0)
    8000794a:	faf43c23          	sd	a5,-72(s0)
    if((ph.vaddr % PGSIZE) != 0)
    8000794e:	e0843703          	ld	a4,-504(s0)
    80007952:	6785                	lui	a5,0x1
    80007954:	17fd                	addi	a5,a5,-1
    80007956:	8ff9                	and	a5,a5,a4
    80007958:	2e079563          	bnez	a5,80007c42 <exec+0x438>
      goto bad;
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    8000795c:	e0843783          	ld	a5,-504(s0)
    80007960:	e0043703          	ld	a4,-512(s0)
    80007964:	0007069b          	sext.w	a3,a4
    80007968:	e1843703          	ld	a4,-488(s0)
    8000796c:	2701                	sext.w	a4,a4
    8000796e:	fa843603          	ld	a2,-88(s0)
    80007972:	85be                	mv	a1,a5
    80007974:	fa043503          	ld	a0,-96(s0)
    80007978:	00000097          	auipc	ra,0x0
    8000797c:	32e080e7          	jalr	814(ra) # 80007ca6 <loadseg>
    80007980:	87aa                	mv	a5,a0
    80007982:	2c07c263          	bltz	a5,80007c46 <exec+0x43c>
    80007986:	a011                	j	8000798a <exec+0x180>
      continue;
    80007988:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8000798a:	fcc42783          	lw	a5,-52(s0)
    8000798e:	2785                	addiw	a5,a5,1
    80007990:	fcf42623          	sw	a5,-52(s0)
    80007994:	fc842783          	lw	a5,-56(s0)
    80007998:	0387879b          	addiw	a5,a5,56
    8000799c:	2781                	sext.w	a5,a5
    8000799e:	fcf42423          	sw	a5,-56(s0)
    800079a2:	e6845783          	lhu	a5,-408(s0)
    800079a6:	0007871b          	sext.w	a4,a5
    800079aa:	fcc42783          	lw	a5,-52(s0)
    800079ae:	2781                	sext.w	a5,a5
    800079b0:	f0e7cee3          	blt	a5,a4,800078cc <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    800079b4:	fa843503          	ld	a0,-88(s0)
    800079b8:	ffffe097          	auipc	ra,0xffffe
    800079bc:	016080e7          	jalr	22(ra) # 800059ce <iunlockput>
  end_op();
    800079c0:	fffff097          	auipc	ra,0xfffff
    800079c4:	ecc080e7          	jalr	-308(ra) # 8000688c <end_op>
  ip = 0;
    800079c8:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    800079cc:	ffffb097          	auipc	ra,0xffffb
    800079d0:	e48080e7          	jalr	-440(ra) # 80002814 <myproc>
    800079d4:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    800079d8:	f9843783          	ld	a5,-104(s0)
    800079dc:	77bc                	ld	a5,104(a5)
    800079de:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    800079e2:	fb843703          	ld	a4,-72(s0)
    800079e6:	6785                	lui	a5,0x1
    800079e8:	17fd                	addi	a5,a5,-1
    800079ea:	973e                	add	a4,a4,a5
    800079ec:	77fd                	lui	a5,0xfffff
    800079ee:	8ff9                	and	a5,a5,a4
    800079f0:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE)) == 0)
    800079f4:	fb843703          	ld	a4,-72(s0)
    800079f8:	6789                	lui	a5,0x2
    800079fa:	97ba                	add	a5,a5,a4
    800079fc:	863e                	mv	a2,a5
    800079fe:	fb843583          	ld	a1,-72(s0)
    80007a02:	fa043503          	ld	a0,-96(s0)
    80007a06:	ffffa097          	auipc	ra,0xffffa
    80007a0a:	502080e7          	jalr	1282(ra) # 80001f08 <uvmalloc>
    80007a0e:	f8a43423          	sd	a0,-120(s0)
    80007a12:	f8843783          	ld	a5,-120(s0)
    80007a16:	22078a63          	beqz	a5,80007c4a <exec+0x440>
    goto bad;
  sz = sz1;
    80007a1a:	f8843783          	ld	a5,-120(s0)
    80007a1e:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007a22:	fb843703          	ld	a4,-72(s0)
    80007a26:	77f9                	lui	a5,0xffffe
    80007a28:	97ba                	add	a5,a5,a4
    80007a2a:	85be                	mv	a1,a5
    80007a2c:	fa043503          	ld	a0,-96(s0)
    80007a30:	ffffb097          	auipc	ra,0xffffb
    80007a34:	860080e7          	jalr	-1952(ra) # 80002290 <uvmclear>
  sp = sz;
    80007a38:	fb843783          	ld	a5,-72(s0)
    80007a3c:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    80007a40:	fb043703          	ld	a4,-80(s0)
    80007a44:	77fd                	lui	a5,0xfffff
    80007a46:	97ba                	add	a5,a5,a4
    80007a48:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    80007a4c:	fc043023          	sd	zero,-64(s0)
    80007a50:	a845                	j	80007b00 <exec+0x2f6>
    if(argc >= MAXARG)
    80007a52:	fc043703          	ld	a4,-64(s0)
    80007a56:	47fd                	li	a5,31
    80007a58:	1ee7eb63          	bltu	a5,a4,80007c4e <exec+0x444>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    80007a5c:	fc043783          	ld	a5,-64(s0)
    80007a60:	078e                	slli	a5,a5,0x3
    80007a62:	de043703          	ld	a4,-544(s0)
    80007a66:	97ba                	add	a5,a5,a4
    80007a68:	639c                	ld	a5,0(a5)
    80007a6a:	853e                	mv	a0,a5
    80007a6c:	ffffa097          	auipc	ra,0xffffa
    80007a70:	d54080e7          	jalr	-684(ra) # 800017c0 <strlen>
    80007a74:	87aa                	mv	a5,a0
    80007a76:	2785                	addiw	a5,a5,1
    80007a78:	2781                	sext.w	a5,a5
    80007a7a:	873e                	mv	a4,a5
    80007a7c:	fb043783          	ld	a5,-80(s0)
    80007a80:	8f99                	sub	a5,a5,a4
    80007a82:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80007a86:	fb043783          	ld	a5,-80(s0)
    80007a8a:	9bc1                	andi	a5,a5,-16
    80007a8c:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80007a90:	fb043703          	ld	a4,-80(s0)
    80007a94:	f8043783          	ld	a5,-128(s0)
    80007a98:	1af76d63          	bltu	a4,a5,80007c52 <exec+0x448>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80007a9c:	fc043783          	ld	a5,-64(s0)
    80007aa0:	078e                	slli	a5,a5,0x3
    80007aa2:	de043703          	ld	a4,-544(s0)
    80007aa6:	97ba                	add	a5,a5,a4
    80007aa8:	6384                	ld	s1,0(a5)
    80007aaa:	fc043783          	ld	a5,-64(s0)
    80007aae:	078e                	slli	a5,a5,0x3
    80007ab0:	de043703          	ld	a4,-544(s0)
    80007ab4:	97ba                	add	a5,a5,a4
    80007ab6:	639c                	ld	a5,0(a5)
    80007ab8:	853e                	mv	a0,a5
    80007aba:	ffffa097          	auipc	ra,0xffffa
    80007abe:	d06080e7          	jalr	-762(ra) # 800017c0 <strlen>
    80007ac2:	87aa                	mv	a5,a0
    80007ac4:	2785                	addiw	a5,a5,1
    80007ac6:	2781                	sext.w	a5,a5
    80007ac8:	86be                	mv	a3,a5
    80007aca:	8626                	mv	a2,s1
    80007acc:	fb043583          	ld	a1,-80(s0)
    80007ad0:	fa043503          	ld	a0,-96(s0)
    80007ad4:	ffffb097          	auipc	ra,0xffffb
    80007ad8:	812080e7          	jalr	-2030(ra) # 800022e6 <copyout>
    80007adc:	87aa                	mv	a5,a0
    80007ade:	1607cc63          	bltz	a5,80007c56 <exec+0x44c>
      goto bad;
    ustack[argc] = sp;
    80007ae2:	fc043783          	ld	a5,-64(s0)
    80007ae6:	078e                	slli	a5,a5,0x3
    80007ae8:	fe040713          	addi	a4,s0,-32
    80007aec:	97ba                	add	a5,a5,a4
    80007aee:	fb043703          	ld	a4,-80(s0)
    80007af2:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffd5e90>
  for(argc = 0; argv[argc]; argc++) {
    80007af6:	fc043783          	ld	a5,-64(s0)
    80007afa:	0785                	addi	a5,a5,1
    80007afc:	fcf43023          	sd	a5,-64(s0)
    80007b00:	fc043783          	ld	a5,-64(s0)
    80007b04:	078e                	slli	a5,a5,0x3
    80007b06:	de043703          	ld	a4,-544(s0)
    80007b0a:	97ba                	add	a5,a5,a4
    80007b0c:	639c                	ld	a5,0(a5)
    80007b0e:	f3b1                	bnez	a5,80007a52 <exec+0x248>
  }
  ustack[argc] = 0;
    80007b10:	fc043783          	ld	a5,-64(s0)
    80007b14:	078e                	slli	a5,a5,0x3
    80007b16:	fe040713          	addi	a4,s0,-32
    80007b1a:	97ba                	add	a5,a5,a4
    80007b1c:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007b20:	fc043783          	ld	a5,-64(s0)
    80007b24:	0785                	addi	a5,a5,1
    80007b26:	078e                	slli	a5,a5,0x3
    80007b28:	fb043703          	ld	a4,-80(s0)
    80007b2c:	40f707b3          	sub	a5,a4,a5
    80007b30:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007b34:	fb043783          	ld	a5,-80(s0)
    80007b38:	9bc1                	andi	a5,a5,-16
    80007b3a:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    80007b3e:	fb043703          	ld	a4,-80(s0)
    80007b42:	f8043783          	ld	a5,-128(s0)
    80007b46:	10f76a63          	bltu	a4,a5,80007c5a <exec+0x450>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80007b4a:	fc043783          	ld	a5,-64(s0)
    80007b4e:	0785                	addi	a5,a5,1
    80007b50:	00379713          	slli	a4,a5,0x3
    80007b54:	e7040793          	addi	a5,s0,-400
    80007b58:	86ba                	mv	a3,a4
    80007b5a:	863e                	mv	a2,a5
    80007b5c:	fb043583          	ld	a1,-80(s0)
    80007b60:	fa043503          	ld	a0,-96(s0)
    80007b64:	ffffa097          	auipc	ra,0xffffa
    80007b68:	782080e7          	jalr	1922(ra) # 800022e6 <copyout>
    80007b6c:	87aa                	mv	a5,a0
    80007b6e:	0e07c863          	bltz	a5,80007c5e <exec+0x454>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    80007b72:	f9843783          	ld	a5,-104(s0)
    80007b76:	7fbc                	ld	a5,120(a5)
    80007b78:	fb043703          	ld	a4,-80(s0)
    80007b7c:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    80007b7e:	de843783          	ld	a5,-536(s0)
    80007b82:	fcf43c23          	sd	a5,-40(s0)
    80007b86:	fd843783          	ld	a5,-40(s0)
    80007b8a:	fcf43823          	sd	a5,-48(s0)
    80007b8e:	a025                	j	80007bb6 <exec+0x3ac>
    if(*s == '/')
    80007b90:	fd843783          	ld	a5,-40(s0)
    80007b94:	0007c783          	lbu	a5,0(a5)
    80007b98:	873e                	mv	a4,a5
    80007b9a:	02f00793          	li	a5,47
    80007b9e:	00f71763          	bne	a4,a5,80007bac <exec+0x3a2>
      last = s+1;
    80007ba2:	fd843783          	ld	a5,-40(s0)
    80007ba6:	0785                	addi	a5,a5,1
    80007ba8:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    80007bac:	fd843783          	ld	a5,-40(s0)
    80007bb0:	0785                	addi	a5,a5,1
    80007bb2:	fcf43c23          	sd	a5,-40(s0)
    80007bb6:	fd843783          	ld	a5,-40(s0)
    80007bba:	0007c783          	lbu	a5,0(a5)
    80007bbe:	fbe9                	bnez	a5,80007b90 <exec+0x386>
  safestrcpy(p->name, last, sizeof(p->name));
    80007bc0:	f9843783          	ld	a5,-104(s0)
    80007bc4:	17878793          	addi	a5,a5,376
    80007bc8:	4641                	li	a2,16
    80007bca:	fd043583          	ld	a1,-48(s0)
    80007bce:	853e                	mv	a0,a5
    80007bd0:	ffffa097          	auipc	ra,0xffffa
    80007bd4:	b76080e7          	jalr	-1162(ra) # 80001746 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80007bd8:	f9843783          	ld	a5,-104(s0)
    80007bdc:	7bbc                	ld	a5,112(a5)
    80007bde:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    80007be2:	f9843783          	ld	a5,-104(s0)
    80007be6:	fa043703          	ld	a4,-96(s0)
    80007bea:	fbb8                	sd	a4,112(a5)
  p->sz = sz;
    80007bec:	f9843783          	ld	a5,-104(s0)
    80007bf0:	fb843703          	ld	a4,-72(s0)
    80007bf4:	f7b8                	sd	a4,104(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007bf6:	f9843783          	ld	a5,-104(s0)
    80007bfa:	7fbc                	ld	a5,120(a5)
    80007bfc:	e4843703          	ld	a4,-440(s0)
    80007c00:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007c02:	f9843783          	ld	a5,-104(s0)
    80007c06:	7fbc                	ld	a5,120(a5)
    80007c08:	fb043703          	ld	a4,-80(s0)
    80007c0c:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007c0e:	f9043583          	ld	a1,-112(s0)
    80007c12:	f7843503          	ld	a0,-136(s0)
    80007c16:	ffffb097          	auipc	ra,0xffffb
    80007c1a:	f50080e7          	jalr	-176(ra) # 80002b66 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007c1e:	fc043783          	ld	a5,-64(s0)
    80007c22:	2781                	sext.w	a5,a5
    80007c24:	a0bd                	j	80007c92 <exec+0x488>
    goto bad;
    80007c26:	0001                	nop
    80007c28:	a825                	j	80007c60 <exec+0x456>
    goto bad;
    80007c2a:	0001                	nop
    80007c2c:	a815                	j	80007c60 <exec+0x456>
    goto bad;
    80007c2e:	0001                	nop
    80007c30:	a805                	j	80007c60 <exec+0x456>
      goto bad;
    80007c32:	0001                	nop
    80007c34:	a035                	j	80007c60 <exec+0x456>
      goto bad;
    80007c36:	0001                	nop
    80007c38:	a025                	j	80007c60 <exec+0x456>
      goto bad;
    80007c3a:	0001                	nop
    80007c3c:	a015                	j	80007c60 <exec+0x456>
      goto bad;
    80007c3e:	0001                	nop
    80007c40:	a005                	j	80007c60 <exec+0x456>
      goto bad;
    80007c42:	0001                	nop
    80007c44:	a831                	j	80007c60 <exec+0x456>
      goto bad;
    80007c46:	0001                	nop
    80007c48:	a821                	j	80007c60 <exec+0x456>
    goto bad;
    80007c4a:	0001                	nop
    80007c4c:	a811                	j	80007c60 <exec+0x456>
      goto bad;
    80007c4e:	0001                	nop
    80007c50:	a801                	j	80007c60 <exec+0x456>
      goto bad;
    80007c52:	0001                	nop
    80007c54:	a031                	j	80007c60 <exec+0x456>
      goto bad;
    80007c56:	0001                	nop
    80007c58:	a021                	j	80007c60 <exec+0x456>
    goto bad;
    80007c5a:	0001                	nop
    80007c5c:	a011                	j	80007c60 <exec+0x456>
    goto bad;
    80007c5e:	0001                	nop

 bad:
  if(pagetable)
    80007c60:	fa043783          	ld	a5,-96(s0)
    80007c64:	cb89                	beqz	a5,80007c76 <exec+0x46c>
    proc_freepagetable(pagetable, sz);
    80007c66:	fb843583          	ld	a1,-72(s0)
    80007c6a:	fa043503          	ld	a0,-96(s0)
    80007c6e:	ffffb097          	auipc	ra,0xffffb
    80007c72:	ef8080e7          	jalr	-264(ra) # 80002b66 <proc_freepagetable>
  if(ip){
    80007c76:	fa843783          	ld	a5,-88(s0)
    80007c7a:	cb99                	beqz	a5,80007c90 <exec+0x486>
    iunlockput(ip);
    80007c7c:	fa843503          	ld	a0,-88(s0)
    80007c80:	ffffe097          	auipc	ra,0xffffe
    80007c84:	d4e080e7          	jalr	-690(ra) # 800059ce <iunlockput>
    end_op();
    80007c88:	fffff097          	auipc	ra,0xfffff
    80007c8c:	c04080e7          	jalr	-1020(ra) # 8000688c <end_op>
  }
  return -1;
    80007c90:	57fd                	li	a5,-1
}
    80007c92:	853e                	mv	a0,a5
    80007c94:	21813083          	ld	ra,536(sp)
    80007c98:	21013403          	ld	s0,528(sp)
    80007c9c:	20813483          	ld	s1,520(sp)
    80007ca0:	22010113          	addi	sp,sp,544
    80007ca4:	8082                	ret

0000000080007ca6 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    80007ca6:	7139                	addi	sp,sp,-64
    80007ca8:	fc06                	sd	ra,56(sp)
    80007caa:	f822                	sd	s0,48(sp)
    80007cac:	0080                	addi	s0,sp,64
    80007cae:	fca43c23          	sd	a0,-40(s0)
    80007cb2:	fcb43823          	sd	a1,-48(s0)
    80007cb6:	fcc43423          	sd	a2,-56(s0)
    80007cba:	87b6                	mv	a5,a3
    80007cbc:	fcf42223          	sw	a5,-60(s0)
    80007cc0:	87ba                	mv	a5,a4
    80007cc2:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    80007cc6:	fe042623          	sw	zero,-20(s0)
    80007cca:	a05d                	j	80007d70 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    80007ccc:	fec46703          	lwu	a4,-20(s0)
    80007cd0:	fd043783          	ld	a5,-48(s0)
    80007cd4:	97ba                	add	a5,a5,a4
    80007cd6:	85be                	mv	a1,a5
    80007cd8:	fd843503          	ld	a0,-40(s0)
    80007cdc:	ffffa097          	auipc	ra,0xffffa
    80007ce0:	eb8080e7          	jalr	-328(ra) # 80001b94 <walkaddr>
    80007ce4:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80007ce8:	fe043783          	ld	a5,-32(s0)
    80007cec:	eb89                	bnez	a5,80007cfe <loadseg+0x58>
      panic("loadseg: address should exist");
    80007cee:	00004517          	auipc	a0,0x4
    80007cf2:	8fa50513          	addi	a0,a0,-1798 # 8000b5e8 <etext+0x5e8>
    80007cf6:	ffff9097          	auipc	ra,0xffff9
    80007cfa:	f88080e7          	jalr	-120(ra) # 80000c7e <panic>
    if(sz - i < PGSIZE)
    80007cfe:	fc042703          	lw	a4,-64(s0)
    80007d02:	fec42783          	lw	a5,-20(s0)
    80007d06:	40f707bb          	subw	a5,a4,a5
    80007d0a:	2781                	sext.w	a5,a5
    80007d0c:	873e                	mv	a4,a5
    80007d0e:	6785                	lui	a5,0x1
    80007d10:	00f77b63          	bgeu	a4,a5,80007d26 <loadseg+0x80>
      n = sz - i;
    80007d14:	fc042703          	lw	a4,-64(s0)
    80007d18:	fec42783          	lw	a5,-20(s0)
    80007d1c:	40f707bb          	subw	a5,a4,a5
    80007d20:	fef42423          	sw	a5,-24(s0)
    80007d24:	a021                	j	80007d2c <loadseg+0x86>
    else
      n = PGSIZE;
    80007d26:	6785                	lui	a5,0x1
    80007d28:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007d2c:	fc442703          	lw	a4,-60(s0)
    80007d30:	fec42783          	lw	a5,-20(s0)
    80007d34:	9fb9                	addw	a5,a5,a4
    80007d36:	2781                	sext.w	a5,a5
    80007d38:	fe842703          	lw	a4,-24(s0)
    80007d3c:	86be                	mv	a3,a5
    80007d3e:	fe043603          	ld	a2,-32(s0)
    80007d42:	4581                	li	a1,0
    80007d44:	fc843503          	ld	a0,-56(s0)
    80007d48:	ffffe097          	auipc	ra,0xffffe
    80007d4c:	fbe080e7          	jalr	-66(ra) # 80005d06 <readi>
    80007d50:	87aa                	mv	a5,a0
    80007d52:	0007871b          	sext.w	a4,a5
    80007d56:	fe842783          	lw	a5,-24(s0)
    80007d5a:	2781                	sext.w	a5,a5
    80007d5c:	00e78463          	beq	a5,a4,80007d64 <loadseg+0xbe>
      return -1;
    80007d60:	57fd                	li	a5,-1
    80007d62:	a005                	j	80007d82 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    80007d64:	fec42703          	lw	a4,-20(s0)
    80007d68:	6785                	lui	a5,0x1
    80007d6a:	9fb9                	addw	a5,a5,a4
    80007d6c:	fef42623          	sw	a5,-20(s0)
    80007d70:	fec42703          	lw	a4,-20(s0)
    80007d74:	fc042783          	lw	a5,-64(s0)
    80007d78:	2701                	sext.w	a4,a4
    80007d7a:	2781                	sext.w	a5,a5
    80007d7c:	f4f768e3          	bltu	a4,a5,80007ccc <loadseg+0x26>
  }
  
  return 0;
    80007d80:	4781                	li	a5,0
}
    80007d82:	853e                	mv	a0,a5
    80007d84:	70e2                	ld	ra,56(sp)
    80007d86:	7442                	ld	s0,48(sp)
    80007d88:	6121                	addi	sp,sp,64
    80007d8a:	8082                	ret

0000000080007d8c <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80007d8c:	7139                	addi	sp,sp,-64
    80007d8e:	fc06                	sd	ra,56(sp)
    80007d90:	f822                	sd	s0,48(sp)
    80007d92:	0080                	addi	s0,sp,64
    80007d94:	87aa                	mv	a5,a0
    80007d96:	fcb43823          	sd	a1,-48(s0)
    80007d9a:	fcc43423          	sd	a2,-56(s0)
    80007d9e:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80007da2:	fe440713          	addi	a4,s0,-28
    80007da6:	fdc42783          	lw	a5,-36(s0)
    80007daa:	85ba                	mv	a1,a4
    80007dac:	853e                	mv	a0,a5
    80007dae:	ffffd097          	auipc	ra,0xffffd
    80007db2:	994080e7          	jalr	-1644(ra) # 80004742 <argint>
    80007db6:	87aa                	mv	a5,a0
    80007db8:	0007d463          	bgez	a5,80007dc0 <argfd+0x34>
    return -1;
    80007dbc:	57fd                	li	a5,-1
    80007dbe:	a8b1                	j	80007e1a <argfd+0x8e>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007dc0:	fe442783          	lw	a5,-28(s0)
    80007dc4:	0207c863          	bltz	a5,80007df4 <argfd+0x68>
    80007dc8:	fe442783          	lw	a5,-28(s0)
    80007dcc:	873e                	mv	a4,a5
    80007dce:	47bd                	li	a5,15
    80007dd0:	02e7c263          	blt	a5,a4,80007df4 <argfd+0x68>
    80007dd4:	ffffb097          	auipc	ra,0xffffb
    80007dd8:	a40080e7          	jalr	-1472(ra) # 80002814 <myproc>
    80007ddc:	872a                	mv	a4,a0
    80007dde:	fe442783          	lw	a5,-28(s0)
    80007de2:	07f9                	addi	a5,a5,30
    80007de4:	078e                	slli	a5,a5,0x3
    80007de6:	97ba                	add	a5,a5,a4
    80007de8:	639c                	ld	a5,0(a5)
    80007dea:	fef43423          	sd	a5,-24(s0)
    80007dee:	fe843783          	ld	a5,-24(s0)
    80007df2:	e399                	bnez	a5,80007df8 <argfd+0x6c>
    return -1;
    80007df4:	57fd                	li	a5,-1
    80007df6:	a015                	j	80007e1a <argfd+0x8e>
  if(pfd)
    80007df8:	fd043783          	ld	a5,-48(s0)
    80007dfc:	c791                	beqz	a5,80007e08 <argfd+0x7c>
    *pfd = fd;
    80007dfe:	fe442703          	lw	a4,-28(s0)
    80007e02:	fd043783          	ld	a5,-48(s0)
    80007e06:	c398                	sw	a4,0(a5)
  if(pf)
    80007e08:	fc843783          	ld	a5,-56(s0)
    80007e0c:	c791                	beqz	a5,80007e18 <argfd+0x8c>
    *pf = f;
    80007e0e:	fc843783          	ld	a5,-56(s0)
    80007e12:	fe843703          	ld	a4,-24(s0)
    80007e16:	e398                	sd	a4,0(a5)
  return 0;
    80007e18:	4781                	li	a5,0
}
    80007e1a:	853e                	mv	a0,a5
    80007e1c:	70e2                	ld	ra,56(sp)
    80007e1e:	7442                	ld	s0,48(sp)
    80007e20:	6121                	addi	sp,sp,64
    80007e22:	8082                	ret

0000000080007e24 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007e24:	7179                	addi	sp,sp,-48
    80007e26:	f406                	sd	ra,40(sp)
    80007e28:	f022                	sd	s0,32(sp)
    80007e2a:	1800                	addi	s0,sp,48
    80007e2c:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007e30:	ffffb097          	auipc	ra,0xffffb
    80007e34:	9e4080e7          	jalr	-1564(ra) # 80002814 <myproc>
    80007e38:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007e3c:	fe042623          	sw	zero,-20(s0)
    80007e40:	a825                	j	80007e78 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007e42:	fe043703          	ld	a4,-32(s0)
    80007e46:	fec42783          	lw	a5,-20(s0)
    80007e4a:	07f9                	addi	a5,a5,30
    80007e4c:	078e                	slli	a5,a5,0x3
    80007e4e:	97ba                	add	a5,a5,a4
    80007e50:	639c                	ld	a5,0(a5)
    80007e52:	ef91                	bnez	a5,80007e6e <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007e54:	fe043703          	ld	a4,-32(s0)
    80007e58:	fec42783          	lw	a5,-20(s0)
    80007e5c:	07f9                	addi	a5,a5,30
    80007e5e:	078e                	slli	a5,a5,0x3
    80007e60:	97ba                	add	a5,a5,a4
    80007e62:	fd843703          	ld	a4,-40(s0)
    80007e66:	e398                	sd	a4,0(a5)
      return fd;
    80007e68:	fec42783          	lw	a5,-20(s0)
    80007e6c:	a831                	j	80007e88 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007e6e:	fec42783          	lw	a5,-20(s0)
    80007e72:	2785                	addiw	a5,a5,1
    80007e74:	fef42623          	sw	a5,-20(s0)
    80007e78:	fec42783          	lw	a5,-20(s0)
    80007e7c:	0007871b          	sext.w	a4,a5
    80007e80:	47bd                	li	a5,15
    80007e82:	fce7d0e3          	bge	a5,a4,80007e42 <fdalloc+0x1e>
    }
  }
  return -1;
    80007e86:	57fd                	li	a5,-1
}
    80007e88:	853e                	mv	a0,a5
    80007e8a:	70a2                	ld	ra,40(sp)
    80007e8c:	7402                	ld	s0,32(sp)
    80007e8e:	6145                	addi	sp,sp,48
    80007e90:	8082                	ret

0000000080007e92 <sys_dup>:

uint64
sys_dup(void)
{
    80007e92:	1101                	addi	sp,sp,-32
    80007e94:	ec06                	sd	ra,24(sp)
    80007e96:	e822                	sd	s0,16(sp)
    80007e98:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007e9a:	fe040793          	addi	a5,s0,-32
    80007e9e:	863e                	mv	a2,a5
    80007ea0:	4581                	li	a1,0
    80007ea2:	4501                	li	a0,0
    80007ea4:	00000097          	auipc	ra,0x0
    80007ea8:	ee8080e7          	jalr	-280(ra) # 80007d8c <argfd>
    80007eac:	87aa                	mv	a5,a0
    80007eae:	0007d463          	bgez	a5,80007eb6 <sys_dup+0x24>
    return -1;
    80007eb2:	57fd                	li	a5,-1
    80007eb4:	a81d                	j	80007eea <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007eb6:	fe043783          	ld	a5,-32(s0)
    80007eba:	853e                	mv	a0,a5
    80007ebc:	00000097          	auipc	ra,0x0
    80007ec0:	f68080e7          	jalr	-152(ra) # 80007e24 <fdalloc>
    80007ec4:	87aa                	mv	a5,a0
    80007ec6:	fef42623          	sw	a5,-20(s0)
    80007eca:	fec42783          	lw	a5,-20(s0)
    80007ece:	2781                	sext.w	a5,a5
    80007ed0:	0007d463          	bgez	a5,80007ed8 <sys_dup+0x46>
    return -1;
    80007ed4:	57fd                	li	a5,-1
    80007ed6:	a811                	j	80007eea <sys_dup+0x58>
  filedup(f);
    80007ed8:	fe043783          	ld	a5,-32(s0)
    80007edc:	853e                	mv	a0,a5
    80007ede:	fffff097          	auipc	ra,0xfffff
    80007ee2:	f20080e7          	jalr	-224(ra) # 80006dfe <filedup>
  return fd;
    80007ee6:	fec42783          	lw	a5,-20(s0)
}
    80007eea:	853e                	mv	a0,a5
    80007eec:	60e2                	ld	ra,24(sp)
    80007eee:	6442                	ld	s0,16(sp)
    80007ef0:	6105                	addi	sp,sp,32
    80007ef2:	8082                	ret

0000000080007ef4 <sys_read>:

uint64
sys_read(void)
{
    80007ef4:	7179                	addi	sp,sp,-48
    80007ef6:	f406                	sd	ra,40(sp)
    80007ef8:	f022                	sd	s0,32(sp)
    80007efa:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007efc:	fe840793          	addi	a5,s0,-24
    80007f00:	863e                	mv	a2,a5
    80007f02:	4581                	li	a1,0
    80007f04:	4501                	li	a0,0
    80007f06:	00000097          	auipc	ra,0x0
    80007f0a:	e86080e7          	jalr	-378(ra) # 80007d8c <argfd>
    80007f0e:	87aa                	mv	a5,a0
    80007f10:	0207c863          	bltz	a5,80007f40 <sys_read+0x4c>
    80007f14:	fe440793          	addi	a5,s0,-28
    80007f18:	85be                	mv	a1,a5
    80007f1a:	4509                	li	a0,2
    80007f1c:	ffffd097          	auipc	ra,0xffffd
    80007f20:	826080e7          	jalr	-2010(ra) # 80004742 <argint>
    80007f24:	87aa                	mv	a5,a0
    80007f26:	0007cd63          	bltz	a5,80007f40 <sys_read+0x4c>
    80007f2a:	fd840793          	addi	a5,s0,-40
    80007f2e:	85be                	mv	a1,a5
    80007f30:	4505                	li	a0,1
    80007f32:	ffffd097          	auipc	ra,0xffffd
    80007f36:	848080e7          	jalr	-1976(ra) # 8000477a <argaddr>
    80007f3a:	87aa                	mv	a5,a0
    80007f3c:	0007d463          	bgez	a5,80007f44 <sys_read+0x50>
    return -1;
    80007f40:	57fd                	li	a5,-1
    80007f42:	a839                	j	80007f60 <sys_read+0x6c>
  return fileread(f, p, n);
    80007f44:	fe843783          	ld	a5,-24(s0)
    80007f48:	fd843703          	ld	a4,-40(s0)
    80007f4c:	fe442683          	lw	a3,-28(s0)
    80007f50:	8636                	mv	a2,a3
    80007f52:	85ba                	mv	a1,a4
    80007f54:	853e                	mv	a0,a5
    80007f56:	fffff097          	auipc	ra,0xfffff
    80007f5a:	0ba080e7          	jalr	186(ra) # 80007010 <fileread>
    80007f5e:	87aa                	mv	a5,a0
}
    80007f60:	853e                	mv	a0,a5
    80007f62:	70a2                	ld	ra,40(sp)
    80007f64:	7402                	ld	s0,32(sp)
    80007f66:	6145                	addi	sp,sp,48
    80007f68:	8082                	ret

0000000080007f6a <sys_write>:

uint64
sys_write(void)
{
    80007f6a:	7179                	addi	sp,sp,-48
    80007f6c:	f406                	sd	ra,40(sp)
    80007f6e:	f022                	sd	s0,32(sp)
    80007f70:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80007f72:	fe840793          	addi	a5,s0,-24
    80007f76:	863e                	mv	a2,a5
    80007f78:	4581                	li	a1,0
    80007f7a:	4501                	li	a0,0
    80007f7c:	00000097          	auipc	ra,0x0
    80007f80:	e10080e7          	jalr	-496(ra) # 80007d8c <argfd>
    80007f84:	87aa                	mv	a5,a0
    80007f86:	0207c863          	bltz	a5,80007fb6 <sys_write+0x4c>
    80007f8a:	fe440793          	addi	a5,s0,-28
    80007f8e:	85be                	mv	a1,a5
    80007f90:	4509                	li	a0,2
    80007f92:	ffffc097          	auipc	ra,0xffffc
    80007f96:	7b0080e7          	jalr	1968(ra) # 80004742 <argint>
    80007f9a:	87aa                	mv	a5,a0
    80007f9c:	0007cd63          	bltz	a5,80007fb6 <sys_write+0x4c>
    80007fa0:	fd840793          	addi	a5,s0,-40
    80007fa4:	85be                	mv	a1,a5
    80007fa6:	4505                	li	a0,1
    80007fa8:	ffffc097          	auipc	ra,0xffffc
    80007fac:	7d2080e7          	jalr	2002(ra) # 8000477a <argaddr>
    80007fb0:	87aa                	mv	a5,a0
    80007fb2:	0007d463          	bgez	a5,80007fba <sys_write+0x50>
    return -1;
    80007fb6:	57fd                	li	a5,-1
    80007fb8:	a839                	j	80007fd6 <sys_write+0x6c>

  return filewrite(f, p, n);
    80007fba:	fe843783          	ld	a5,-24(s0)
    80007fbe:	fd843703          	ld	a4,-40(s0)
    80007fc2:	fe442683          	lw	a3,-28(s0)
    80007fc6:	8636                	mv	a2,a3
    80007fc8:	85ba                	mv	a1,a4
    80007fca:	853e                	mv	a0,a5
    80007fcc:	fffff097          	auipc	ra,0xfffff
    80007fd0:	1aa080e7          	jalr	426(ra) # 80007176 <filewrite>
    80007fd4:	87aa                	mv	a5,a0
}
    80007fd6:	853e                	mv	a0,a5
    80007fd8:	70a2                	ld	ra,40(sp)
    80007fda:	7402                	ld	s0,32(sp)
    80007fdc:	6145                	addi	sp,sp,48
    80007fde:	8082                	ret

0000000080007fe0 <sys_close>:

uint64
sys_close(void)
{
    80007fe0:	1101                	addi	sp,sp,-32
    80007fe2:	ec06                	sd	ra,24(sp)
    80007fe4:	e822                	sd	s0,16(sp)
    80007fe6:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007fe8:	fe040713          	addi	a4,s0,-32
    80007fec:	fec40793          	addi	a5,s0,-20
    80007ff0:	863a                	mv	a2,a4
    80007ff2:	85be                	mv	a1,a5
    80007ff4:	4501                	li	a0,0
    80007ff6:	00000097          	auipc	ra,0x0
    80007ffa:	d96080e7          	jalr	-618(ra) # 80007d8c <argfd>
    80007ffe:	87aa                	mv	a5,a0
    80008000:	0007d463          	bgez	a5,80008008 <sys_close+0x28>
    return -1;
    80008004:	57fd                	li	a5,-1
    80008006:	a02d                	j	80008030 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80008008:	ffffb097          	auipc	ra,0xffffb
    8000800c:	80c080e7          	jalr	-2036(ra) # 80002814 <myproc>
    80008010:	872a                	mv	a4,a0
    80008012:	fec42783          	lw	a5,-20(s0)
    80008016:	07f9                	addi	a5,a5,30
    80008018:	078e                	slli	a5,a5,0x3
    8000801a:	97ba                	add	a5,a5,a4
    8000801c:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80008020:	fe043783          	ld	a5,-32(s0)
    80008024:	853e                	mv	a0,a5
    80008026:	fffff097          	auipc	ra,0xfffff
    8000802a:	e3e080e7          	jalr	-450(ra) # 80006e64 <fileclose>
  return 0;
    8000802e:	4781                	li	a5,0
}
    80008030:	853e                	mv	a0,a5
    80008032:	60e2                	ld	ra,24(sp)
    80008034:	6442                	ld	s0,16(sp)
    80008036:	6105                	addi	sp,sp,32
    80008038:	8082                	ret

000000008000803a <sys_fstat>:

uint64
sys_fstat(void)
{
    8000803a:	1101                	addi	sp,sp,-32
    8000803c:	ec06                	sd	ra,24(sp)
    8000803e:	e822                	sd	s0,16(sp)
    80008040:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80008042:	fe840793          	addi	a5,s0,-24
    80008046:	863e                	mv	a2,a5
    80008048:	4581                	li	a1,0
    8000804a:	4501                	li	a0,0
    8000804c:	00000097          	auipc	ra,0x0
    80008050:	d40080e7          	jalr	-704(ra) # 80007d8c <argfd>
    80008054:	87aa                	mv	a5,a0
    80008056:	0007cd63          	bltz	a5,80008070 <sys_fstat+0x36>
    8000805a:	fe040793          	addi	a5,s0,-32
    8000805e:	85be                	mv	a1,a5
    80008060:	4505                	li	a0,1
    80008062:	ffffc097          	auipc	ra,0xffffc
    80008066:	718080e7          	jalr	1816(ra) # 8000477a <argaddr>
    8000806a:	87aa                	mv	a5,a0
    8000806c:	0007d463          	bgez	a5,80008074 <sys_fstat+0x3a>
    return -1;
    80008070:	57fd                	li	a5,-1
    80008072:	a821                	j	8000808a <sys_fstat+0x50>
  return filestat(f, st);
    80008074:	fe843783          	ld	a5,-24(s0)
    80008078:	fe043703          	ld	a4,-32(s0)
    8000807c:	85ba                	mv	a1,a4
    8000807e:	853e                	mv	a0,a5
    80008080:	fffff097          	auipc	ra,0xfffff
    80008084:	eec080e7          	jalr	-276(ra) # 80006f6c <filestat>
    80008088:	87aa                	mv	a5,a0
}
    8000808a:	853e                	mv	a0,a5
    8000808c:	60e2                	ld	ra,24(sp)
    8000808e:	6442                	ld	s0,16(sp)
    80008090:	6105                	addi	sp,sp,32
    80008092:	8082                	ret

0000000080008094 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80008094:	7169                	addi	sp,sp,-304
    80008096:	f606                	sd	ra,296(sp)
    80008098:	f222                	sd	s0,288(sp)
    8000809a:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    8000809c:	ed040793          	addi	a5,s0,-304
    800080a0:	08000613          	li	a2,128
    800080a4:	85be                	mv	a1,a5
    800080a6:	4501                	li	a0,0
    800080a8:	ffffc097          	auipc	ra,0xffffc
    800080ac:	706080e7          	jalr	1798(ra) # 800047ae <argstr>
    800080b0:	87aa                	mv	a5,a0
    800080b2:	0007cf63          	bltz	a5,800080d0 <sys_link+0x3c>
    800080b6:	f5040793          	addi	a5,s0,-176
    800080ba:	08000613          	li	a2,128
    800080be:	85be                	mv	a1,a5
    800080c0:	4505                	li	a0,1
    800080c2:	ffffc097          	auipc	ra,0xffffc
    800080c6:	6ec080e7          	jalr	1772(ra) # 800047ae <argstr>
    800080ca:	87aa                	mv	a5,a0
    800080cc:	0007d463          	bgez	a5,800080d4 <sys_link+0x40>
    return -1;
    800080d0:	57fd                	li	a5,-1
    800080d2:	aab5                	j	8000824e <sys_link+0x1ba>

  begin_op();
    800080d4:	ffffe097          	auipc	ra,0xffffe
    800080d8:	6f6080e7          	jalr	1782(ra) # 800067ca <begin_op>
  if((ip = namei(old)) == 0){
    800080dc:	ed040793          	addi	a5,s0,-304
    800080e0:	853e                	mv	a0,a5
    800080e2:	ffffe097          	auipc	ra,0xffffe
    800080e6:	384080e7          	jalr	900(ra) # 80006466 <namei>
    800080ea:	fea43423          	sd	a0,-24(s0)
    800080ee:	fe843783          	ld	a5,-24(s0)
    800080f2:	e799                	bnez	a5,80008100 <sys_link+0x6c>
    end_op();
    800080f4:	ffffe097          	auipc	ra,0xffffe
    800080f8:	798080e7          	jalr	1944(ra) # 8000688c <end_op>
    return -1;
    800080fc:	57fd                	li	a5,-1
    800080fe:	aa81                	j	8000824e <sys_link+0x1ba>
  }

  ilock(ip);
    80008100:	fe843503          	ld	a0,-24(s0)
    80008104:	ffffd097          	auipc	ra,0xffffd
    80008108:	66c080e7          	jalr	1644(ra) # 80005770 <ilock>
  if(ip->type == T_DIR){
    8000810c:	fe843783          	ld	a5,-24(s0)
    80008110:	04479783          	lh	a5,68(a5)
    80008114:	0007871b          	sext.w	a4,a5
    80008118:	4785                	li	a5,1
    8000811a:	00f71e63          	bne	a4,a5,80008136 <sys_link+0xa2>
    iunlockput(ip);
    8000811e:	fe843503          	ld	a0,-24(s0)
    80008122:	ffffe097          	auipc	ra,0xffffe
    80008126:	8ac080e7          	jalr	-1876(ra) # 800059ce <iunlockput>
    end_op();
    8000812a:	ffffe097          	auipc	ra,0xffffe
    8000812e:	762080e7          	jalr	1890(ra) # 8000688c <end_op>
    return -1;
    80008132:	57fd                	li	a5,-1
    80008134:	aa29                	j	8000824e <sys_link+0x1ba>
  }

  ip->nlink++;
    80008136:	fe843783          	ld	a5,-24(s0)
    8000813a:	04a79783          	lh	a5,74(a5)
    8000813e:	17c2                	slli	a5,a5,0x30
    80008140:	93c1                	srli	a5,a5,0x30
    80008142:	2785                	addiw	a5,a5,1
    80008144:	17c2                	slli	a5,a5,0x30
    80008146:	93c1                	srli	a5,a5,0x30
    80008148:	0107971b          	slliw	a4,a5,0x10
    8000814c:	4107571b          	sraiw	a4,a4,0x10
    80008150:	fe843783          	ld	a5,-24(s0)
    80008154:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008158:	fe843503          	ld	a0,-24(s0)
    8000815c:	ffffd097          	auipc	ra,0xffffd
    80008160:	3c4080e7          	jalr	964(ra) # 80005520 <iupdate>
  iunlock(ip);
    80008164:	fe843503          	ld	a0,-24(s0)
    80008168:	ffffd097          	auipc	ra,0xffffd
    8000816c:	73c080e7          	jalr	1852(ra) # 800058a4 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80008170:	fd040713          	addi	a4,s0,-48
    80008174:	f5040793          	addi	a5,s0,-176
    80008178:	85ba                	mv	a1,a4
    8000817a:	853e                	mv	a0,a5
    8000817c:	ffffe097          	auipc	ra,0xffffe
    80008180:	316080e7          	jalr	790(ra) # 80006492 <nameiparent>
    80008184:	fea43023          	sd	a0,-32(s0)
    80008188:	fe043783          	ld	a5,-32(s0)
    8000818c:	cba5                	beqz	a5,800081fc <sys_link+0x168>
    goto bad;
  ilock(dp);
    8000818e:	fe043503          	ld	a0,-32(s0)
    80008192:	ffffd097          	auipc	ra,0xffffd
    80008196:	5de080e7          	jalr	1502(ra) # 80005770 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    8000819a:	fe043783          	ld	a5,-32(s0)
    8000819e:	4398                	lw	a4,0(a5)
    800081a0:	fe843783          	ld	a5,-24(s0)
    800081a4:	439c                	lw	a5,0(a5)
    800081a6:	02f71263          	bne	a4,a5,800081ca <sys_link+0x136>
    800081aa:	fe843783          	ld	a5,-24(s0)
    800081ae:	43d8                	lw	a4,4(a5)
    800081b0:	fd040793          	addi	a5,s0,-48
    800081b4:	863a                	mv	a2,a4
    800081b6:	85be                	mv	a1,a5
    800081b8:	fe043503          	ld	a0,-32(s0)
    800081bc:	ffffe097          	auipc	ra,0xffffe
    800081c0:	f90080e7          	jalr	-112(ra) # 8000614c <dirlink>
    800081c4:	87aa                	mv	a5,a0
    800081c6:	0007d963          	bgez	a5,800081d8 <sys_link+0x144>
    iunlockput(dp);
    800081ca:	fe043503          	ld	a0,-32(s0)
    800081ce:	ffffe097          	auipc	ra,0xffffe
    800081d2:	800080e7          	jalr	-2048(ra) # 800059ce <iunlockput>
    goto bad;
    800081d6:	a025                	j	800081fe <sys_link+0x16a>
  }
  iunlockput(dp);
    800081d8:	fe043503          	ld	a0,-32(s0)
    800081dc:	ffffd097          	auipc	ra,0xffffd
    800081e0:	7f2080e7          	jalr	2034(ra) # 800059ce <iunlockput>
  iput(ip);
    800081e4:	fe843503          	ld	a0,-24(s0)
    800081e8:	ffffd097          	auipc	ra,0xffffd
    800081ec:	716080e7          	jalr	1814(ra) # 800058fe <iput>

  end_op();
    800081f0:	ffffe097          	auipc	ra,0xffffe
    800081f4:	69c080e7          	jalr	1692(ra) # 8000688c <end_op>

  return 0;
    800081f8:	4781                	li	a5,0
    800081fa:	a891                	j	8000824e <sys_link+0x1ba>
    goto bad;
    800081fc:	0001                	nop

bad:
  ilock(ip);
    800081fe:	fe843503          	ld	a0,-24(s0)
    80008202:	ffffd097          	auipc	ra,0xffffd
    80008206:	56e080e7          	jalr	1390(ra) # 80005770 <ilock>
  ip->nlink--;
    8000820a:	fe843783          	ld	a5,-24(s0)
    8000820e:	04a79783          	lh	a5,74(a5)
    80008212:	17c2                	slli	a5,a5,0x30
    80008214:	93c1                	srli	a5,a5,0x30
    80008216:	37fd                	addiw	a5,a5,-1
    80008218:	17c2                	slli	a5,a5,0x30
    8000821a:	93c1                	srli	a5,a5,0x30
    8000821c:	0107971b          	slliw	a4,a5,0x10
    80008220:	4107571b          	sraiw	a4,a4,0x10
    80008224:	fe843783          	ld	a5,-24(s0)
    80008228:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    8000822c:	fe843503          	ld	a0,-24(s0)
    80008230:	ffffd097          	auipc	ra,0xffffd
    80008234:	2f0080e7          	jalr	752(ra) # 80005520 <iupdate>
  iunlockput(ip);
    80008238:	fe843503          	ld	a0,-24(s0)
    8000823c:	ffffd097          	auipc	ra,0xffffd
    80008240:	792080e7          	jalr	1938(ra) # 800059ce <iunlockput>
  end_op();
    80008244:	ffffe097          	auipc	ra,0xffffe
    80008248:	648080e7          	jalr	1608(ra) # 8000688c <end_op>
  return -1;
    8000824c:	57fd                	li	a5,-1
}
    8000824e:	853e                	mv	a0,a5
    80008250:	70b2                	ld	ra,296(sp)
    80008252:	7412                	ld	s0,288(sp)
    80008254:	6155                	addi	sp,sp,304
    80008256:	8082                	ret

0000000080008258 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80008258:	7139                	addi	sp,sp,-64
    8000825a:	fc06                	sd	ra,56(sp)
    8000825c:	f822                	sd	s0,48(sp)
    8000825e:	0080                	addi	s0,sp,64
    80008260:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80008264:	02000793          	li	a5,32
    80008268:	fef42623          	sw	a5,-20(s0)
    8000826c:	a0b1                	j	800082b8 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    8000826e:	fd840793          	addi	a5,s0,-40
    80008272:	fec42683          	lw	a3,-20(s0)
    80008276:	4741                	li	a4,16
    80008278:	863e                	mv	a2,a5
    8000827a:	4581                	li	a1,0
    8000827c:	fc843503          	ld	a0,-56(s0)
    80008280:	ffffe097          	auipc	ra,0xffffe
    80008284:	a86080e7          	jalr	-1402(ra) # 80005d06 <readi>
    80008288:	87aa                	mv	a5,a0
    8000828a:	873e                	mv	a4,a5
    8000828c:	47c1                	li	a5,16
    8000828e:	00f70a63          	beq	a4,a5,800082a2 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80008292:	00003517          	auipc	a0,0x3
    80008296:	37650513          	addi	a0,a0,886 # 8000b608 <etext+0x608>
    8000829a:	ffff9097          	auipc	ra,0xffff9
    8000829e:	9e4080e7          	jalr	-1564(ra) # 80000c7e <panic>
    if(de.inum != 0)
    800082a2:	fd845783          	lhu	a5,-40(s0)
    800082a6:	c399                	beqz	a5,800082ac <isdirempty+0x54>
      return 0;
    800082a8:	4781                	li	a5,0
    800082aa:	a839                	j	800082c8 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    800082ac:	fec42783          	lw	a5,-20(s0)
    800082b0:	27c1                	addiw	a5,a5,16
    800082b2:	2781                	sext.w	a5,a5
    800082b4:	fef42623          	sw	a5,-20(s0)
    800082b8:	fc843783          	ld	a5,-56(s0)
    800082bc:	47f8                	lw	a4,76(a5)
    800082be:	fec42783          	lw	a5,-20(s0)
    800082c2:	fae7e6e3          	bltu	a5,a4,8000826e <isdirempty+0x16>
  }
  return 1;
    800082c6:	4785                	li	a5,1
}
    800082c8:	853e                	mv	a0,a5
    800082ca:	70e2                	ld	ra,56(sp)
    800082cc:	7442                	ld	s0,48(sp)
    800082ce:	6121                	addi	sp,sp,64
    800082d0:	8082                	ret

00000000800082d2 <sys_unlink>:

uint64
sys_unlink(void)
{
    800082d2:	7155                	addi	sp,sp,-208
    800082d4:	e586                	sd	ra,200(sp)
    800082d6:	e1a2                	sd	s0,192(sp)
    800082d8:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    800082da:	f4040793          	addi	a5,s0,-192
    800082de:	08000613          	li	a2,128
    800082e2:	85be                	mv	a1,a5
    800082e4:	4501                	li	a0,0
    800082e6:	ffffc097          	auipc	ra,0xffffc
    800082ea:	4c8080e7          	jalr	1224(ra) # 800047ae <argstr>
    800082ee:	87aa                	mv	a5,a0
    800082f0:	0007d463          	bgez	a5,800082f8 <sys_unlink+0x26>
    return -1;
    800082f4:	57fd                	li	a5,-1
    800082f6:	a2ed                	j	800084e0 <sys_unlink+0x20e>

  begin_op();
    800082f8:	ffffe097          	auipc	ra,0xffffe
    800082fc:	4d2080e7          	jalr	1234(ra) # 800067ca <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80008300:	fc040713          	addi	a4,s0,-64
    80008304:	f4040793          	addi	a5,s0,-192
    80008308:	85ba                	mv	a1,a4
    8000830a:	853e                	mv	a0,a5
    8000830c:	ffffe097          	auipc	ra,0xffffe
    80008310:	186080e7          	jalr	390(ra) # 80006492 <nameiparent>
    80008314:	fea43423          	sd	a0,-24(s0)
    80008318:	fe843783          	ld	a5,-24(s0)
    8000831c:	e799                	bnez	a5,8000832a <sys_unlink+0x58>
    end_op();
    8000831e:	ffffe097          	auipc	ra,0xffffe
    80008322:	56e080e7          	jalr	1390(ra) # 8000688c <end_op>
    return -1;
    80008326:	57fd                	li	a5,-1
    80008328:	aa65                	j	800084e0 <sys_unlink+0x20e>
  }

  ilock(dp);
    8000832a:	fe843503          	ld	a0,-24(s0)
    8000832e:	ffffd097          	auipc	ra,0xffffd
    80008332:	442080e7          	jalr	1090(ra) # 80005770 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80008336:	fc040793          	addi	a5,s0,-64
    8000833a:	00003597          	auipc	a1,0x3
    8000833e:	2e658593          	addi	a1,a1,742 # 8000b620 <etext+0x620>
    80008342:	853e                	mv	a0,a5
    80008344:	ffffe097          	auipc	ra,0xffffe
    80008348:	cf2080e7          	jalr	-782(ra) # 80006036 <namecmp>
    8000834c:	87aa                	mv	a5,a0
    8000834e:	16078b63          	beqz	a5,800084c4 <sys_unlink+0x1f2>
    80008352:	fc040793          	addi	a5,s0,-64
    80008356:	00003597          	auipc	a1,0x3
    8000835a:	2d258593          	addi	a1,a1,722 # 8000b628 <etext+0x628>
    8000835e:	853e                	mv	a0,a5
    80008360:	ffffe097          	auipc	ra,0xffffe
    80008364:	cd6080e7          	jalr	-810(ra) # 80006036 <namecmp>
    80008368:	87aa                	mv	a5,a0
    8000836a:	14078d63          	beqz	a5,800084c4 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    8000836e:	f3c40713          	addi	a4,s0,-196
    80008372:	fc040793          	addi	a5,s0,-64
    80008376:	863a                	mv	a2,a4
    80008378:	85be                	mv	a1,a5
    8000837a:	fe843503          	ld	a0,-24(s0)
    8000837e:	ffffe097          	auipc	ra,0xffffe
    80008382:	ce6080e7          	jalr	-794(ra) # 80006064 <dirlookup>
    80008386:	fea43023          	sd	a0,-32(s0)
    8000838a:	fe043783          	ld	a5,-32(s0)
    8000838e:	12078d63          	beqz	a5,800084c8 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80008392:	fe043503          	ld	a0,-32(s0)
    80008396:	ffffd097          	auipc	ra,0xffffd
    8000839a:	3da080e7          	jalr	986(ra) # 80005770 <ilock>

  if(ip->nlink < 1)
    8000839e:	fe043783          	ld	a5,-32(s0)
    800083a2:	04a79783          	lh	a5,74(a5)
    800083a6:	2781                	sext.w	a5,a5
    800083a8:	00f04a63          	bgtz	a5,800083bc <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    800083ac:	00003517          	auipc	a0,0x3
    800083b0:	28450513          	addi	a0,a0,644 # 8000b630 <etext+0x630>
    800083b4:	ffff9097          	auipc	ra,0xffff9
    800083b8:	8ca080e7          	jalr	-1846(ra) # 80000c7e <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    800083bc:	fe043783          	ld	a5,-32(s0)
    800083c0:	04479783          	lh	a5,68(a5)
    800083c4:	0007871b          	sext.w	a4,a5
    800083c8:	4785                	li	a5,1
    800083ca:	02f71163          	bne	a4,a5,800083ec <sys_unlink+0x11a>
    800083ce:	fe043503          	ld	a0,-32(s0)
    800083d2:	00000097          	auipc	ra,0x0
    800083d6:	e86080e7          	jalr	-378(ra) # 80008258 <isdirempty>
    800083da:	87aa                	mv	a5,a0
    800083dc:	eb81                	bnez	a5,800083ec <sys_unlink+0x11a>
    iunlockput(ip);
    800083de:	fe043503          	ld	a0,-32(s0)
    800083e2:	ffffd097          	auipc	ra,0xffffd
    800083e6:	5ec080e7          	jalr	1516(ra) # 800059ce <iunlockput>
    goto bad;
    800083ea:	a0c5                	j	800084ca <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    800083ec:	fd040793          	addi	a5,s0,-48
    800083f0:	4641                	li	a2,16
    800083f2:	4581                	li	a1,0
    800083f4:	853e                	mv	a0,a5
    800083f6:	ffff9097          	auipc	ra,0xffff9
    800083fa:	04c080e7          	jalr	76(ra) # 80001442 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    800083fe:	fd040793          	addi	a5,s0,-48
    80008402:	f3c42683          	lw	a3,-196(s0)
    80008406:	4741                	li	a4,16
    80008408:	863e                	mv	a2,a5
    8000840a:	4581                	li	a1,0
    8000840c:	fe843503          	ld	a0,-24(s0)
    80008410:	ffffe097          	auipc	ra,0xffffe
    80008414:	a80080e7          	jalr	-1408(ra) # 80005e90 <writei>
    80008418:	87aa                	mv	a5,a0
    8000841a:	873e                	mv	a4,a5
    8000841c:	47c1                	li	a5,16
    8000841e:	00f70a63          	beq	a4,a5,80008432 <sys_unlink+0x160>
    panic("unlink: writei");
    80008422:	00003517          	auipc	a0,0x3
    80008426:	22650513          	addi	a0,a0,550 # 8000b648 <etext+0x648>
    8000842a:	ffff9097          	auipc	ra,0xffff9
    8000842e:	854080e7          	jalr	-1964(ra) # 80000c7e <panic>
  if(ip->type == T_DIR){
    80008432:	fe043783          	ld	a5,-32(s0)
    80008436:	04479783          	lh	a5,68(a5)
    8000843a:	0007871b          	sext.w	a4,a5
    8000843e:	4785                	li	a5,1
    80008440:	02f71963          	bne	a4,a5,80008472 <sys_unlink+0x1a0>
    dp->nlink--;
    80008444:	fe843783          	ld	a5,-24(s0)
    80008448:	04a79783          	lh	a5,74(a5)
    8000844c:	17c2                	slli	a5,a5,0x30
    8000844e:	93c1                	srli	a5,a5,0x30
    80008450:	37fd                	addiw	a5,a5,-1
    80008452:	17c2                	slli	a5,a5,0x30
    80008454:	93c1                	srli	a5,a5,0x30
    80008456:	0107971b          	slliw	a4,a5,0x10
    8000845a:	4107571b          	sraiw	a4,a4,0x10
    8000845e:	fe843783          	ld	a5,-24(s0)
    80008462:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80008466:	fe843503          	ld	a0,-24(s0)
    8000846a:	ffffd097          	auipc	ra,0xffffd
    8000846e:	0b6080e7          	jalr	182(ra) # 80005520 <iupdate>
  }
  iunlockput(dp);
    80008472:	fe843503          	ld	a0,-24(s0)
    80008476:	ffffd097          	auipc	ra,0xffffd
    8000847a:	558080e7          	jalr	1368(ra) # 800059ce <iunlockput>

  ip->nlink--;
    8000847e:	fe043783          	ld	a5,-32(s0)
    80008482:	04a79783          	lh	a5,74(a5)
    80008486:	17c2                	slli	a5,a5,0x30
    80008488:	93c1                	srli	a5,a5,0x30
    8000848a:	37fd                	addiw	a5,a5,-1
    8000848c:	17c2                	slli	a5,a5,0x30
    8000848e:	93c1                	srli	a5,a5,0x30
    80008490:	0107971b          	slliw	a4,a5,0x10
    80008494:	4107571b          	sraiw	a4,a4,0x10
    80008498:	fe043783          	ld	a5,-32(s0)
    8000849c:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800084a0:	fe043503          	ld	a0,-32(s0)
    800084a4:	ffffd097          	auipc	ra,0xffffd
    800084a8:	07c080e7          	jalr	124(ra) # 80005520 <iupdate>
  iunlockput(ip);
    800084ac:	fe043503          	ld	a0,-32(s0)
    800084b0:	ffffd097          	auipc	ra,0xffffd
    800084b4:	51e080e7          	jalr	1310(ra) # 800059ce <iunlockput>

  end_op();
    800084b8:	ffffe097          	auipc	ra,0xffffe
    800084bc:	3d4080e7          	jalr	980(ra) # 8000688c <end_op>

  return 0;
    800084c0:	4781                	li	a5,0
    800084c2:	a839                	j	800084e0 <sys_unlink+0x20e>
    goto bad;
    800084c4:	0001                	nop
    800084c6:	a011                	j	800084ca <sys_unlink+0x1f8>
    goto bad;
    800084c8:	0001                	nop

bad:
  iunlockput(dp);
    800084ca:	fe843503          	ld	a0,-24(s0)
    800084ce:	ffffd097          	auipc	ra,0xffffd
    800084d2:	500080e7          	jalr	1280(ra) # 800059ce <iunlockput>
  end_op();
    800084d6:	ffffe097          	auipc	ra,0xffffe
    800084da:	3b6080e7          	jalr	950(ra) # 8000688c <end_op>
  return -1;
    800084de:	57fd                	li	a5,-1
}
    800084e0:	853e                	mv	a0,a5
    800084e2:	60ae                	ld	ra,200(sp)
    800084e4:	640e                	ld	s0,192(sp)
    800084e6:	6169                	addi	sp,sp,208
    800084e8:	8082                	ret

00000000800084ea <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    800084ea:	7139                	addi	sp,sp,-64
    800084ec:	fc06                	sd	ra,56(sp)
    800084ee:	f822                	sd	s0,48(sp)
    800084f0:	0080                	addi	s0,sp,64
    800084f2:	fca43423          	sd	a0,-56(s0)
    800084f6:	87ae                	mv	a5,a1
    800084f8:	8736                	mv	a4,a3
    800084fa:	fcf41323          	sh	a5,-58(s0)
    800084fe:	87b2                	mv	a5,a2
    80008500:	fcf41223          	sh	a5,-60(s0)
    80008504:	87ba                	mv	a5,a4
    80008506:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    8000850a:	fd040793          	addi	a5,s0,-48
    8000850e:	85be                	mv	a1,a5
    80008510:	fc843503          	ld	a0,-56(s0)
    80008514:	ffffe097          	auipc	ra,0xffffe
    80008518:	f7e080e7          	jalr	-130(ra) # 80006492 <nameiparent>
    8000851c:	fea43423          	sd	a0,-24(s0)
    80008520:	fe843783          	ld	a5,-24(s0)
    80008524:	e399                	bnez	a5,8000852a <create+0x40>
    return 0;
    80008526:	4781                	li	a5,0
    80008528:	a2d9                	j	800086ee <create+0x204>

  ilock(dp);
    8000852a:	fe843503          	ld	a0,-24(s0)
    8000852e:	ffffd097          	auipc	ra,0xffffd
    80008532:	242080e7          	jalr	578(ra) # 80005770 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80008536:	fd040793          	addi	a5,s0,-48
    8000853a:	4601                	li	a2,0
    8000853c:	85be                	mv	a1,a5
    8000853e:	fe843503          	ld	a0,-24(s0)
    80008542:	ffffe097          	auipc	ra,0xffffe
    80008546:	b22080e7          	jalr	-1246(ra) # 80006064 <dirlookup>
    8000854a:	fea43023          	sd	a0,-32(s0)
    8000854e:	fe043783          	ld	a5,-32(s0)
    80008552:	c3ad                	beqz	a5,800085b4 <create+0xca>
    iunlockput(dp);
    80008554:	fe843503          	ld	a0,-24(s0)
    80008558:	ffffd097          	auipc	ra,0xffffd
    8000855c:	476080e7          	jalr	1142(ra) # 800059ce <iunlockput>
    ilock(ip);
    80008560:	fe043503          	ld	a0,-32(s0)
    80008564:	ffffd097          	auipc	ra,0xffffd
    80008568:	20c080e7          	jalr	524(ra) # 80005770 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    8000856c:	fc641783          	lh	a5,-58(s0)
    80008570:	0007871b          	sext.w	a4,a5
    80008574:	4789                	li	a5,2
    80008576:	02f71763          	bne	a4,a5,800085a4 <create+0xba>
    8000857a:	fe043783          	ld	a5,-32(s0)
    8000857e:	04479783          	lh	a5,68(a5)
    80008582:	0007871b          	sext.w	a4,a5
    80008586:	4789                	li	a5,2
    80008588:	00f70b63          	beq	a4,a5,8000859e <create+0xb4>
    8000858c:	fe043783          	ld	a5,-32(s0)
    80008590:	04479783          	lh	a5,68(a5)
    80008594:	0007871b          	sext.w	a4,a5
    80008598:	478d                	li	a5,3
    8000859a:	00f71563          	bne	a4,a5,800085a4 <create+0xba>
      return ip;
    8000859e:	fe043783          	ld	a5,-32(s0)
    800085a2:	a2b1                	j	800086ee <create+0x204>
    iunlockput(ip);
    800085a4:	fe043503          	ld	a0,-32(s0)
    800085a8:	ffffd097          	auipc	ra,0xffffd
    800085ac:	426080e7          	jalr	1062(ra) # 800059ce <iunlockput>
    return 0;
    800085b0:	4781                	li	a5,0
    800085b2:	aa35                	j	800086ee <create+0x204>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    800085b4:	fe843783          	ld	a5,-24(s0)
    800085b8:	439c                	lw	a5,0(a5)
    800085ba:	fc641703          	lh	a4,-58(s0)
    800085be:	85ba                	mv	a1,a4
    800085c0:	853e                	mv	a0,a5
    800085c2:	ffffd097          	auipc	ra,0xffffd
    800085c6:	e62080e7          	jalr	-414(ra) # 80005424 <ialloc>
    800085ca:	fea43023          	sd	a0,-32(s0)
    800085ce:	fe043783          	ld	a5,-32(s0)
    800085d2:	eb89                	bnez	a5,800085e4 <create+0xfa>
    panic("create: ialloc");
    800085d4:	00003517          	auipc	a0,0x3
    800085d8:	08450513          	addi	a0,a0,132 # 8000b658 <etext+0x658>
    800085dc:	ffff8097          	auipc	ra,0xffff8
    800085e0:	6a2080e7          	jalr	1698(ra) # 80000c7e <panic>

  ilock(ip);
    800085e4:	fe043503          	ld	a0,-32(s0)
    800085e8:	ffffd097          	auipc	ra,0xffffd
    800085ec:	188080e7          	jalr	392(ra) # 80005770 <ilock>
  ip->major = major;
    800085f0:	fe043783          	ld	a5,-32(s0)
    800085f4:	fc445703          	lhu	a4,-60(s0)
    800085f8:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    800085fc:	fe043783          	ld	a5,-32(s0)
    80008600:	fc245703          	lhu	a4,-62(s0)
    80008604:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80008608:	fe043783          	ld	a5,-32(s0)
    8000860c:	4705                	li	a4,1
    8000860e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008612:	fe043503          	ld	a0,-32(s0)
    80008616:	ffffd097          	auipc	ra,0xffffd
    8000861a:	f0a080e7          	jalr	-246(ra) # 80005520 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    8000861e:	fc641783          	lh	a5,-58(s0)
    80008622:	0007871b          	sext.w	a4,a5
    80008626:	4785                	li	a5,1
    80008628:	08f71363          	bne	a4,a5,800086ae <create+0x1c4>
    dp->nlink++;  // for ".."
    8000862c:	fe843783          	ld	a5,-24(s0)
    80008630:	04a79783          	lh	a5,74(a5)
    80008634:	17c2                	slli	a5,a5,0x30
    80008636:	93c1                	srli	a5,a5,0x30
    80008638:	2785                	addiw	a5,a5,1
    8000863a:	17c2                	slli	a5,a5,0x30
    8000863c:	93c1                	srli	a5,a5,0x30
    8000863e:	0107971b          	slliw	a4,a5,0x10
    80008642:	4107571b          	sraiw	a4,a4,0x10
    80008646:	fe843783          	ld	a5,-24(s0)
    8000864a:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    8000864e:	fe843503          	ld	a0,-24(s0)
    80008652:	ffffd097          	auipc	ra,0xffffd
    80008656:	ece080e7          	jalr	-306(ra) # 80005520 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    8000865a:	fe043783          	ld	a5,-32(s0)
    8000865e:	43dc                	lw	a5,4(a5)
    80008660:	863e                	mv	a2,a5
    80008662:	00003597          	auipc	a1,0x3
    80008666:	fbe58593          	addi	a1,a1,-66 # 8000b620 <etext+0x620>
    8000866a:	fe043503          	ld	a0,-32(s0)
    8000866e:	ffffe097          	auipc	ra,0xffffe
    80008672:	ade080e7          	jalr	-1314(ra) # 8000614c <dirlink>
    80008676:	87aa                	mv	a5,a0
    80008678:	0207c363          	bltz	a5,8000869e <create+0x1b4>
    8000867c:	fe843783          	ld	a5,-24(s0)
    80008680:	43dc                	lw	a5,4(a5)
    80008682:	863e                	mv	a2,a5
    80008684:	00003597          	auipc	a1,0x3
    80008688:	fa458593          	addi	a1,a1,-92 # 8000b628 <etext+0x628>
    8000868c:	fe043503          	ld	a0,-32(s0)
    80008690:	ffffe097          	auipc	ra,0xffffe
    80008694:	abc080e7          	jalr	-1348(ra) # 8000614c <dirlink>
    80008698:	87aa                	mv	a5,a0
    8000869a:	0007da63          	bgez	a5,800086ae <create+0x1c4>
      panic("create dots");
    8000869e:	00003517          	auipc	a0,0x3
    800086a2:	fca50513          	addi	a0,a0,-54 # 8000b668 <etext+0x668>
    800086a6:	ffff8097          	auipc	ra,0xffff8
    800086aa:	5d8080e7          	jalr	1496(ra) # 80000c7e <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    800086ae:	fe043783          	ld	a5,-32(s0)
    800086b2:	43d8                	lw	a4,4(a5)
    800086b4:	fd040793          	addi	a5,s0,-48
    800086b8:	863a                	mv	a2,a4
    800086ba:	85be                	mv	a1,a5
    800086bc:	fe843503          	ld	a0,-24(s0)
    800086c0:	ffffe097          	auipc	ra,0xffffe
    800086c4:	a8c080e7          	jalr	-1396(ra) # 8000614c <dirlink>
    800086c8:	87aa                	mv	a5,a0
    800086ca:	0007da63          	bgez	a5,800086de <create+0x1f4>
    panic("create: dirlink");
    800086ce:	00003517          	auipc	a0,0x3
    800086d2:	faa50513          	addi	a0,a0,-86 # 8000b678 <etext+0x678>
    800086d6:	ffff8097          	auipc	ra,0xffff8
    800086da:	5a8080e7          	jalr	1448(ra) # 80000c7e <panic>

  iunlockput(dp);
    800086de:	fe843503          	ld	a0,-24(s0)
    800086e2:	ffffd097          	auipc	ra,0xffffd
    800086e6:	2ec080e7          	jalr	748(ra) # 800059ce <iunlockput>

  return ip;
    800086ea:	fe043783          	ld	a5,-32(s0)
}
    800086ee:	853e                	mv	a0,a5
    800086f0:	70e2                	ld	ra,56(sp)
    800086f2:	7442                	ld	s0,48(sp)
    800086f4:	6121                	addi	sp,sp,64
    800086f6:	8082                	ret

00000000800086f8 <sys_open>:

uint64
sys_open(void)
{
    800086f8:	7131                	addi	sp,sp,-192
    800086fa:	fd06                	sd	ra,184(sp)
    800086fc:	f922                	sd	s0,176(sp)
    800086fe:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    80008700:	f5040793          	addi	a5,s0,-176
    80008704:	08000613          	li	a2,128
    80008708:	85be                	mv	a1,a5
    8000870a:	4501                	li	a0,0
    8000870c:	ffffc097          	auipc	ra,0xffffc
    80008710:	0a2080e7          	jalr	162(ra) # 800047ae <argstr>
    80008714:	87aa                	mv	a5,a0
    80008716:	fef42223          	sw	a5,-28(s0)
    8000871a:	fe442783          	lw	a5,-28(s0)
    8000871e:	2781                	sext.w	a5,a5
    80008720:	0007cd63          	bltz	a5,8000873a <sys_open+0x42>
    80008724:	f4c40793          	addi	a5,s0,-180
    80008728:	85be                	mv	a1,a5
    8000872a:	4505                	li	a0,1
    8000872c:	ffffc097          	auipc	ra,0xffffc
    80008730:	016080e7          	jalr	22(ra) # 80004742 <argint>
    80008734:	87aa                	mv	a5,a0
    80008736:	0007d463          	bgez	a5,8000873e <sys_open+0x46>
    return -1;
    8000873a:	57fd                	li	a5,-1
    8000873c:	a429                	j	80008946 <sys_open+0x24e>

  begin_op();
    8000873e:	ffffe097          	auipc	ra,0xffffe
    80008742:	08c080e7          	jalr	140(ra) # 800067ca <begin_op>

  if(omode & O_CREATE){
    80008746:	f4c42783          	lw	a5,-180(s0)
    8000874a:	2007f793          	andi	a5,a5,512
    8000874e:	2781                	sext.w	a5,a5
    80008750:	c795                	beqz	a5,8000877c <sys_open+0x84>
    ip = create(path, T_FILE, 0, 0);
    80008752:	f5040793          	addi	a5,s0,-176
    80008756:	4681                	li	a3,0
    80008758:	4601                	li	a2,0
    8000875a:	4589                	li	a1,2
    8000875c:	853e                	mv	a0,a5
    8000875e:	00000097          	auipc	ra,0x0
    80008762:	d8c080e7          	jalr	-628(ra) # 800084ea <create>
    80008766:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    8000876a:	fe843783          	ld	a5,-24(s0)
    8000876e:	e7bd                	bnez	a5,800087dc <sys_open+0xe4>
      end_op();
    80008770:	ffffe097          	auipc	ra,0xffffe
    80008774:	11c080e7          	jalr	284(ra) # 8000688c <end_op>
      return -1;
    80008778:	57fd                	li	a5,-1
    8000877a:	a2f1                	j	80008946 <sys_open+0x24e>
    }
  } else {
    if((ip = namei(path)) == 0){
    8000877c:	f5040793          	addi	a5,s0,-176
    80008780:	853e                	mv	a0,a5
    80008782:	ffffe097          	auipc	ra,0xffffe
    80008786:	ce4080e7          	jalr	-796(ra) # 80006466 <namei>
    8000878a:	fea43423          	sd	a0,-24(s0)
    8000878e:	fe843783          	ld	a5,-24(s0)
    80008792:	e799                	bnez	a5,800087a0 <sys_open+0xa8>
      end_op();
    80008794:	ffffe097          	auipc	ra,0xffffe
    80008798:	0f8080e7          	jalr	248(ra) # 8000688c <end_op>
      return -1;
    8000879c:	57fd                	li	a5,-1
    8000879e:	a265                	j	80008946 <sys_open+0x24e>
    }
    ilock(ip);
    800087a0:	fe843503          	ld	a0,-24(s0)
    800087a4:	ffffd097          	auipc	ra,0xffffd
    800087a8:	fcc080e7          	jalr	-52(ra) # 80005770 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    800087ac:	fe843783          	ld	a5,-24(s0)
    800087b0:	04479783          	lh	a5,68(a5)
    800087b4:	0007871b          	sext.w	a4,a5
    800087b8:	4785                	li	a5,1
    800087ba:	02f71163          	bne	a4,a5,800087dc <sys_open+0xe4>
    800087be:	f4c42783          	lw	a5,-180(s0)
    800087c2:	cf89                	beqz	a5,800087dc <sys_open+0xe4>
      iunlockput(ip);
    800087c4:	fe843503          	ld	a0,-24(s0)
    800087c8:	ffffd097          	auipc	ra,0xffffd
    800087cc:	206080e7          	jalr	518(ra) # 800059ce <iunlockput>
      end_op();
    800087d0:	ffffe097          	auipc	ra,0xffffe
    800087d4:	0bc080e7          	jalr	188(ra) # 8000688c <end_op>
      return -1;
    800087d8:	57fd                	li	a5,-1
    800087da:	a2b5                	j	80008946 <sys_open+0x24e>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    800087dc:	fe843783          	ld	a5,-24(s0)
    800087e0:	04479783          	lh	a5,68(a5)
    800087e4:	0007871b          	sext.w	a4,a5
    800087e8:	478d                	li	a5,3
    800087ea:	02f71e63          	bne	a4,a5,80008826 <sys_open+0x12e>
    800087ee:	fe843783          	ld	a5,-24(s0)
    800087f2:	04679783          	lh	a5,70(a5)
    800087f6:	2781                	sext.w	a5,a5
    800087f8:	0007cb63          	bltz	a5,8000880e <sys_open+0x116>
    800087fc:	fe843783          	ld	a5,-24(s0)
    80008800:	04679783          	lh	a5,70(a5)
    80008804:	0007871b          	sext.w	a4,a5
    80008808:	47a5                	li	a5,9
    8000880a:	00e7de63          	bge	a5,a4,80008826 <sys_open+0x12e>
    iunlockput(ip);
    8000880e:	fe843503          	ld	a0,-24(s0)
    80008812:	ffffd097          	auipc	ra,0xffffd
    80008816:	1bc080e7          	jalr	444(ra) # 800059ce <iunlockput>
    end_op();
    8000881a:	ffffe097          	auipc	ra,0xffffe
    8000881e:	072080e7          	jalr	114(ra) # 8000688c <end_op>
    return -1;
    80008822:	57fd                	li	a5,-1
    80008824:	a20d                	j	80008946 <sys_open+0x24e>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008826:	ffffe097          	auipc	ra,0xffffe
    8000882a:	554080e7          	jalr	1364(ra) # 80006d7a <filealloc>
    8000882e:	fca43c23          	sd	a0,-40(s0)
    80008832:	fd843783          	ld	a5,-40(s0)
    80008836:	cf99                	beqz	a5,80008854 <sys_open+0x15c>
    80008838:	fd843503          	ld	a0,-40(s0)
    8000883c:	fffff097          	auipc	ra,0xfffff
    80008840:	5e8080e7          	jalr	1512(ra) # 80007e24 <fdalloc>
    80008844:	87aa                	mv	a5,a0
    80008846:	fcf42a23          	sw	a5,-44(s0)
    8000884a:	fd442783          	lw	a5,-44(s0)
    8000884e:	2781                	sext.w	a5,a5
    80008850:	0207d763          	bgez	a5,8000887e <sys_open+0x186>
    if(f)
    80008854:	fd843783          	ld	a5,-40(s0)
    80008858:	c799                	beqz	a5,80008866 <sys_open+0x16e>
      fileclose(f);
    8000885a:	fd843503          	ld	a0,-40(s0)
    8000885e:	ffffe097          	auipc	ra,0xffffe
    80008862:	606080e7          	jalr	1542(ra) # 80006e64 <fileclose>
    iunlockput(ip);
    80008866:	fe843503          	ld	a0,-24(s0)
    8000886a:	ffffd097          	auipc	ra,0xffffd
    8000886e:	164080e7          	jalr	356(ra) # 800059ce <iunlockput>
    end_op();
    80008872:	ffffe097          	auipc	ra,0xffffe
    80008876:	01a080e7          	jalr	26(ra) # 8000688c <end_op>
    return -1;
    8000887a:	57fd                	li	a5,-1
    8000887c:	a0e9                	j	80008946 <sys_open+0x24e>
  }

  if(ip->type == T_DEVICE){
    8000887e:	fe843783          	ld	a5,-24(s0)
    80008882:	04479783          	lh	a5,68(a5)
    80008886:	0007871b          	sext.w	a4,a5
    8000888a:	478d                	li	a5,3
    8000888c:	00f71f63          	bne	a4,a5,800088aa <sys_open+0x1b2>
    f->type = FD_DEVICE;
    80008890:	fd843783          	ld	a5,-40(s0)
    80008894:	470d                	li	a4,3
    80008896:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    80008898:	fe843783          	ld	a5,-24(s0)
    8000889c:	04679703          	lh	a4,70(a5)
    800088a0:	fd843783          	ld	a5,-40(s0)
    800088a4:	02e79223          	sh	a4,36(a5)
    800088a8:	a809                	j	800088ba <sys_open+0x1c2>
  } else {
    f->type = FD_INODE;
    800088aa:	fd843783          	ld	a5,-40(s0)
    800088ae:	4709                	li	a4,2
    800088b0:	c398                	sw	a4,0(a5)
    f->off = 0;
    800088b2:	fd843783          	ld	a5,-40(s0)
    800088b6:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    800088ba:	fd843783          	ld	a5,-40(s0)
    800088be:	fe843703          	ld	a4,-24(s0)
    800088c2:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    800088c4:	f4c42783          	lw	a5,-180(s0)
    800088c8:	8b85                	andi	a5,a5,1
    800088ca:	2781                	sext.w	a5,a5
    800088cc:	0017b793          	seqz	a5,a5
    800088d0:	0ff7f793          	andi	a5,a5,255
    800088d4:	873e                	mv	a4,a5
    800088d6:	fd843783          	ld	a5,-40(s0)
    800088da:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    800088de:	f4c42783          	lw	a5,-180(s0)
    800088e2:	8b85                	andi	a5,a5,1
    800088e4:	2781                	sext.w	a5,a5
    800088e6:	e791                	bnez	a5,800088f2 <sys_open+0x1fa>
    800088e8:	f4c42783          	lw	a5,-180(s0)
    800088ec:	8b89                	andi	a5,a5,2
    800088ee:	2781                	sext.w	a5,a5
    800088f0:	c399                	beqz	a5,800088f6 <sys_open+0x1fe>
    800088f2:	4785                	li	a5,1
    800088f4:	a011                	j	800088f8 <sys_open+0x200>
    800088f6:	4781                	li	a5,0
    800088f8:	0ff7f713          	andi	a4,a5,255
    800088fc:	fd843783          	ld	a5,-40(s0)
    80008900:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    80008904:	f4c42783          	lw	a5,-180(s0)
    80008908:	4007f793          	andi	a5,a5,1024
    8000890c:	2781                	sext.w	a5,a5
    8000890e:	c385                	beqz	a5,8000892e <sys_open+0x236>
    80008910:	fe843783          	ld	a5,-24(s0)
    80008914:	04479783          	lh	a5,68(a5)
    80008918:	0007871b          	sext.w	a4,a5
    8000891c:	4789                	li	a5,2
    8000891e:	00f71863          	bne	a4,a5,8000892e <sys_open+0x236>
    itrunc(ip);
    80008922:	fe843503          	ld	a0,-24(s0)
    80008926:	ffffd097          	auipc	ra,0xffffd
    8000892a:	232080e7          	jalr	562(ra) # 80005b58 <itrunc>
  }

  iunlock(ip);
    8000892e:	fe843503          	ld	a0,-24(s0)
    80008932:	ffffd097          	auipc	ra,0xffffd
    80008936:	f72080e7          	jalr	-142(ra) # 800058a4 <iunlock>
  end_op();
    8000893a:	ffffe097          	auipc	ra,0xffffe
    8000893e:	f52080e7          	jalr	-174(ra) # 8000688c <end_op>

  return fd;
    80008942:	fd442783          	lw	a5,-44(s0)
}
    80008946:	853e                	mv	a0,a5
    80008948:	70ea                	ld	ra,184(sp)
    8000894a:	744a                	ld	s0,176(sp)
    8000894c:	6129                	addi	sp,sp,192
    8000894e:	8082                	ret

0000000080008950 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008950:	7135                	addi	sp,sp,-160
    80008952:	ed06                	sd	ra,152(sp)
    80008954:	e922                	sd	s0,144(sp)
    80008956:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    80008958:	ffffe097          	auipc	ra,0xffffe
    8000895c:	e72080e7          	jalr	-398(ra) # 800067ca <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    80008960:	f6840793          	addi	a5,s0,-152
    80008964:	08000613          	li	a2,128
    80008968:	85be                	mv	a1,a5
    8000896a:	4501                	li	a0,0
    8000896c:	ffffc097          	auipc	ra,0xffffc
    80008970:	e42080e7          	jalr	-446(ra) # 800047ae <argstr>
    80008974:	87aa                	mv	a5,a0
    80008976:	0207c163          	bltz	a5,80008998 <sys_mkdir+0x48>
    8000897a:	f6840793          	addi	a5,s0,-152
    8000897e:	4681                	li	a3,0
    80008980:	4601                	li	a2,0
    80008982:	4585                	li	a1,1
    80008984:	853e                	mv	a0,a5
    80008986:	00000097          	auipc	ra,0x0
    8000898a:	b64080e7          	jalr	-1180(ra) # 800084ea <create>
    8000898e:	fea43423          	sd	a0,-24(s0)
    80008992:	fe843783          	ld	a5,-24(s0)
    80008996:	e799                	bnez	a5,800089a4 <sys_mkdir+0x54>
    end_op();
    80008998:	ffffe097          	auipc	ra,0xffffe
    8000899c:	ef4080e7          	jalr	-268(ra) # 8000688c <end_op>
    return -1;
    800089a0:	57fd                	li	a5,-1
    800089a2:	a821                	j	800089ba <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    800089a4:	fe843503          	ld	a0,-24(s0)
    800089a8:	ffffd097          	auipc	ra,0xffffd
    800089ac:	026080e7          	jalr	38(ra) # 800059ce <iunlockput>
  end_op();
    800089b0:	ffffe097          	auipc	ra,0xffffe
    800089b4:	edc080e7          	jalr	-292(ra) # 8000688c <end_op>
  return 0;
    800089b8:	4781                	li	a5,0
}
    800089ba:	853e                	mv	a0,a5
    800089bc:	60ea                	ld	ra,152(sp)
    800089be:	644a                	ld	s0,144(sp)
    800089c0:	610d                	addi	sp,sp,160
    800089c2:	8082                	ret

00000000800089c4 <sys_mknod>:

uint64
sys_mknod(void)
{
    800089c4:	7135                	addi	sp,sp,-160
    800089c6:	ed06                	sd	ra,152(sp)
    800089c8:	e922                	sd	s0,144(sp)
    800089ca:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    800089cc:	ffffe097          	auipc	ra,0xffffe
    800089d0:	dfe080e7          	jalr	-514(ra) # 800067ca <begin_op>
  if((argstr(0, path, MAXPATH)) < 0 ||
    800089d4:	f6840793          	addi	a5,s0,-152
    800089d8:	08000613          	li	a2,128
    800089dc:	85be                	mv	a1,a5
    800089de:	4501                	li	a0,0
    800089e0:	ffffc097          	auipc	ra,0xffffc
    800089e4:	dce080e7          	jalr	-562(ra) # 800047ae <argstr>
    800089e8:	87aa                	mv	a5,a0
    800089ea:	0607c263          	bltz	a5,80008a4e <sys_mknod+0x8a>
     argint(1, &major) < 0 ||
    800089ee:	f6440793          	addi	a5,s0,-156
    800089f2:	85be                	mv	a1,a5
    800089f4:	4505                	li	a0,1
    800089f6:	ffffc097          	auipc	ra,0xffffc
    800089fa:	d4c080e7          	jalr	-692(ra) # 80004742 <argint>
    800089fe:	87aa                	mv	a5,a0
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008a00:	0407c763          	bltz	a5,80008a4e <sys_mknod+0x8a>
     argint(2, &minor) < 0 ||
    80008a04:	f6040793          	addi	a5,s0,-160
    80008a08:	85be                	mv	a1,a5
    80008a0a:	4509                	li	a0,2
    80008a0c:	ffffc097          	auipc	ra,0xffffc
    80008a10:	d36080e7          	jalr	-714(ra) # 80004742 <argint>
    80008a14:	87aa                	mv	a5,a0
     argint(1, &major) < 0 ||
    80008a16:	0207cc63          	bltz	a5,80008a4e <sys_mknod+0x8a>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    80008a1a:	f6442783          	lw	a5,-156(s0)
    80008a1e:	0107971b          	slliw	a4,a5,0x10
    80008a22:	4107571b          	sraiw	a4,a4,0x10
    80008a26:	f6042783          	lw	a5,-160(s0)
    80008a2a:	0107969b          	slliw	a3,a5,0x10
    80008a2e:	4106d69b          	sraiw	a3,a3,0x10
    80008a32:	f6840793          	addi	a5,s0,-152
    80008a36:	863a                	mv	a2,a4
    80008a38:	458d                	li	a1,3
    80008a3a:	853e                	mv	a0,a5
    80008a3c:	00000097          	auipc	ra,0x0
    80008a40:	aae080e7          	jalr	-1362(ra) # 800084ea <create>
    80008a44:	fea43423          	sd	a0,-24(s0)
     argint(2, &minor) < 0 ||
    80008a48:	fe843783          	ld	a5,-24(s0)
    80008a4c:	e799                	bnez	a5,80008a5a <sys_mknod+0x96>
    end_op();
    80008a4e:	ffffe097          	auipc	ra,0xffffe
    80008a52:	e3e080e7          	jalr	-450(ra) # 8000688c <end_op>
    return -1;
    80008a56:	57fd                	li	a5,-1
    80008a58:	a821                	j	80008a70 <sys_mknod+0xac>
  }
  iunlockput(ip);
    80008a5a:	fe843503          	ld	a0,-24(s0)
    80008a5e:	ffffd097          	auipc	ra,0xffffd
    80008a62:	f70080e7          	jalr	-144(ra) # 800059ce <iunlockput>
  end_op();
    80008a66:	ffffe097          	auipc	ra,0xffffe
    80008a6a:	e26080e7          	jalr	-474(ra) # 8000688c <end_op>
  return 0;
    80008a6e:	4781                	li	a5,0
}
    80008a70:	853e                	mv	a0,a5
    80008a72:	60ea                	ld	ra,152(sp)
    80008a74:	644a                	ld	s0,144(sp)
    80008a76:	610d                	addi	sp,sp,160
    80008a78:	8082                	ret

0000000080008a7a <sys_chdir>:

uint64
sys_chdir(void)
{
    80008a7a:	7135                	addi	sp,sp,-160
    80008a7c:	ed06                	sd	ra,152(sp)
    80008a7e:	e922                	sd	s0,144(sp)
    80008a80:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    80008a82:	ffffa097          	auipc	ra,0xffffa
    80008a86:	d92080e7          	jalr	-622(ra) # 80002814 <myproc>
    80008a8a:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    80008a8e:	ffffe097          	auipc	ra,0xffffe
    80008a92:	d3c080e7          	jalr	-708(ra) # 800067ca <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    80008a96:	f6040793          	addi	a5,s0,-160
    80008a9a:	08000613          	li	a2,128
    80008a9e:	85be                	mv	a1,a5
    80008aa0:	4501                	li	a0,0
    80008aa2:	ffffc097          	auipc	ra,0xffffc
    80008aa6:	d0c080e7          	jalr	-756(ra) # 800047ae <argstr>
    80008aaa:	87aa                	mv	a5,a0
    80008aac:	0007ce63          	bltz	a5,80008ac8 <sys_chdir+0x4e>
    80008ab0:	f6040793          	addi	a5,s0,-160
    80008ab4:	853e                	mv	a0,a5
    80008ab6:	ffffe097          	auipc	ra,0xffffe
    80008aba:	9b0080e7          	jalr	-1616(ra) # 80006466 <namei>
    80008abe:	fea43023          	sd	a0,-32(s0)
    80008ac2:	fe043783          	ld	a5,-32(s0)
    80008ac6:	e799                	bnez	a5,80008ad4 <sys_chdir+0x5a>
    end_op();
    80008ac8:	ffffe097          	auipc	ra,0xffffe
    80008acc:	dc4080e7          	jalr	-572(ra) # 8000688c <end_op>
    return -1;
    80008ad0:	57fd                	li	a5,-1
    80008ad2:	a0b5                	j	80008b3e <sys_chdir+0xc4>
  }
  ilock(ip);
    80008ad4:	fe043503          	ld	a0,-32(s0)
    80008ad8:	ffffd097          	auipc	ra,0xffffd
    80008adc:	c98080e7          	jalr	-872(ra) # 80005770 <ilock>
  if(ip->type != T_DIR){
    80008ae0:	fe043783          	ld	a5,-32(s0)
    80008ae4:	04479783          	lh	a5,68(a5)
    80008ae8:	0007871b          	sext.w	a4,a5
    80008aec:	4785                	li	a5,1
    80008aee:	00f70e63          	beq	a4,a5,80008b0a <sys_chdir+0x90>
    iunlockput(ip);
    80008af2:	fe043503          	ld	a0,-32(s0)
    80008af6:	ffffd097          	auipc	ra,0xffffd
    80008afa:	ed8080e7          	jalr	-296(ra) # 800059ce <iunlockput>
    end_op();
    80008afe:	ffffe097          	auipc	ra,0xffffe
    80008b02:	d8e080e7          	jalr	-626(ra) # 8000688c <end_op>
    return -1;
    80008b06:	57fd                	li	a5,-1
    80008b08:	a81d                	j	80008b3e <sys_chdir+0xc4>
  }
  iunlock(ip);
    80008b0a:	fe043503          	ld	a0,-32(s0)
    80008b0e:	ffffd097          	auipc	ra,0xffffd
    80008b12:	d96080e7          	jalr	-618(ra) # 800058a4 <iunlock>
  iput(p->cwd);
    80008b16:	fe843783          	ld	a5,-24(s0)
    80008b1a:	1707b783          	ld	a5,368(a5)
    80008b1e:	853e                	mv	a0,a5
    80008b20:	ffffd097          	auipc	ra,0xffffd
    80008b24:	dde080e7          	jalr	-546(ra) # 800058fe <iput>
  end_op();
    80008b28:	ffffe097          	auipc	ra,0xffffe
    80008b2c:	d64080e7          	jalr	-668(ra) # 8000688c <end_op>
  p->cwd = ip;
    80008b30:	fe843783          	ld	a5,-24(s0)
    80008b34:	fe043703          	ld	a4,-32(s0)
    80008b38:	16e7b823          	sd	a4,368(a5)
  return 0;
    80008b3c:	4781                	li	a5,0
}
    80008b3e:	853e                	mv	a0,a5
    80008b40:	60ea                	ld	ra,152(sp)
    80008b42:	644a                	ld	s0,144(sp)
    80008b44:	610d                	addi	sp,sp,160
    80008b46:	8082                	ret

0000000080008b48 <sys_exec>:

uint64
sys_exec(void)
{
    80008b48:	7161                	addi	sp,sp,-432
    80008b4a:	f706                	sd	ra,424(sp)
    80008b4c:	f322                	sd	s0,416(sp)
    80008b4e:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    80008b50:	f6840793          	addi	a5,s0,-152
    80008b54:	08000613          	li	a2,128
    80008b58:	85be                	mv	a1,a5
    80008b5a:	4501                	li	a0,0
    80008b5c:	ffffc097          	auipc	ra,0xffffc
    80008b60:	c52080e7          	jalr	-942(ra) # 800047ae <argstr>
    80008b64:	87aa                	mv	a5,a0
    80008b66:	0007cd63          	bltz	a5,80008b80 <sys_exec+0x38>
    80008b6a:	e6040793          	addi	a5,s0,-416
    80008b6e:	85be                	mv	a1,a5
    80008b70:	4505                	li	a0,1
    80008b72:	ffffc097          	auipc	ra,0xffffc
    80008b76:	c08080e7          	jalr	-1016(ra) # 8000477a <argaddr>
    80008b7a:	87aa                	mv	a5,a0
    80008b7c:	0007d463          	bgez	a5,80008b84 <sys_exec+0x3c>
    return -1;
    80008b80:	57fd                	li	a5,-1
    80008b82:	a249                	j	80008d04 <sys_exec+0x1bc>
  }
  memset(argv, 0, sizeof(argv));
    80008b84:	e6840793          	addi	a5,s0,-408
    80008b88:	10000613          	li	a2,256
    80008b8c:	4581                	li	a1,0
    80008b8e:	853e                	mv	a0,a5
    80008b90:	ffff9097          	auipc	ra,0xffff9
    80008b94:	8b2080e7          	jalr	-1870(ra) # 80001442 <memset>
  for(i=0;; i++){
    80008b98:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    80008b9c:	fec42783          	lw	a5,-20(s0)
    80008ba0:	873e                	mv	a4,a5
    80008ba2:	47fd                	li	a5,31
    80008ba4:	10e7e463          	bltu	a5,a4,80008cac <sys_exec+0x164>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80008ba8:	fec42783          	lw	a5,-20(s0)
    80008bac:	00379713          	slli	a4,a5,0x3
    80008bb0:	e6043783          	ld	a5,-416(s0)
    80008bb4:	97ba                	add	a5,a5,a4
    80008bb6:	e5840713          	addi	a4,s0,-424
    80008bba:	85ba                	mv	a1,a4
    80008bbc:	853e                	mv	a0,a5
    80008bbe:	ffffc097          	auipc	ra,0xffffc
    80008bc2:	a06080e7          	jalr	-1530(ra) # 800045c4 <fetchaddr>
    80008bc6:	87aa                	mv	a5,a0
    80008bc8:	0e07c463          	bltz	a5,80008cb0 <sys_exec+0x168>
      goto bad;
    }
    if(uarg == 0){
    80008bcc:	e5843783          	ld	a5,-424(s0)
    80008bd0:	eb95                	bnez	a5,80008c04 <sys_exec+0xbc>
      argv[i] = 0;
    80008bd2:	fec42783          	lw	a5,-20(s0)
    80008bd6:	078e                	slli	a5,a5,0x3
    80008bd8:	ff040713          	addi	a4,s0,-16
    80008bdc:	97ba                	add	a5,a5,a4
    80008bde:	e607bc23          	sd	zero,-392(a5)
      break;
    80008be2:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    80008be4:	e6840713          	addi	a4,s0,-408
    80008be8:	f6840793          	addi	a5,s0,-152
    80008bec:	85ba                	mv	a1,a4
    80008bee:	853e                	mv	a0,a5
    80008bf0:	fffff097          	auipc	ra,0xfffff
    80008bf4:	c1a080e7          	jalr	-998(ra) # 8000780a <exec>
    80008bf8:	87aa                	mv	a5,a0
    80008bfa:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008bfe:	fe042623          	sw	zero,-20(s0)
    80008c02:	a059                	j	80008c88 <sys_exec+0x140>
    argv[i] = kalloc();
    80008c04:	ffff8097          	auipc	ra,0xffff8
    80008c08:	516080e7          	jalr	1302(ra) # 8000111a <kalloc>
    80008c0c:	872a                	mv	a4,a0
    80008c0e:	fec42783          	lw	a5,-20(s0)
    80008c12:	078e                	slli	a5,a5,0x3
    80008c14:	ff040693          	addi	a3,s0,-16
    80008c18:	97b6                	add	a5,a5,a3
    80008c1a:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80008c1e:	fec42783          	lw	a5,-20(s0)
    80008c22:	078e                	slli	a5,a5,0x3
    80008c24:	ff040713          	addi	a4,s0,-16
    80008c28:	97ba                	add	a5,a5,a4
    80008c2a:	e787b783          	ld	a5,-392(a5)
    80008c2e:	c3d9                	beqz	a5,80008cb4 <sys_exec+0x16c>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008c30:	e5843703          	ld	a4,-424(s0)
    80008c34:	fec42783          	lw	a5,-20(s0)
    80008c38:	078e                	slli	a5,a5,0x3
    80008c3a:	ff040693          	addi	a3,s0,-16
    80008c3e:	97b6                	add	a5,a5,a3
    80008c40:	e787b783          	ld	a5,-392(a5)
    80008c44:	6605                	lui	a2,0x1
    80008c46:	85be                	mv	a1,a5
    80008c48:	853a                	mv	a0,a4
    80008c4a:	ffffc097          	auipc	ra,0xffffc
    80008c4e:	9e8080e7          	jalr	-1560(ra) # 80004632 <fetchstr>
    80008c52:	87aa                	mv	a5,a0
    80008c54:	0607c263          	bltz	a5,80008cb8 <sys_exec+0x170>
  for(i=0;; i++){
    80008c58:	fec42783          	lw	a5,-20(s0)
    80008c5c:	2785                	addiw	a5,a5,1
    80008c5e:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    80008c62:	bf2d                	j	80008b9c <sys_exec+0x54>
    kfree(argv[i]);
    80008c64:	fec42783          	lw	a5,-20(s0)
    80008c68:	078e                	slli	a5,a5,0x3
    80008c6a:	ff040713          	addi	a4,s0,-16
    80008c6e:	97ba                	add	a5,a5,a4
    80008c70:	e787b783          	ld	a5,-392(a5)
    80008c74:	853e                	mv	a0,a5
    80008c76:	ffff8097          	auipc	ra,0xffff8
    80008c7a:	400080e7          	jalr	1024(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008c7e:	fec42783          	lw	a5,-20(s0)
    80008c82:	2785                	addiw	a5,a5,1
    80008c84:	fef42623          	sw	a5,-20(s0)
    80008c88:	fec42783          	lw	a5,-20(s0)
    80008c8c:	873e                	mv	a4,a5
    80008c8e:	47fd                	li	a5,31
    80008c90:	00e7eb63          	bltu	a5,a4,80008ca6 <sys_exec+0x15e>
    80008c94:	fec42783          	lw	a5,-20(s0)
    80008c98:	078e                	slli	a5,a5,0x3
    80008c9a:	ff040713          	addi	a4,s0,-16
    80008c9e:	97ba                	add	a5,a5,a4
    80008ca0:	e787b783          	ld	a5,-392(a5)
    80008ca4:	f3e1                	bnez	a5,80008c64 <sys_exec+0x11c>

  return ret;
    80008ca6:	fe842783          	lw	a5,-24(s0)
    80008caa:	a8a9                	j	80008d04 <sys_exec+0x1bc>
      goto bad;
    80008cac:	0001                	nop
    80008cae:	a031                	j	80008cba <sys_exec+0x172>
      goto bad;
    80008cb0:	0001                	nop
    80008cb2:	a021                	j	80008cba <sys_exec+0x172>
      goto bad;
    80008cb4:	0001                	nop
    80008cb6:	a011                	j	80008cba <sys_exec+0x172>
      goto bad;
    80008cb8:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008cba:	fe042623          	sw	zero,-20(s0)
    80008cbe:	a01d                	j	80008ce4 <sys_exec+0x19c>
    kfree(argv[i]);
    80008cc0:	fec42783          	lw	a5,-20(s0)
    80008cc4:	078e                	slli	a5,a5,0x3
    80008cc6:	ff040713          	addi	a4,s0,-16
    80008cca:	97ba                	add	a5,a5,a4
    80008ccc:	e787b783          	ld	a5,-392(a5)
    80008cd0:	853e                	mv	a0,a5
    80008cd2:	ffff8097          	auipc	ra,0xffff8
    80008cd6:	3a4080e7          	jalr	932(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008cda:	fec42783          	lw	a5,-20(s0)
    80008cde:	2785                	addiw	a5,a5,1
    80008ce0:	fef42623          	sw	a5,-20(s0)
    80008ce4:	fec42783          	lw	a5,-20(s0)
    80008ce8:	873e                	mv	a4,a5
    80008cea:	47fd                	li	a5,31
    80008cec:	00e7eb63          	bltu	a5,a4,80008d02 <sys_exec+0x1ba>
    80008cf0:	fec42783          	lw	a5,-20(s0)
    80008cf4:	078e                	slli	a5,a5,0x3
    80008cf6:	ff040713          	addi	a4,s0,-16
    80008cfa:	97ba                	add	a5,a5,a4
    80008cfc:	e787b783          	ld	a5,-392(a5)
    80008d00:	f3e1                	bnez	a5,80008cc0 <sys_exec+0x178>
  return -1;
    80008d02:	57fd                	li	a5,-1
}
    80008d04:	853e                	mv	a0,a5
    80008d06:	70ba                	ld	ra,424(sp)
    80008d08:	741a                	ld	s0,416(sp)
    80008d0a:	615d                	addi	sp,sp,432
    80008d0c:	8082                	ret

0000000080008d0e <sys_pipe>:

uint64
sys_pipe(void)
{
    80008d0e:	7139                	addi	sp,sp,-64
    80008d10:	fc06                	sd	ra,56(sp)
    80008d12:	f822                	sd	s0,48(sp)
    80008d14:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008d16:	ffffa097          	auipc	ra,0xffffa
    80008d1a:	afe080e7          	jalr	-1282(ra) # 80002814 <myproc>
    80008d1e:	fea43423          	sd	a0,-24(s0)

  if(argaddr(0, &fdarray) < 0)
    80008d22:	fe040793          	addi	a5,s0,-32
    80008d26:	85be                	mv	a1,a5
    80008d28:	4501                	li	a0,0
    80008d2a:	ffffc097          	auipc	ra,0xffffc
    80008d2e:	a50080e7          	jalr	-1456(ra) # 8000477a <argaddr>
    80008d32:	87aa                	mv	a5,a0
    80008d34:	0007d463          	bgez	a5,80008d3c <sys_pipe+0x2e>
    return -1;
    80008d38:	57fd                	li	a5,-1
    80008d3a:	a215                	j	80008e5e <sys_pipe+0x150>
  if(pipealloc(&rf, &wf) < 0)
    80008d3c:	fd040713          	addi	a4,s0,-48
    80008d40:	fd840793          	addi	a5,s0,-40
    80008d44:	85ba                	mv	a1,a4
    80008d46:	853e                	mv	a0,a5
    80008d48:	ffffe097          	auipc	ra,0xffffe
    80008d4c:	632080e7          	jalr	1586(ra) # 8000737a <pipealloc>
    80008d50:	87aa                	mv	a5,a0
    80008d52:	0007d463          	bgez	a5,80008d5a <sys_pipe+0x4c>
    return -1;
    80008d56:	57fd                	li	a5,-1
    80008d58:	a219                	j	80008e5e <sys_pipe+0x150>
  fd0 = -1;
    80008d5a:	57fd                	li	a5,-1
    80008d5c:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008d60:	fd843783          	ld	a5,-40(s0)
    80008d64:	853e                	mv	a0,a5
    80008d66:	fffff097          	auipc	ra,0xfffff
    80008d6a:	0be080e7          	jalr	190(ra) # 80007e24 <fdalloc>
    80008d6e:	87aa                	mv	a5,a0
    80008d70:	fcf42623          	sw	a5,-52(s0)
    80008d74:	fcc42783          	lw	a5,-52(s0)
    80008d78:	0207c063          	bltz	a5,80008d98 <sys_pipe+0x8a>
    80008d7c:	fd043783          	ld	a5,-48(s0)
    80008d80:	853e                	mv	a0,a5
    80008d82:	fffff097          	auipc	ra,0xfffff
    80008d86:	0a2080e7          	jalr	162(ra) # 80007e24 <fdalloc>
    80008d8a:	87aa                	mv	a5,a0
    80008d8c:	fcf42423          	sw	a5,-56(s0)
    80008d90:	fc842783          	lw	a5,-56(s0)
    80008d94:	0207df63          	bgez	a5,80008dd2 <sys_pipe+0xc4>
    if(fd0 >= 0)
    80008d98:	fcc42783          	lw	a5,-52(s0)
    80008d9c:	0007cb63          	bltz	a5,80008db2 <sys_pipe+0xa4>
      p->ofile[fd0] = 0;
    80008da0:	fcc42783          	lw	a5,-52(s0)
    80008da4:	fe843703          	ld	a4,-24(s0)
    80008da8:	07f9                	addi	a5,a5,30
    80008daa:	078e                	slli	a5,a5,0x3
    80008dac:	97ba                	add	a5,a5,a4
    80008dae:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008db2:	fd843783          	ld	a5,-40(s0)
    80008db6:	853e                	mv	a0,a5
    80008db8:	ffffe097          	auipc	ra,0xffffe
    80008dbc:	0ac080e7          	jalr	172(ra) # 80006e64 <fileclose>
    fileclose(wf);
    80008dc0:	fd043783          	ld	a5,-48(s0)
    80008dc4:	853e                	mv	a0,a5
    80008dc6:	ffffe097          	auipc	ra,0xffffe
    80008dca:	09e080e7          	jalr	158(ra) # 80006e64 <fileclose>
    return -1;
    80008dce:	57fd                	li	a5,-1
    80008dd0:	a079                	j	80008e5e <sys_pipe+0x150>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008dd2:	fe843783          	ld	a5,-24(s0)
    80008dd6:	7bbc                	ld	a5,112(a5)
    80008dd8:	fe043703          	ld	a4,-32(s0)
    80008ddc:	fcc40613          	addi	a2,s0,-52
    80008de0:	4691                	li	a3,4
    80008de2:	85ba                	mv	a1,a4
    80008de4:	853e                	mv	a0,a5
    80008de6:	ffff9097          	auipc	ra,0xffff9
    80008dea:	500080e7          	jalr	1280(ra) # 800022e6 <copyout>
    80008dee:	87aa                	mv	a5,a0
    80008df0:	0207c463          	bltz	a5,80008e18 <sys_pipe+0x10a>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008df4:	fe843783          	ld	a5,-24(s0)
    80008df8:	7bb8                	ld	a4,112(a5)
    80008dfa:	fe043783          	ld	a5,-32(s0)
    80008dfe:	0791                	addi	a5,a5,4
    80008e00:	fc840613          	addi	a2,s0,-56
    80008e04:	4691                	li	a3,4
    80008e06:	85be                	mv	a1,a5
    80008e08:	853a                	mv	a0,a4
    80008e0a:	ffff9097          	auipc	ra,0xffff9
    80008e0e:	4dc080e7          	jalr	1244(ra) # 800022e6 <copyout>
    80008e12:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008e14:	0407d463          	bgez	a5,80008e5c <sys_pipe+0x14e>
    p->ofile[fd0] = 0;
    80008e18:	fcc42783          	lw	a5,-52(s0)
    80008e1c:	fe843703          	ld	a4,-24(s0)
    80008e20:	07f9                	addi	a5,a5,30
    80008e22:	078e                	slli	a5,a5,0x3
    80008e24:	97ba                	add	a5,a5,a4
    80008e26:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008e2a:	fc842783          	lw	a5,-56(s0)
    80008e2e:	fe843703          	ld	a4,-24(s0)
    80008e32:	07f9                	addi	a5,a5,30
    80008e34:	078e                	slli	a5,a5,0x3
    80008e36:	97ba                	add	a5,a5,a4
    80008e38:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008e3c:	fd843783          	ld	a5,-40(s0)
    80008e40:	853e                	mv	a0,a5
    80008e42:	ffffe097          	auipc	ra,0xffffe
    80008e46:	022080e7          	jalr	34(ra) # 80006e64 <fileclose>
    fileclose(wf);
    80008e4a:	fd043783          	ld	a5,-48(s0)
    80008e4e:	853e                	mv	a0,a5
    80008e50:	ffffe097          	auipc	ra,0xffffe
    80008e54:	014080e7          	jalr	20(ra) # 80006e64 <fileclose>
    return -1;
    80008e58:	57fd                	li	a5,-1
    80008e5a:	a011                	j	80008e5e <sys_pipe+0x150>
  }
  return 0;
    80008e5c:	4781                	li	a5,0
}
    80008e5e:	853e                	mv	a0,a5
    80008e60:	70e2                	ld	ra,56(sp)
    80008e62:	7442                	ld	s0,48(sp)
    80008e64:	6121                	addi	sp,sp,64
    80008e66:	8082                	ret
	...

0000000080008e70 <kernelvec>:
    80008e70:	7111                	addi	sp,sp,-256
    80008e72:	e006                	sd	ra,0(sp)
    80008e74:	e40a                	sd	sp,8(sp)
    80008e76:	e80e                	sd	gp,16(sp)
    80008e78:	ec12                	sd	tp,24(sp)
    80008e7a:	f016                	sd	t0,32(sp)
    80008e7c:	f41a                	sd	t1,40(sp)
    80008e7e:	f81e                	sd	t2,48(sp)
    80008e80:	fc22                	sd	s0,56(sp)
    80008e82:	e0a6                	sd	s1,64(sp)
    80008e84:	e4aa                	sd	a0,72(sp)
    80008e86:	e8ae                	sd	a1,80(sp)
    80008e88:	ecb2                	sd	a2,88(sp)
    80008e8a:	f0b6                	sd	a3,96(sp)
    80008e8c:	f4ba                	sd	a4,104(sp)
    80008e8e:	f8be                	sd	a5,112(sp)
    80008e90:	fcc2                	sd	a6,120(sp)
    80008e92:	e146                	sd	a7,128(sp)
    80008e94:	e54a                	sd	s2,136(sp)
    80008e96:	e94e                	sd	s3,144(sp)
    80008e98:	ed52                	sd	s4,152(sp)
    80008e9a:	f156                	sd	s5,160(sp)
    80008e9c:	f55a                	sd	s6,168(sp)
    80008e9e:	f95e                	sd	s7,176(sp)
    80008ea0:	fd62                	sd	s8,184(sp)
    80008ea2:	e1e6                	sd	s9,192(sp)
    80008ea4:	e5ea                	sd	s10,200(sp)
    80008ea6:	e9ee                	sd	s11,208(sp)
    80008ea8:	edf2                	sd	t3,216(sp)
    80008eaa:	f1f6                	sd	t4,224(sp)
    80008eac:	f5fa                	sd	t5,232(sp)
    80008eae:	f9fe                	sd	t6,240(sp)
    80008eb0:	bd0fb0ef          	jal	ra,80004280 <kerneltrap>
    80008eb4:	6082                	ld	ra,0(sp)
    80008eb6:	6122                	ld	sp,8(sp)
    80008eb8:	61c2                	ld	gp,16(sp)
    80008eba:	7282                	ld	t0,32(sp)
    80008ebc:	7322                	ld	t1,40(sp)
    80008ebe:	73c2                	ld	t2,48(sp)
    80008ec0:	7462                	ld	s0,56(sp)
    80008ec2:	6486                	ld	s1,64(sp)
    80008ec4:	6526                	ld	a0,72(sp)
    80008ec6:	65c6                	ld	a1,80(sp)
    80008ec8:	6666                	ld	a2,88(sp)
    80008eca:	7686                	ld	a3,96(sp)
    80008ecc:	7726                	ld	a4,104(sp)
    80008ece:	77c6                	ld	a5,112(sp)
    80008ed0:	7866                	ld	a6,120(sp)
    80008ed2:	688a                	ld	a7,128(sp)
    80008ed4:	692a                	ld	s2,136(sp)
    80008ed6:	69ca                	ld	s3,144(sp)
    80008ed8:	6a6a                	ld	s4,152(sp)
    80008eda:	7a8a                	ld	s5,160(sp)
    80008edc:	7b2a                	ld	s6,168(sp)
    80008ede:	7bca                	ld	s7,176(sp)
    80008ee0:	7c6a                	ld	s8,184(sp)
    80008ee2:	6c8e                	ld	s9,192(sp)
    80008ee4:	6d2e                	ld	s10,200(sp)
    80008ee6:	6dce                	ld	s11,208(sp)
    80008ee8:	6e6e                	ld	t3,216(sp)
    80008eea:	7e8e                	ld	t4,224(sp)
    80008eec:	7f2e                	ld	t5,232(sp)
    80008eee:	7fce                	ld	t6,240(sp)
    80008ef0:	6111                	addi	sp,sp,256
    80008ef2:	10200073          	sret
    80008ef6:	00000013          	nop
    80008efa:	00000013          	nop
    80008efe:	0001                	nop

0000000080008f00 <timervec>:
    80008f00:	34051573          	csrrw	a0,mscratch,a0
    80008f04:	e10c                	sd	a1,0(a0)
    80008f06:	e510                	sd	a2,8(a0)
    80008f08:	e914                	sd	a3,16(a0)
    80008f0a:	6d0c                	ld	a1,24(a0)
    80008f0c:	7110                	ld	a2,32(a0)
    80008f0e:	6194                	ld	a3,0(a1)
    80008f10:	96b2                	add	a3,a3,a2
    80008f12:	e194                	sd	a3,0(a1)
    80008f14:	4589                	li	a1,2
    80008f16:	14459073          	csrw	sip,a1
    80008f1a:	6914                	ld	a3,16(a0)
    80008f1c:	6510                	ld	a2,8(a0)
    80008f1e:	610c                	ld	a1,0(a0)
    80008f20:	34051573          	csrrw	a0,mscratch,a0
    80008f24:	30200073          	mret
	...

0000000080008f2a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008f2a:	1141                	addi	sp,sp,-16
    80008f2c:	e422                	sd	s0,8(sp)
    80008f2e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008f30:	0c0007b7          	lui	a5,0xc000
    80008f34:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008f38:	4705                	li	a4,1
    80008f3a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008f3c:	0c0007b7          	lui	a5,0xc000
    80008f40:	0791                	addi	a5,a5,4
    80008f42:	4705                	li	a4,1
    80008f44:	c398                	sw	a4,0(a5)
}
    80008f46:	0001                	nop
    80008f48:	6422                	ld	s0,8(sp)
    80008f4a:	0141                	addi	sp,sp,16
    80008f4c:	8082                	ret

0000000080008f4e <plicinithart>:

void
plicinithart(void)
{
    80008f4e:	1101                	addi	sp,sp,-32
    80008f50:	ec06                	sd	ra,24(sp)
    80008f52:	e822                	sd	s0,16(sp)
    80008f54:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008f56:	ffffa097          	auipc	ra,0xffffa
    80008f5a:	860080e7          	jalr	-1952(ra) # 800027b6 <cpuid>
    80008f5e:	87aa                	mv	a5,a0
    80008f60:	fef42623          	sw	a5,-20(s0)
  
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    80008f64:	fec42783          	lw	a5,-20(s0)
    80008f68:	0087979b          	slliw	a5,a5,0x8
    80008f6c:	2781                	sext.w	a5,a5
    80008f6e:	873e                	mv	a4,a5
    80008f70:	0c0027b7          	lui	a5,0xc002
    80008f74:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008f78:	97ba                	add	a5,a5,a4
    80008f7a:	873e                	mv	a4,a5
    80008f7c:	40200793          	li	a5,1026
    80008f80:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008f82:	fec42783          	lw	a5,-20(s0)
    80008f86:	00d7979b          	slliw	a5,a5,0xd
    80008f8a:	2781                	sext.w	a5,a5
    80008f8c:	873e                	mv	a4,a5
    80008f8e:	0c2017b7          	lui	a5,0xc201
    80008f92:	97ba                	add	a5,a5,a4
    80008f94:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008f98:	0001                	nop
    80008f9a:	60e2                	ld	ra,24(sp)
    80008f9c:	6442                	ld	s0,16(sp)
    80008f9e:	6105                	addi	sp,sp,32
    80008fa0:	8082                	ret

0000000080008fa2 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008fa2:	1101                	addi	sp,sp,-32
    80008fa4:	ec06                	sd	ra,24(sp)
    80008fa6:	e822                	sd	s0,16(sp)
    80008fa8:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008faa:	ffffa097          	auipc	ra,0xffffa
    80008fae:	80c080e7          	jalr	-2036(ra) # 800027b6 <cpuid>
    80008fb2:	87aa                	mv	a5,a0
    80008fb4:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008fb8:	fec42783          	lw	a5,-20(s0)
    80008fbc:	00d7979b          	slliw	a5,a5,0xd
    80008fc0:	2781                	sext.w	a5,a5
    80008fc2:	873e                	mv	a4,a5
    80008fc4:	0c2017b7          	lui	a5,0xc201
    80008fc8:	0791                	addi	a5,a5,4
    80008fca:	97ba                	add	a5,a5,a4
    80008fcc:	439c                	lw	a5,0(a5)
    80008fce:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008fd2:	fe842783          	lw	a5,-24(s0)
}
    80008fd6:	853e                	mv	a0,a5
    80008fd8:	60e2                	ld	ra,24(sp)
    80008fda:	6442                	ld	s0,16(sp)
    80008fdc:	6105                	addi	sp,sp,32
    80008fde:	8082                	ret

0000000080008fe0 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008fe0:	7179                	addi	sp,sp,-48
    80008fe2:	f406                	sd	ra,40(sp)
    80008fe4:	f022                	sd	s0,32(sp)
    80008fe6:	1800                	addi	s0,sp,48
    80008fe8:	87aa                	mv	a5,a0
    80008fea:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008fee:	ffff9097          	auipc	ra,0xffff9
    80008ff2:	7c8080e7          	jalr	1992(ra) # 800027b6 <cpuid>
    80008ff6:	87aa                	mv	a5,a0
    80008ff8:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008ffc:	fec42783          	lw	a5,-20(s0)
    80009000:	00d7979b          	slliw	a5,a5,0xd
    80009004:	2781                	sext.w	a5,a5
    80009006:	873e                	mv	a4,a5
    80009008:	0c2017b7          	lui	a5,0xc201
    8000900c:	0791                	addi	a5,a5,4
    8000900e:	97ba                	add	a5,a5,a4
    80009010:	873e                	mv	a4,a5
    80009012:	fdc42783          	lw	a5,-36(s0)
    80009016:	c31c                	sw	a5,0(a4)
}
    80009018:	0001                	nop
    8000901a:	70a2                	ld	ra,40(sp)
    8000901c:	7402                	ld	s0,32(sp)
    8000901e:	6145                	addi	sp,sp,48
    80009020:	8082                	ret

0000000080009022 <virtio_disk_init>:
  
} __attribute__ ((aligned (PGSIZE))) disk;

void
virtio_disk_init(void)
{
    80009022:	7179                	addi	sp,sp,-48
    80009024:	f406                	sd	ra,40(sp)
    80009026:	f022                	sd	s0,32(sp)
    80009028:	1800                	addi	s0,sp,48
  uint32 status = 0;
    8000902a:	fe042423          	sw	zero,-24(s0)

  initlock(&disk.vdisk_lock, "virtio_disk");
    8000902e:	00002597          	auipc	a1,0x2
    80009032:	65a58593          	addi	a1,a1,1626 # 8000b688 <etext+0x688>
    80009036:	0001f517          	auipc	a0,0x1f
    8000903a:	0f250513          	addi	a0,a0,242 # 80028128 <disk+0x2128>
    8000903e:	ffff8097          	auipc	ra,0xffff8
    80009042:	200080e7          	jalr	512(ra) # 8000123e <initlock>

  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80009046:	100017b7          	lui	a5,0x10001
    8000904a:	439c                	lw	a5,0(a5)
    8000904c:	2781                	sext.w	a5,a5
    8000904e:	873e                	mv	a4,a5
    80009050:	747277b7          	lui	a5,0x74727
    80009054:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80009058:	04f71063          	bne	a4,a5,80009098 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    8000905c:	100017b7          	lui	a5,0x10001
    80009060:	0791                	addi	a5,a5,4
    80009062:	439c                	lw	a5,0(a5)
    80009064:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80009066:	873e                	mv	a4,a5
    80009068:	4785                	li	a5,1
    8000906a:	02f71763          	bne	a4,a5,80009098 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    8000906e:	100017b7          	lui	a5,0x10001
    80009072:	07a1                	addi	a5,a5,8
    80009074:	439c                	lw	a5,0(a5)
    80009076:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80009078:	873e                	mv	a4,a5
    8000907a:	4789                	li	a5,2
    8000907c:	00f71e63          	bne	a4,a5,80009098 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80009080:	100017b7          	lui	a5,0x10001
    80009084:	07b1                	addi	a5,a5,12
    80009086:	439c                	lw	a5,0(a5)
    80009088:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    8000908a:	873e                	mv	a4,a5
    8000908c:	554d47b7          	lui	a5,0x554d4
    80009090:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80009094:	00f70a63          	beq	a4,a5,800090a8 <virtio_disk_init+0x86>
    panic("could not find virtio disk");
    80009098:	00002517          	auipc	a0,0x2
    8000909c:	60050513          	addi	a0,a0,1536 # 8000b698 <etext+0x698>
    800090a0:	ffff8097          	auipc	ra,0xffff8
    800090a4:	bde080e7          	jalr	-1058(ra) # 80000c7e <panic>
  }
  
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    800090a8:	fe842783          	lw	a5,-24(s0)
    800090ac:	0017e793          	ori	a5,a5,1
    800090b0:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    800090b4:	100017b7          	lui	a5,0x10001
    800090b8:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    800090bc:	fe842703          	lw	a4,-24(s0)
    800090c0:	c398                	sw	a4,0(a5)

  status |= VIRTIO_CONFIG_S_DRIVER;
    800090c2:	fe842783          	lw	a5,-24(s0)
    800090c6:	0027e793          	ori	a5,a5,2
    800090ca:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    800090ce:	100017b7          	lui	a5,0x10001
    800090d2:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    800090d6:	fe842703          	lw	a4,-24(s0)
    800090da:	c398                	sw	a4,0(a5)

  // negotiate features
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    800090dc:	100017b7          	lui	a5,0x10001
    800090e0:	07c1                	addi	a5,a5,16
    800090e2:	439c                	lw	a5,0(a5)
    800090e4:	2781                	sext.w	a5,a5
    800090e6:	1782                	slli	a5,a5,0x20
    800090e8:	9381                	srli	a5,a5,0x20
    800090ea:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    800090ee:	fe043783          	ld	a5,-32(s0)
    800090f2:	fdf7f793          	andi	a5,a5,-33
    800090f6:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    800090fa:	fe043783          	ld	a5,-32(s0)
    800090fe:	f7f7f793          	andi	a5,a5,-129
    80009102:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80009106:	fe043703          	ld	a4,-32(s0)
    8000910a:	77fd                	lui	a5,0xfffff
    8000910c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffd67ff>
    80009110:	8ff9                	and	a5,a5,a4
    80009112:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80009116:	fe043703          	ld	a4,-32(s0)
    8000911a:	77fd                	lui	a5,0xfffff
    8000911c:	17fd                	addi	a5,a5,-1
    8000911e:	8ff9                	and	a5,a5,a4
    80009120:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80009124:	fe043703          	ld	a4,-32(s0)
    80009128:	f80007b7          	lui	a5,0xf8000
    8000912c:	17fd                	addi	a5,a5,-1
    8000912e:	8ff9                	and	a5,a5,a4
    80009130:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80009134:	fe043703          	ld	a4,-32(s0)
    80009138:	e00007b7          	lui	a5,0xe0000
    8000913c:	17fd                	addi	a5,a5,-1
    8000913e:	8ff9                	and	a5,a5,a4
    80009140:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80009144:	fe043703          	ld	a4,-32(s0)
    80009148:	f00007b7          	lui	a5,0xf0000
    8000914c:	17fd                	addi	a5,a5,-1
    8000914e:	8ff9                	and	a5,a5,a4
    80009150:	fef43023          	sd	a5,-32(s0)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80009154:	100017b7          	lui	a5,0x10001
    80009158:	02078793          	addi	a5,a5,32 # 10001020 <_entry-0x6fffefe0>
    8000915c:	fe043703          	ld	a4,-32(s0)
    80009160:	2701                	sext.w	a4,a4
    80009162:	c398                	sw	a4,0(a5)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80009164:	fe842783          	lw	a5,-24(s0)
    80009168:	0087e793          	ori	a5,a5,8
    8000916c:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80009170:	100017b7          	lui	a5,0x10001
    80009174:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80009178:	fe842703          	lw	a4,-24(s0)
    8000917c:	c398                	sw	a4,0(a5)

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    8000917e:	fe842783          	lw	a5,-24(s0)
    80009182:	0047e793          	ori	a5,a5,4
    80009186:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    8000918a:	100017b7          	lui	a5,0x10001
    8000918e:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80009192:	fe842703          	lw	a4,-24(s0)
    80009196:	c398                	sw	a4,0(a5)

  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80009198:	100017b7          	lui	a5,0x10001
    8000919c:	02878793          	addi	a5,a5,40 # 10001028 <_entry-0x6fffefd8>
    800091a0:	6705                	lui	a4,0x1
    800091a2:	c398                	sw	a4,0(a5)

  // initialize queue 0.
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    800091a4:	100017b7          	lui	a5,0x10001
    800091a8:	03078793          	addi	a5,a5,48 # 10001030 <_entry-0x6fffefd0>
    800091ac:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    800091b0:	100017b7          	lui	a5,0x10001
    800091b4:	03478793          	addi	a5,a5,52 # 10001034 <_entry-0x6fffefcc>
    800091b8:	439c                	lw	a5,0(a5)
    800091ba:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    800091be:	fdc42783          	lw	a5,-36(s0)
    800091c2:	2781                	sext.w	a5,a5
    800091c4:	eb89                	bnez	a5,800091d6 <virtio_disk_init+0x1b4>
    panic("virtio disk has no queue 0");
    800091c6:	00002517          	auipc	a0,0x2
    800091ca:	4f250513          	addi	a0,a0,1266 # 8000b6b8 <etext+0x6b8>
    800091ce:	ffff8097          	auipc	ra,0xffff8
    800091d2:	ab0080e7          	jalr	-1360(ra) # 80000c7e <panic>
  if(max < NUM)
    800091d6:	fdc42783          	lw	a5,-36(s0)
    800091da:	0007871b          	sext.w	a4,a5
    800091de:	479d                	li	a5,7
    800091e0:	00e7ea63          	bltu	a5,a4,800091f4 <virtio_disk_init+0x1d2>
    panic("virtio disk max queue too short");
    800091e4:	00002517          	auipc	a0,0x2
    800091e8:	4f450513          	addi	a0,a0,1268 # 8000b6d8 <etext+0x6d8>
    800091ec:	ffff8097          	auipc	ra,0xffff8
    800091f0:	a92080e7          	jalr	-1390(ra) # 80000c7e <panic>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    800091f4:	100017b7          	lui	a5,0x10001
    800091f8:	03878793          	addi	a5,a5,56 # 10001038 <_entry-0x6fffefc8>
    800091fc:	4721                	li	a4,8
    800091fe:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80009200:	6609                	lui	a2,0x2
    80009202:	4581                	li	a1,0
    80009204:	0001d517          	auipc	a0,0x1d
    80009208:	dfc50513          	addi	a0,a0,-516 # 80026000 <disk>
    8000920c:	ffff8097          	auipc	ra,0xffff8
    80009210:	236080e7          	jalr	566(ra) # 80001442 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80009214:	0001d797          	auipc	a5,0x1d
    80009218:	dec78793          	addi	a5,a5,-532 # 80026000 <disk>
    8000921c:	00c7d713          	srli	a4,a5,0xc
    80009220:	100017b7          	lui	a5,0x10001
    80009224:	04078793          	addi	a5,a5,64 # 10001040 <_entry-0x6fffefc0>
    80009228:	2701                	sext.w	a4,a4
    8000922a:	c398                	sw	a4,0(a5)

  // desc = pages -- num * virtq_desc
  // avail = pages + 0x40 -- 2 * uint16, then num * uint16
  // used = pages + 4096 -- 2 * uint16, then num * vRingUsedElem

  disk.desc = (struct virtq_desc *) disk.pages;
    8000922c:	0001d717          	auipc	a4,0x1d
    80009230:	dd470713          	addi	a4,a4,-556 # 80026000 <disk>
    80009234:	6789                	lui	a5,0x2
    80009236:	97ba                	add	a5,a5,a4
    80009238:	0001d717          	auipc	a4,0x1d
    8000923c:	dc870713          	addi	a4,a4,-568 # 80026000 <disk>
    80009240:	e398                	sd	a4,0(a5)
  disk.avail = (struct virtq_avail *)(disk.pages + NUM*sizeof(struct virtq_desc));
    80009242:	0001d717          	auipc	a4,0x1d
    80009246:	e3e70713          	addi	a4,a4,-450 # 80026080 <disk+0x80>
    8000924a:	0001d697          	auipc	a3,0x1d
    8000924e:	db668693          	addi	a3,a3,-586 # 80026000 <disk>
    80009252:	6789                	lui	a5,0x2
    80009254:	97b6                	add	a5,a5,a3
    80009256:	e798                	sd	a4,8(a5)
  disk.used = (struct virtq_used *) (disk.pages + PGSIZE);
    80009258:	0001e717          	auipc	a4,0x1e
    8000925c:	da870713          	addi	a4,a4,-600 # 80027000 <disk+0x1000>
    80009260:	0001d697          	auipc	a3,0x1d
    80009264:	da068693          	addi	a3,a3,-608 # 80026000 <disk>
    80009268:	6789                	lui	a5,0x2
    8000926a:	97b6                	add	a5,a5,a3
    8000926c:	eb98                	sd	a4,16(a5)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    8000926e:	fe042623          	sw	zero,-20(s0)
    80009272:	a015                	j	80009296 <virtio_disk_init+0x274>
    disk.free[i] = 1;
    80009274:	0001d717          	auipc	a4,0x1d
    80009278:	d8c70713          	addi	a4,a4,-628 # 80026000 <disk>
    8000927c:	fec42783          	lw	a5,-20(s0)
    80009280:	97ba                	add	a5,a5,a4
    80009282:	6709                	lui	a4,0x2
    80009284:	97ba                	add	a5,a5,a4
    80009286:	4705                	li	a4,1
    80009288:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x7fffdfe8>
  for(int i = 0; i < NUM; i++)
    8000928c:	fec42783          	lw	a5,-20(s0)
    80009290:	2785                	addiw	a5,a5,1
    80009292:	fef42623          	sw	a5,-20(s0)
    80009296:	fec42783          	lw	a5,-20(s0)
    8000929a:	0007871b          	sext.w	a4,a5
    8000929e:	479d                	li	a5,7
    800092a0:	fce7dae3          	bge	a5,a4,80009274 <virtio_disk_init+0x252>

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ.
}
    800092a4:	0001                	nop
    800092a6:	0001                	nop
    800092a8:	70a2                	ld	ra,40(sp)
    800092aa:	7402                	ld	s0,32(sp)
    800092ac:	6145                	addi	sp,sp,48
    800092ae:	8082                	ret

00000000800092b0 <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc()
{
    800092b0:	1101                	addi	sp,sp,-32
    800092b2:	ec22                	sd	s0,24(sp)
    800092b4:	1000                	addi	s0,sp,32
  for(int i = 0; i < NUM; i++){
    800092b6:	fe042623          	sw	zero,-20(s0)
    800092ba:	a081                	j	800092fa <alloc_desc+0x4a>
    if(disk.free[i]){
    800092bc:	0001d717          	auipc	a4,0x1d
    800092c0:	d4470713          	addi	a4,a4,-700 # 80026000 <disk>
    800092c4:	fec42783          	lw	a5,-20(s0)
    800092c8:	97ba                	add	a5,a5,a4
    800092ca:	6709                	lui	a4,0x2
    800092cc:	97ba                	add	a5,a5,a4
    800092ce:	0187c783          	lbu	a5,24(a5)
    800092d2:	cf99                	beqz	a5,800092f0 <alloc_desc+0x40>
      disk.free[i] = 0;
    800092d4:	0001d717          	auipc	a4,0x1d
    800092d8:	d2c70713          	addi	a4,a4,-724 # 80026000 <disk>
    800092dc:	fec42783          	lw	a5,-20(s0)
    800092e0:	97ba                	add	a5,a5,a4
    800092e2:	6709                	lui	a4,0x2
    800092e4:	97ba                	add	a5,a5,a4
    800092e6:	00078c23          	sb	zero,24(a5)
      return i;
    800092ea:	fec42783          	lw	a5,-20(s0)
    800092ee:	a831                	j	8000930a <alloc_desc+0x5a>
  for(int i = 0; i < NUM; i++){
    800092f0:	fec42783          	lw	a5,-20(s0)
    800092f4:	2785                	addiw	a5,a5,1
    800092f6:	fef42623          	sw	a5,-20(s0)
    800092fa:	fec42783          	lw	a5,-20(s0)
    800092fe:	0007871b          	sext.w	a4,a5
    80009302:	479d                	li	a5,7
    80009304:	fae7dce3          	bge	a5,a4,800092bc <alloc_desc+0xc>
    }
  }
  return -1;
    80009308:	57fd                	li	a5,-1
}
    8000930a:	853e                	mv	a0,a5
    8000930c:	6462                	ld	s0,24(sp)
    8000930e:	6105                	addi	sp,sp,32
    80009310:	8082                	ret

0000000080009312 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int i)
{
    80009312:	1101                	addi	sp,sp,-32
    80009314:	ec06                	sd	ra,24(sp)
    80009316:	e822                	sd	s0,16(sp)
    80009318:	1000                	addi	s0,sp,32
    8000931a:	87aa                	mv	a5,a0
    8000931c:	fef42623          	sw	a5,-20(s0)
  if(i >= NUM)
    80009320:	fec42783          	lw	a5,-20(s0)
    80009324:	0007871b          	sext.w	a4,a5
    80009328:	479d                	li	a5,7
    8000932a:	00e7da63          	bge	a5,a4,8000933e <free_desc+0x2c>
    panic("free_desc 1");
    8000932e:	00002517          	auipc	a0,0x2
    80009332:	3ca50513          	addi	a0,a0,970 # 8000b6f8 <etext+0x6f8>
    80009336:	ffff8097          	auipc	ra,0xffff8
    8000933a:	948080e7          	jalr	-1720(ra) # 80000c7e <panic>
  if(disk.free[i])
    8000933e:	0001d717          	auipc	a4,0x1d
    80009342:	cc270713          	addi	a4,a4,-830 # 80026000 <disk>
    80009346:	fec42783          	lw	a5,-20(s0)
    8000934a:	97ba                	add	a5,a5,a4
    8000934c:	6709                	lui	a4,0x2
    8000934e:	97ba                	add	a5,a5,a4
    80009350:	0187c783          	lbu	a5,24(a5)
    80009354:	cb89                	beqz	a5,80009366 <free_desc+0x54>
    panic("free_desc 2");
    80009356:	00002517          	auipc	a0,0x2
    8000935a:	3b250513          	addi	a0,a0,946 # 8000b708 <etext+0x708>
    8000935e:	ffff8097          	auipc	ra,0xffff8
    80009362:	920080e7          	jalr	-1760(ra) # 80000c7e <panic>
  disk.desc[i].addr = 0;
    80009366:	0001d717          	auipc	a4,0x1d
    8000936a:	c9a70713          	addi	a4,a4,-870 # 80026000 <disk>
    8000936e:	6789                	lui	a5,0x2
    80009370:	97ba                	add	a5,a5,a4
    80009372:	6398                	ld	a4,0(a5)
    80009374:	fec42783          	lw	a5,-20(s0)
    80009378:	0792                	slli	a5,a5,0x4
    8000937a:	97ba                	add	a5,a5,a4
    8000937c:	0007b023          	sd	zero,0(a5) # 2000 <_entry-0x7fffe000>
  disk.desc[i].len = 0;
    80009380:	0001d717          	auipc	a4,0x1d
    80009384:	c8070713          	addi	a4,a4,-896 # 80026000 <disk>
    80009388:	6789                	lui	a5,0x2
    8000938a:	97ba                	add	a5,a5,a4
    8000938c:	6398                	ld	a4,0(a5)
    8000938e:	fec42783          	lw	a5,-20(s0)
    80009392:	0792                	slli	a5,a5,0x4
    80009394:	97ba                	add	a5,a5,a4
    80009396:	0007a423          	sw	zero,8(a5) # 2008 <_entry-0x7fffdff8>
  disk.desc[i].flags = 0;
    8000939a:	0001d717          	auipc	a4,0x1d
    8000939e:	c6670713          	addi	a4,a4,-922 # 80026000 <disk>
    800093a2:	6789                	lui	a5,0x2
    800093a4:	97ba                	add	a5,a5,a4
    800093a6:	6398                	ld	a4,0(a5)
    800093a8:	fec42783          	lw	a5,-20(s0)
    800093ac:	0792                	slli	a5,a5,0x4
    800093ae:	97ba                	add	a5,a5,a4
    800093b0:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[i].next = 0;
    800093b4:	0001d717          	auipc	a4,0x1d
    800093b8:	c4c70713          	addi	a4,a4,-948 # 80026000 <disk>
    800093bc:	6789                	lui	a5,0x2
    800093be:	97ba                	add	a5,a5,a4
    800093c0:	6398                	ld	a4,0(a5)
    800093c2:	fec42783          	lw	a5,-20(s0)
    800093c6:	0792                	slli	a5,a5,0x4
    800093c8:	97ba                	add	a5,a5,a4
    800093ca:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>
  disk.free[i] = 1;
    800093ce:	0001d717          	auipc	a4,0x1d
    800093d2:	c3270713          	addi	a4,a4,-974 # 80026000 <disk>
    800093d6:	fec42783          	lw	a5,-20(s0)
    800093da:	97ba                	add	a5,a5,a4
    800093dc:	6709                	lui	a4,0x2
    800093de:	97ba                	add	a5,a5,a4
    800093e0:	4705                	li	a4,1
    800093e2:	00e78c23          	sb	a4,24(a5)
  wakeup(&disk.free[0]);
    800093e6:	0001f517          	auipc	a0,0x1f
    800093ea:	c3250513          	addi	a0,a0,-974 # 80028018 <disk+0x2018>
    800093ee:	ffffa097          	auipc	ra,0xffffa
    800093f2:	5ce080e7          	jalr	1486(ra) # 800039bc <wakeup>
}
    800093f6:	0001                	nop
    800093f8:	60e2                	ld	ra,24(sp)
    800093fa:	6442                	ld	s0,16(sp)
    800093fc:	6105                	addi	sp,sp,32
    800093fe:	8082                	ret

0000000080009400 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int i)
{
    80009400:	7179                	addi	sp,sp,-48
    80009402:	f406                	sd	ra,40(sp)
    80009404:	f022                	sd	s0,32(sp)
    80009406:	1800                	addi	s0,sp,48
    80009408:	87aa                	mv	a5,a0
    8000940a:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    int flag = disk.desc[i].flags;
    8000940e:	0001d717          	auipc	a4,0x1d
    80009412:	bf270713          	addi	a4,a4,-1038 # 80026000 <disk>
    80009416:	6789                	lui	a5,0x2
    80009418:	97ba                	add	a5,a5,a4
    8000941a:	6398                	ld	a4,0(a5)
    8000941c:	fdc42783          	lw	a5,-36(s0)
    80009420:	0792                	slli	a5,a5,0x4
    80009422:	97ba                	add	a5,a5,a4
    80009424:	00c7d783          	lhu	a5,12(a5) # 200c <_entry-0x7fffdff4>
    80009428:	fef42623          	sw	a5,-20(s0)
    int nxt = disk.desc[i].next;
    8000942c:	0001d717          	auipc	a4,0x1d
    80009430:	bd470713          	addi	a4,a4,-1068 # 80026000 <disk>
    80009434:	6789                	lui	a5,0x2
    80009436:	97ba                	add	a5,a5,a4
    80009438:	6398                	ld	a4,0(a5)
    8000943a:	fdc42783          	lw	a5,-36(s0)
    8000943e:	0792                	slli	a5,a5,0x4
    80009440:	97ba                	add	a5,a5,a4
    80009442:	00e7d783          	lhu	a5,14(a5) # 200e <_entry-0x7fffdff2>
    80009446:	fef42423          	sw	a5,-24(s0)
    free_desc(i);
    8000944a:	fdc42783          	lw	a5,-36(s0)
    8000944e:	853e                	mv	a0,a5
    80009450:	00000097          	auipc	ra,0x0
    80009454:	ec2080e7          	jalr	-318(ra) # 80009312 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    80009458:	fec42783          	lw	a5,-20(s0)
    8000945c:	8b85                	andi	a5,a5,1
    8000945e:	2781                	sext.w	a5,a5
    80009460:	c791                	beqz	a5,8000946c <free_chain+0x6c>
      i = nxt;
    80009462:	fe842783          	lw	a5,-24(s0)
    80009466:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    8000946a:	b755                	j	8000940e <free_chain+0xe>
    else
      break;
    8000946c:	0001                	nop
  }
}
    8000946e:	0001                	nop
    80009470:	70a2                	ld	ra,40(sp)
    80009472:	7402                	ld	s0,32(sp)
    80009474:	6145                	addi	sp,sp,48
    80009476:	8082                	ret

0000000080009478 <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int *idx)
{
    80009478:	7139                	addi	sp,sp,-64
    8000947a:	fc06                	sd	ra,56(sp)
    8000947c:	f822                	sd	s0,48(sp)
    8000947e:	f426                	sd	s1,40(sp)
    80009480:	0080                	addi	s0,sp,64
    80009482:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 3; i++){
    80009486:	fc042e23          	sw	zero,-36(s0)
    8000948a:	a895                	j	800094fe <alloc3_desc+0x86>
    idx[i] = alloc_desc();
    8000948c:	fdc42783          	lw	a5,-36(s0)
    80009490:	078a                	slli	a5,a5,0x2
    80009492:	fc843703          	ld	a4,-56(s0)
    80009496:	00f704b3          	add	s1,a4,a5
    8000949a:	00000097          	auipc	ra,0x0
    8000949e:	e16080e7          	jalr	-490(ra) # 800092b0 <alloc_desc>
    800094a2:	87aa                	mv	a5,a0
    800094a4:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    800094a6:	fdc42783          	lw	a5,-36(s0)
    800094aa:	078a                	slli	a5,a5,0x2
    800094ac:	fc843703          	ld	a4,-56(s0)
    800094b0:	97ba                	add	a5,a5,a4
    800094b2:	439c                	lw	a5,0(a5)
    800094b4:	0407d063          	bgez	a5,800094f4 <alloc3_desc+0x7c>
      for(int j = 0; j < i; j++)
    800094b8:	fc042c23          	sw	zero,-40(s0)
    800094bc:	a015                	j	800094e0 <alloc3_desc+0x68>
        free_desc(idx[j]);
    800094be:	fd842783          	lw	a5,-40(s0)
    800094c2:	078a                	slli	a5,a5,0x2
    800094c4:	fc843703          	ld	a4,-56(s0)
    800094c8:	97ba                	add	a5,a5,a4
    800094ca:	439c                	lw	a5,0(a5)
    800094cc:	853e                	mv	a0,a5
    800094ce:	00000097          	auipc	ra,0x0
    800094d2:	e44080e7          	jalr	-444(ra) # 80009312 <free_desc>
      for(int j = 0; j < i; j++)
    800094d6:	fd842783          	lw	a5,-40(s0)
    800094da:	2785                	addiw	a5,a5,1
    800094dc:	fcf42c23          	sw	a5,-40(s0)
    800094e0:	fd842703          	lw	a4,-40(s0)
    800094e4:	fdc42783          	lw	a5,-36(s0)
    800094e8:	2701                	sext.w	a4,a4
    800094ea:	2781                	sext.w	a5,a5
    800094ec:	fcf749e3          	blt	a4,a5,800094be <alloc3_desc+0x46>
      return -1;
    800094f0:	57fd                	li	a5,-1
    800094f2:	a831                	j	8000950e <alloc3_desc+0x96>
  for(int i = 0; i < 3; i++){
    800094f4:	fdc42783          	lw	a5,-36(s0)
    800094f8:	2785                	addiw	a5,a5,1
    800094fa:	fcf42e23          	sw	a5,-36(s0)
    800094fe:	fdc42783          	lw	a5,-36(s0)
    80009502:	0007871b          	sext.w	a4,a5
    80009506:	4789                	li	a5,2
    80009508:	f8e7d2e3          	bge	a5,a4,8000948c <alloc3_desc+0x14>
    }
  }
  return 0;
    8000950c:	4781                	li	a5,0
}
    8000950e:	853e                	mv	a0,a5
    80009510:	70e2                	ld	ra,56(sp)
    80009512:	7442                	ld	s0,48(sp)
    80009514:	74a2                	ld	s1,40(sp)
    80009516:	6121                	addi	sp,sp,64
    80009518:	8082                	ret

000000008000951a <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
    8000951a:	7139                	addi	sp,sp,-64
    8000951c:	fc06                	sd	ra,56(sp)
    8000951e:	f822                	sd	s0,48(sp)
    80009520:	0080                	addi	s0,sp,64
    80009522:	fca43423          	sd	a0,-56(s0)
    80009526:	87ae                	mv	a5,a1
    80009528:	fcf42223          	sw	a5,-60(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    8000952c:	fc843783          	ld	a5,-56(s0)
    80009530:	47dc                	lw	a5,12(a5)
    80009532:	0017979b          	slliw	a5,a5,0x1
    80009536:	2781                	sext.w	a5,a5
    80009538:	1782                	slli	a5,a5,0x20
    8000953a:	9381                	srli	a5,a5,0x20
    8000953c:	fef43423          	sd	a5,-24(s0)

  acquire(&disk.vdisk_lock);
    80009540:	0001f517          	auipc	a0,0x1f
    80009544:	be850513          	addi	a0,a0,-1048 # 80028128 <disk+0x2128>
    80009548:	ffff8097          	auipc	ra,0xffff8
    8000954c:	d26080e7          	jalr	-730(ra) # 8000126e <acquire>
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
    80009550:	fd040793          	addi	a5,s0,-48
    80009554:	853e                	mv	a0,a5
    80009556:	00000097          	auipc	ra,0x0
    8000955a:	f22080e7          	jalr	-222(ra) # 80009478 <alloc3_desc>
    8000955e:	87aa                	mv	a5,a0
    80009560:	cf91                	beqz	a5,8000957c <virtio_disk_rw+0x62>
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80009562:	0001f597          	auipc	a1,0x1f
    80009566:	bc658593          	addi	a1,a1,-1082 # 80028128 <disk+0x2128>
    8000956a:	0001f517          	auipc	a0,0x1f
    8000956e:	aae50513          	addi	a0,a0,-1362 # 80028018 <disk+0x2018>
    80009572:	ffffa097          	auipc	ra,0xffffa
    80009576:	3ce080e7          	jalr	974(ra) # 80003940 <sleep>
    if(alloc3_desc(idx) == 0) {
    8000957a:	bfd9                	j	80009550 <virtio_disk_rw+0x36>
      break;
    8000957c:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    8000957e:	fd042783          	lw	a5,-48(s0)
    80009582:	20078793          	addi	a5,a5,512
    80009586:	00479713          	slli	a4,a5,0x4
    8000958a:	0001d797          	auipc	a5,0x1d
    8000958e:	a7678793          	addi	a5,a5,-1418 # 80026000 <disk>
    80009592:	97ba                	add	a5,a5,a4
    80009594:	0a878793          	addi	a5,a5,168
    80009598:	fef43023          	sd	a5,-32(s0)

  if(write)
    8000959c:	fc442783          	lw	a5,-60(s0)
    800095a0:	2781                	sext.w	a5,a5
    800095a2:	c791                	beqz	a5,800095ae <virtio_disk_rw+0x94>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    800095a4:	fe043783          	ld	a5,-32(s0)
    800095a8:	4705                	li	a4,1
    800095aa:	c398                	sw	a4,0(a5)
    800095ac:	a029                	j	800095b6 <virtio_disk_rw+0x9c>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    800095ae:	fe043783          	ld	a5,-32(s0)
    800095b2:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    800095b6:	fe043783          	ld	a5,-32(s0)
    800095ba:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    800095be:	fe043783          	ld	a5,-32(s0)
    800095c2:	fe843703          	ld	a4,-24(s0)
    800095c6:	e798                	sd	a4,8(a5)

  disk.desc[idx[0]].addr = (uint64) buf0;
    800095c8:	0001d717          	auipc	a4,0x1d
    800095cc:	a3870713          	addi	a4,a4,-1480 # 80026000 <disk>
    800095d0:	6789                	lui	a5,0x2
    800095d2:	97ba                	add	a5,a5,a4
    800095d4:	6398                	ld	a4,0(a5)
    800095d6:	fd042783          	lw	a5,-48(s0)
    800095da:	0792                	slli	a5,a5,0x4
    800095dc:	97ba                	add	a5,a5,a4
    800095de:	fe043703          	ld	a4,-32(s0)
    800095e2:	e398                	sd	a4,0(a5)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    800095e4:	0001d717          	auipc	a4,0x1d
    800095e8:	a1c70713          	addi	a4,a4,-1508 # 80026000 <disk>
    800095ec:	6789                	lui	a5,0x2
    800095ee:	97ba                	add	a5,a5,a4
    800095f0:	6398                	ld	a4,0(a5)
    800095f2:	fd042783          	lw	a5,-48(s0)
    800095f6:	0792                	slli	a5,a5,0x4
    800095f8:	97ba                	add	a5,a5,a4
    800095fa:	4741                	li	a4,16
    800095fc:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    800095fe:	0001d717          	auipc	a4,0x1d
    80009602:	a0270713          	addi	a4,a4,-1534 # 80026000 <disk>
    80009606:	6789                	lui	a5,0x2
    80009608:	97ba                	add	a5,a5,a4
    8000960a:	6398                	ld	a4,0(a5)
    8000960c:	fd042783          	lw	a5,-48(s0)
    80009610:	0792                	slli	a5,a5,0x4
    80009612:	97ba                	add	a5,a5,a4
    80009614:	4705                	li	a4,1
    80009616:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[0]].next = idx[1];
    8000961a:	fd442683          	lw	a3,-44(s0)
    8000961e:	0001d717          	auipc	a4,0x1d
    80009622:	9e270713          	addi	a4,a4,-1566 # 80026000 <disk>
    80009626:	6789                	lui	a5,0x2
    80009628:	97ba                	add	a5,a5,a4
    8000962a:	6398                	ld	a4,0(a5)
    8000962c:	fd042783          	lw	a5,-48(s0)
    80009630:	0792                	slli	a5,a5,0x4
    80009632:	97ba                	add	a5,a5,a4
    80009634:	03069713          	slli	a4,a3,0x30
    80009638:	9341                	srli	a4,a4,0x30
    8000963a:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.desc[idx[1]].addr = (uint64) b->data;
    8000963e:	fc843783          	ld	a5,-56(s0)
    80009642:	05878693          	addi	a3,a5,88
    80009646:	0001d717          	auipc	a4,0x1d
    8000964a:	9ba70713          	addi	a4,a4,-1606 # 80026000 <disk>
    8000964e:	6789                	lui	a5,0x2
    80009650:	97ba                	add	a5,a5,a4
    80009652:	6398                	ld	a4,0(a5)
    80009654:	fd442783          	lw	a5,-44(s0)
    80009658:	0792                	slli	a5,a5,0x4
    8000965a:	97ba                	add	a5,a5,a4
    8000965c:	8736                	mv	a4,a3
    8000965e:	e398                	sd	a4,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    80009660:	0001d717          	auipc	a4,0x1d
    80009664:	9a070713          	addi	a4,a4,-1632 # 80026000 <disk>
    80009668:	6789                	lui	a5,0x2
    8000966a:	97ba                	add	a5,a5,a4
    8000966c:	6398                	ld	a4,0(a5)
    8000966e:	fd442783          	lw	a5,-44(s0)
    80009672:	0792                	slli	a5,a5,0x4
    80009674:	97ba                	add	a5,a5,a4
    80009676:	40000713          	li	a4,1024
    8000967a:	c798                	sw	a4,8(a5)
  if(write)
    8000967c:	fc442783          	lw	a5,-60(s0)
    80009680:	2781                	sext.w	a5,a5
    80009682:	cf99                	beqz	a5,800096a0 <virtio_disk_rw+0x186>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80009684:	0001d717          	auipc	a4,0x1d
    80009688:	97c70713          	addi	a4,a4,-1668 # 80026000 <disk>
    8000968c:	6789                	lui	a5,0x2
    8000968e:	97ba                	add	a5,a5,a4
    80009690:	6398                	ld	a4,0(a5)
    80009692:	fd442783          	lw	a5,-44(s0)
    80009696:	0792                	slli	a5,a5,0x4
    80009698:	97ba                	add	a5,a5,a4
    8000969a:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
    8000969e:	a839                	j	800096bc <virtio_disk_rw+0x1a2>
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    800096a0:	0001d717          	auipc	a4,0x1d
    800096a4:	96070713          	addi	a4,a4,-1696 # 80026000 <disk>
    800096a8:	6789                	lui	a5,0x2
    800096aa:	97ba                	add	a5,a5,a4
    800096ac:	6398                	ld	a4,0(a5)
    800096ae:	fd442783          	lw	a5,-44(s0)
    800096b2:	0792                	slli	a5,a5,0x4
    800096b4:	97ba                	add	a5,a5,a4
    800096b6:	4709                	li	a4,2
    800096b8:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    800096bc:	0001d717          	auipc	a4,0x1d
    800096c0:	94470713          	addi	a4,a4,-1724 # 80026000 <disk>
    800096c4:	6789                	lui	a5,0x2
    800096c6:	97ba                	add	a5,a5,a4
    800096c8:	6398                	ld	a4,0(a5)
    800096ca:	fd442783          	lw	a5,-44(s0)
    800096ce:	0792                	slli	a5,a5,0x4
    800096d0:	97ba                	add	a5,a5,a4
    800096d2:	00c7d703          	lhu	a4,12(a5) # 200c <_entry-0x7fffdff4>
    800096d6:	0001d697          	auipc	a3,0x1d
    800096da:	92a68693          	addi	a3,a3,-1750 # 80026000 <disk>
    800096de:	6789                	lui	a5,0x2
    800096e0:	97b6                	add	a5,a5,a3
    800096e2:	6394                	ld	a3,0(a5)
    800096e4:	fd442783          	lw	a5,-44(s0)
    800096e8:	0792                	slli	a5,a5,0x4
    800096ea:	97b6                	add	a5,a5,a3
    800096ec:	00176713          	ori	a4,a4,1
    800096f0:	1742                	slli	a4,a4,0x30
    800096f2:	9341                	srli	a4,a4,0x30
    800096f4:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].next = idx[2];
    800096f8:	fd842683          	lw	a3,-40(s0)
    800096fc:	0001d717          	auipc	a4,0x1d
    80009700:	90470713          	addi	a4,a4,-1788 # 80026000 <disk>
    80009704:	6789                	lui	a5,0x2
    80009706:	97ba                	add	a5,a5,a4
    80009708:	6398                	ld	a4,0(a5)
    8000970a:	fd442783          	lw	a5,-44(s0)
    8000970e:	0792                	slli	a5,a5,0x4
    80009710:	97ba                	add	a5,a5,a4
    80009712:	03069713          	slli	a4,a3,0x30
    80009716:	9341                	srli	a4,a4,0x30
    80009718:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    8000971c:	fd042783          	lw	a5,-48(s0)
    80009720:	0001d717          	auipc	a4,0x1d
    80009724:	8e070713          	addi	a4,a4,-1824 # 80026000 <disk>
    80009728:	20078793          	addi	a5,a5,512
    8000972c:	0792                	slli	a5,a5,0x4
    8000972e:	97ba                	add	a5,a5,a4
    80009730:	577d                	li	a4,-1
    80009732:	02e78823          	sb	a4,48(a5)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80009736:	fd042783          	lw	a5,-48(s0)
    8000973a:	20078793          	addi	a5,a5,512
    8000973e:	00479713          	slli	a4,a5,0x4
    80009742:	0001d797          	auipc	a5,0x1d
    80009746:	8be78793          	addi	a5,a5,-1858 # 80026000 <disk>
    8000974a:	97ba                	add	a5,a5,a4
    8000974c:	03078693          	addi	a3,a5,48
    80009750:	0001d717          	auipc	a4,0x1d
    80009754:	8b070713          	addi	a4,a4,-1872 # 80026000 <disk>
    80009758:	6789                	lui	a5,0x2
    8000975a:	97ba                	add	a5,a5,a4
    8000975c:	6398                	ld	a4,0(a5)
    8000975e:	fd842783          	lw	a5,-40(s0)
    80009762:	0792                	slli	a5,a5,0x4
    80009764:	97ba                	add	a5,a5,a4
    80009766:	8736                	mv	a4,a3
    80009768:	e398                	sd	a4,0(a5)
  disk.desc[idx[2]].len = 1;
    8000976a:	0001d717          	auipc	a4,0x1d
    8000976e:	89670713          	addi	a4,a4,-1898 # 80026000 <disk>
    80009772:	6789                	lui	a5,0x2
    80009774:	97ba                	add	a5,a5,a4
    80009776:	6398                	ld	a4,0(a5)
    80009778:	fd842783          	lw	a5,-40(s0)
    8000977c:	0792                	slli	a5,a5,0x4
    8000977e:	97ba                	add	a5,a5,a4
    80009780:	4705                	li	a4,1
    80009782:	c798                	sw	a4,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009784:	0001d717          	auipc	a4,0x1d
    80009788:	87c70713          	addi	a4,a4,-1924 # 80026000 <disk>
    8000978c:	6789                	lui	a5,0x2
    8000978e:	97ba                	add	a5,a5,a4
    80009790:	6398                	ld	a4,0(a5)
    80009792:	fd842783          	lw	a5,-40(s0)
    80009796:	0792                	slli	a5,a5,0x4
    80009798:	97ba                	add	a5,a5,a4
    8000979a:	4709                	li	a4,2
    8000979c:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[2]].next = 0;
    800097a0:	0001d717          	auipc	a4,0x1d
    800097a4:	86070713          	addi	a4,a4,-1952 # 80026000 <disk>
    800097a8:	6789                	lui	a5,0x2
    800097aa:	97ba                	add	a5,a5,a4
    800097ac:	6398                	ld	a4,0(a5)
    800097ae:	fd842783          	lw	a5,-40(s0)
    800097b2:	0792                	slli	a5,a5,0x4
    800097b4:	97ba                	add	a5,a5,a4
    800097b6:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    800097ba:	fc843783          	ld	a5,-56(s0)
    800097be:	4705                	li	a4,1
    800097c0:	c3d8                	sw	a4,4(a5)
  disk.info[idx[0]].b = b;
    800097c2:	fd042783          	lw	a5,-48(s0)
    800097c6:	0001d717          	auipc	a4,0x1d
    800097ca:	83a70713          	addi	a4,a4,-1990 # 80026000 <disk>
    800097ce:	20078793          	addi	a5,a5,512
    800097d2:	0792                	slli	a5,a5,0x4
    800097d4:	97ba                	add	a5,a5,a4
    800097d6:	fc843703          	ld	a4,-56(s0)
    800097da:	f798                	sd	a4,40(a5)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    800097dc:	fd042603          	lw	a2,-48(s0)
    800097e0:	0001d717          	auipc	a4,0x1d
    800097e4:	82070713          	addi	a4,a4,-2016 # 80026000 <disk>
    800097e8:	6789                	lui	a5,0x2
    800097ea:	97ba                	add	a5,a5,a4
    800097ec:	6794                	ld	a3,8(a5)
    800097ee:	0001d717          	auipc	a4,0x1d
    800097f2:	81270713          	addi	a4,a4,-2030 # 80026000 <disk>
    800097f6:	6789                	lui	a5,0x2
    800097f8:	97ba                	add	a5,a5,a4
    800097fa:	679c                	ld	a5,8(a5)
    800097fc:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009800:	2781                	sext.w	a5,a5
    80009802:	8b9d                	andi	a5,a5,7
    80009804:	2781                	sext.w	a5,a5
    80009806:	03061713          	slli	a4,a2,0x30
    8000980a:	9341                	srli	a4,a4,0x30
    8000980c:	0786                	slli	a5,a5,0x1
    8000980e:	97b6                	add	a5,a5,a3
    80009810:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009814:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    80009818:	0001c717          	auipc	a4,0x1c
    8000981c:	7e870713          	addi	a4,a4,2024 # 80026000 <disk>
    80009820:	6789                	lui	a5,0x2
    80009822:	97ba                	add	a5,a5,a4
    80009824:	679c                	ld	a5,8(a5)
    80009826:	0027d703          	lhu	a4,2(a5) # 2002 <_entry-0x7fffdffe>
    8000982a:	0001c697          	auipc	a3,0x1c
    8000982e:	7d668693          	addi	a3,a3,2006 # 80026000 <disk>
    80009832:	6789                	lui	a5,0x2
    80009834:	97b6                	add	a5,a5,a3
    80009836:	679c                	ld	a5,8(a5)
    80009838:	2705                	addiw	a4,a4,1
    8000983a:	1742                	slli	a4,a4,0x30
    8000983c:	9341                	srli	a4,a4,0x30
    8000983e:	00e79123          	sh	a4,2(a5) # 2002 <_entry-0x7fffdffe>

  __sync_synchronize();
    80009842:	0ff0000f          	fence

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009846:	100017b7          	lui	a5,0x10001
    8000984a:	05078793          	addi	a5,a5,80 # 10001050 <_entry-0x6fffefb0>
    8000984e:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009852:	a819                	j	80009868 <virtio_disk_rw+0x34e>
    sleep(b, &disk.vdisk_lock);
    80009854:	0001f597          	auipc	a1,0x1f
    80009858:	8d458593          	addi	a1,a1,-1836 # 80028128 <disk+0x2128>
    8000985c:	fc843503          	ld	a0,-56(s0)
    80009860:	ffffa097          	auipc	ra,0xffffa
    80009864:	0e0080e7          	jalr	224(ra) # 80003940 <sleep>
  while(b->disk == 1) {
    80009868:	fc843783          	ld	a5,-56(s0)
    8000986c:	43dc                	lw	a5,4(a5)
    8000986e:	873e                	mv	a4,a5
    80009870:	4785                	li	a5,1
    80009872:	fef701e3          	beq	a4,a5,80009854 <virtio_disk_rw+0x33a>
  }

  disk.info[idx[0]].b = 0;
    80009876:	fd042783          	lw	a5,-48(s0)
    8000987a:	0001c717          	auipc	a4,0x1c
    8000987e:	78670713          	addi	a4,a4,1926 # 80026000 <disk>
    80009882:	20078793          	addi	a5,a5,512
    80009886:	0792                	slli	a5,a5,0x4
    80009888:	97ba                	add	a5,a5,a4
    8000988a:	0207b423          	sd	zero,40(a5)
  free_chain(idx[0]);
    8000988e:	fd042783          	lw	a5,-48(s0)
    80009892:	853e                	mv	a0,a5
    80009894:	00000097          	auipc	ra,0x0
    80009898:	b6c080e7          	jalr	-1172(ra) # 80009400 <free_chain>

  release(&disk.vdisk_lock);
    8000989c:	0001f517          	auipc	a0,0x1f
    800098a0:	88c50513          	addi	a0,a0,-1908 # 80028128 <disk+0x2128>
    800098a4:	ffff8097          	auipc	ra,0xffff8
    800098a8:	a2e080e7          	jalr	-1490(ra) # 800012d2 <release>
}
    800098ac:	0001                	nop
    800098ae:	70e2                	ld	ra,56(sp)
    800098b0:	7442                	ld	s0,48(sp)
    800098b2:	6121                	addi	sp,sp,64
    800098b4:	8082                	ret

00000000800098b6 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    800098b6:	1101                	addi	sp,sp,-32
    800098b8:	ec06                	sd	ra,24(sp)
    800098ba:	e822                	sd	s0,16(sp)
    800098bc:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    800098be:	0001f517          	auipc	a0,0x1f
    800098c2:	86a50513          	addi	a0,a0,-1942 # 80028128 <disk+0x2128>
    800098c6:	ffff8097          	auipc	ra,0xffff8
    800098ca:	9a8080e7          	jalr	-1624(ra) # 8000126e <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    800098ce:	100017b7          	lui	a5,0x10001
    800098d2:	06078793          	addi	a5,a5,96 # 10001060 <_entry-0x6fffefa0>
    800098d6:	439c                	lw	a5,0(a5)
    800098d8:	0007871b          	sext.w	a4,a5
    800098dc:	100017b7          	lui	a5,0x10001
    800098e0:	06478793          	addi	a5,a5,100 # 10001064 <_entry-0x6fffef9c>
    800098e4:	8b0d                	andi	a4,a4,3
    800098e6:	2701                	sext.w	a4,a4
    800098e8:	c398                	sw	a4,0(a5)

  __sync_synchronize();
    800098ea:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    800098ee:	a855                	j	800099a2 <virtio_disk_intr+0xec>
    __sync_synchronize();
    800098f0:	0ff0000f          	fence
    int id = disk.used->ring[disk.used_idx % NUM].id;
    800098f4:	0001c717          	auipc	a4,0x1c
    800098f8:	70c70713          	addi	a4,a4,1804 # 80026000 <disk>
    800098fc:	6789                	lui	a5,0x2
    800098fe:	97ba                	add	a5,a5,a4
    80009900:	6b98                	ld	a4,16(a5)
    80009902:	0001c697          	auipc	a3,0x1c
    80009906:	6fe68693          	addi	a3,a3,1790 # 80026000 <disk>
    8000990a:	6789                	lui	a5,0x2
    8000990c:	97b6                	add	a5,a5,a3
    8000990e:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009912:	2781                	sext.w	a5,a5
    80009914:	8b9d                	andi	a5,a5,7
    80009916:	2781                	sext.w	a5,a5
    80009918:	078e                	slli	a5,a5,0x3
    8000991a:	97ba                	add	a5,a5,a4
    8000991c:	43dc                	lw	a5,4(a5)
    8000991e:	fef42623          	sw	a5,-20(s0)

    if(disk.info[id].status != 0)
    80009922:	0001c717          	auipc	a4,0x1c
    80009926:	6de70713          	addi	a4,a4,1758 # 80026000 <disk>
    8000992a:	fec42783          	lw	a5,-20(s0)
    8000992e:	20078793          	addi	a5,a5,512
    80009932:	0792                	slli	a5,a5,0x4
    80009934:	97ba                	add	a5,a5,a4
    80009936:	0307c783          	lbu	a5,48(a5)
    8000993a:	cb89                	beqz	a5,8000994c <virtio_disk_intr+0x96>
      panic("virtio_disk_intr status");
    8000993c:	00002517          	auipc	a0,0x2
    80009940:	ddc50513          	addi	a0,a0,-548 # 8000b718 <etext+0x718>
    80009944:	ffff7097          	auipc	ra,0xffff7
    80009948:	33a080e7          	jalr	826(ra) # 80000c7e <panic>

    struct buf *b = disk.info[id].b;
    8000994c:	0001c717          	auipc	a4,0x1c
    80009950:	6b470713          	addi	a4,a4,1716 # 80026000 <disk>
    80009954:	fec42783          	lw	a5,-20(s0)
    80009958:	20078793          	addi	a5,a5,512
    8000995c:	0792                	slli	a5,a5,0x4
    8000995e:	97ba                	add	a5,a5,a4
    80009960:	779c                	ld	a5,40(a5)
    80009962:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    80009966:	fe043783          	ld	a5,-32(s0)
    8000996a:	0007a223          	sw	zero,4(a5)
    wakeup(b);
    8000996e:	fe043503          	ld	a0,-32(s0)
    80009972:	ffffa097          	auipc	ra,0xffffa
    80009976:	04a080e7          	jalr	74(ra) # 800039bc <wakeup>

    disk.used_idx += 1;
    8000997a:	0001c717          	auipc	a4,0x1c
    8000997e:	68670713          	addi	a4,a4,1670 # 80026000 <disk>
    80009982:	6789                	lui	a5,0x2
    80009984:	97ba                	add	a5,a5,a4
    80009986:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    8000998a:	2785                	addiw	a5,a5,1
    8000998c:	03079713          	slli	a4,a5,0x30
    80009990:	9341                	srli	a4,a4,0x30
    80009992:	0001c697          	auipc	a3,0x1c
    80009996:	66e68693          	addi	a3,a3,1646 # 80026000 <disk>
    8000999a:	6789                	lui	a5,0x2
    8000999c:	97b6                	add	a5,a5,a3
    8000999e:	02e79023          	sh	a4,32(a5) # 2020 <_entry-0x7fffdfe0>
  while(disk.used_idx != disk.used->idx){
    800099a2:	0001c717          	auipc	a4,0x1c
    800099a6:	65e70713          	addi	a4,a4,1630 # 80026000 <disk>
    800099aa:	6789                	lui	a5,0x2
    800099ac:	97ba                	add	a5,a5,a4
    800099ae:	0207d683          	lhu	a3,32(a5) # 2020 <_entry-0x7fffdfe0>
    800099b2:	0001c717          	auipc	a4,0x1c
    800099b6:	64e70713          	addi	a4,a4,1614 # 80026000 <disk>
    800099ba:	6789                	lui	a5,0x2
    800099bc:	97ba                	add	a5,a5,a4
    800099be:	6b9c                	ld	a5,16(a5)
    800099c0:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    800099c4:	0006871b          	sext.w	a4,a3
    800099c8:	2781                	sext.w	a5,a5
    800099ca:	f2f713e3          	bne	a4,a5,800098f0 <virtio_disk_intr+0x3a>
  }

  release(&disk.vdisk_lock);
    800099ce:	0001e517          	auipc	a0,0x1e
    800099d2:	75a50513          	addi	a0,a0,1882 # 80028128 <disk+0x2128>
    800099d6:	ffff8097          	auipc	ra,0xffff8
    800099da:	8fc080e7          	jalr	-1796(ra) # 800012d2 <release>
}
    800099de:	0001                	nop
    800099e0:	60e2                	ld	ra,24(sp)
    800099e2:	6442                	ld	s0,16(sp)
    800099e4:	6105                	addi	sp,sp,32
    800099e6:	8082                	ret
	...

000000008000a000 <_trampoline>:
    8000a000:	14051573          	csrrw	a0,sscratch,a0
    8000a004:	02153423          	sd	ra,40(a0)
    8000a008:	02253823          	sd	sp,48(a0)
    8000a00c:	02353c23          	sd	gp,56(a0)
    8000a010:	04453023          	sd	tp,64(a0)
    8000a014:	04553423          	sd	t0,72(a0)
    8000a018:	04653823          	sd	t1,80(a0)
    8000a01c:	04753c23          	sd	t2,88(a0)
    8000a020:	f120                	sd	s0,96(a0)
    8000a022:	f524                	sd	s1,104(a0)
    8000a024:	fd2c                	sd	a1,120(a0)
    8000a026:	e150                	sd	a2,128(a0)
    8000a028:	e554                	sd	a3,136(a0)
    8000a02a:	e958                	sd	a4,144(a0)
    8000a02c:	ed5c                	sd	a5,152(a0)
    8000a02e:	0b053023          	sd	a6,160(a0)
    8000a032:	0b153423          	sd	a7,168(a0)
    8000a036:	0b253823          	sd	s2,176(a0)
    8000a03a:	0b353c23          	sd	s3,184(a0)
    8000a03e:	0d453023          	sd	s4,192(a0)
    8000a042:	0d553423          	sd	s5,200(a0)
    8000a046:	0d653823          	sd	s6,208(a0)
    8000a04a:	0d753c23          	sd	s7,216(a0)
    8000a04e:	0f853023          	sd	s8,224(a0)
    8000a052:	0f953423          	sd	s9,232(a0)
    8000a056:	0fa53823          	sd	s10,240(a0)
    8000a05a:	0fb53c23          	sd	s11,248(a0)
    8000a05e:	11c53023          	sd	t3,256(a0)
    8000a062:	11d53423          	sd	t4,264(a0)
    8000a066:	11e53823          	sd	t5,272(a0)
    8000a06a:	11f53c23          	sd	t6,280(a0)
    8000a06e:	140022f3          	csrr	t0,sscratch
    8000a072:	06553823          	sd	t0,112(a0)
    8000a076:	00853103          	ld	sp,8(a0)
    8000a07a:	02053203          	ld	tp,32(a0)
    8000a07e:	01053283          	ld	t0,16(a0)
    8000a082:	00053303          	ld	t1,0(a0)
    8000a086:	18031073          	csrw	satp,t1
    8000a08a:	12000073          	sfence.vma
    8000a08e:	8282                	jr	t0

000000008000a090 <userret>:
    8000a090:	18059073          	csrw	satp,a1
    8000a094:	12000073          	sfence.vma
    8000a098:	07053283          	ld	t0,112(a0)
    8000a09c:	14029073          	csrw	sscratch,t0
    8000a0a0:	02853083          	ld	ra,40(a0)
    8000a0a4:	03053103          	ld	sp,48(a0)
    8000a0a8:	03853183          	ld	gp,56(a0)
    8000a0ac:	04053203          	ld	tp,64(a0)
    8000a0b0:	04853283          	ld	t0,72(a0)
    8000a0b4:	05053303          	ld	t1,80(a0)
    8000a0b8:	05853383          	ld	t2,88(a0)
    8000a0bc:	7120                	ld	s0,96(a0)
    8000a0be:	7524                	ld	s1,104(a0)
    8000a0c0:	7d2c                	ld	a1,120(a0)
    8000a0c2:	6150                	ld	a2,128(a0)
    8000a0c4:	6554                	ld	a3,136(a0)
    8000a0c6:	6958                	ld	a4,144(a0)
    8000a0c8:	6d5c                	ld	a5,152(a0)
    8000a0ca:	0a053803          	ld	a6,160(a0)
    8000a0ce:	0a853883          	ld	a7,168(a0)
    8000a0d2:	0b053903          	ld	s2,176(a0)
    8000a0d6:	0b853983          	ld	s3,184(a0)
    8000a0da:	0c053a03          	ld	s4,192(a0)
    8000a0de:	0c853a83          	ld	s5,200(a0)
    8000a0e2:	0d053b03          	ld	s6,208(a0)
    8000a0e6:	0d853b83          	ld	s7,216(a0)
    8000a0ea:	0e053c03          	ld	s8,224(a0)
    8000a0ee:	0e853c83          	ld	s9,232(a0)
    8000a0f2:	0f053d03          	ld	s10,240(a0)
    8000a0f6:	0f853d83          	ld	s11,248(a0)
    8000a0fa:	10053e03          	ld	t3,256(a0)
    8000a0fe:	10853e83          	ld	t4,264(a0)
    8000a102:	11053f03          	ld	t5,272(a0)
    8000a106:	11853f83          	ld	t6,280(a0)
    8000a10a:	14051573          	csrrw	a0,sscratch,a0
    8000a10e:	10200073          	sret
	...
