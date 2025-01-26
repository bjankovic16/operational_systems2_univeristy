
user/_test:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:

#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

void main(){
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	1000                	addi	s0,sp,32
    fork();
   8:	00000097          	auipc	ra,0x0
   c:	4ee080e7          	jalr	1262(ra) # 4f6 <fork>
    for(int i=0;i<10000;i++)
  10:	fe042623          	sw	zero,-20(s0)
  14:	a03d                	j	42 <main+0x42>
        for(int j=0;j<20000;j++);
  16:	fe042423          	sw	zero,-24(s0)
  1a:	a031                	j	26 <main+0x26>
  1c:	fe842783          	lw	a5,-24(s0)
  20:	2785                	addiw	a5,a5,1
  22:	fef42423          	sw	a5,-24(s0)
  26:	fe842783          	lw	a5,-24(s0)
  2a:	0007871b          	sext.w	a4,a5
  2e:	6795                	lui	a5,0x5
  30:	e1f78793          	addi	a5,a5,-481 # 4e1f <__global_pointer$+0x38a7>
  34:	fee7d4e3          	bge	a5,a4,1c <main+0x1c>
    for(int i=0;i<10000;i++)
  38:	fec42783          	lw	a5,-20(s0)
  3c:	2785                	addiw	a5,a5,1
  3e:	fef42623          	sw	a5,-20(s0)
  42:	fec42783          	lw	a5,-20(s0)
  46:	0007871b          	sext.w	a4,a5
  4a:	6789                	lui	a5,0x2
  4c:	70f78793          	addi	a5,a5,1807 # 270f <__global_pointer$+0x1197>
  50:	fce7d3e3          	bge	a5,a4,16 <main+0x16>
    printf("zavrsio");
  54:	00001517          	auipc	a0,0x1
  58:	d1450513          	addi	a0,a0,-748 # d68 <malloc+0x142>
  5c:	00001097          	auipc	ra,0x1
  60:	9d8080e7          	jalr	-1576(ra) # a34 <printf>
    exit(0);
  64:	4501                	li	a0,0
  66:	00000097          	auipc	ra,0x0
  6a:	498080e7          	jalr	1176(ra) # 4fe <exit>

000000000000006e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  6e:	7179                	addi	sp,sp,-48
  70:	f422                	sd	s0,40(sp)
  72:	1800                	addi	s0,sp,48
  74:	fca43c23          	sd	a0,-40(s0)
  78:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  7c:	fd843783          	ld	a5,-40(s0)
  80:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  84:	0001                	nop
  86:	fd043703          	ld	a4,-48(s0)
  8a:	00170793          	addi	a5,a4,1
  8e:	fcf43823          	sd	a5,-48(s0)
  92:	fd843783          	ld	a5,-40(s0)
  96:	00178693          	addi	a3,a5,1
  9a:	fcd43c23          	sd	a3,-40(s0)
  9e:	00074703          	lbu	a4,0(a4)
  a2:	00e78023          	sb	a4,0(a5)
  a6:	0007c783          	lbu	a5,0(a5)
  aa:	fff1                	bnez	a5,86 <strcpy+0x18>
    ;
  return os;
  ac:	fe843783          	ld	a5,-24(s0)
}
  b0:	853e                	mv	a0,a5
  b2:	7422                	ld	s0,40(sp)
  b4:	6145                	addi	sp,sp,48
  b6:	8082                	ret

00000000000000b8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b8:	1101                	addi	sp,sp,-32
  ba:	ec22                	sd	s0,24(sp)
  bc:	1000                	addi	s0,sp,32
  be:	fea43423          	sd	a0,-24(s0)
  c2:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
  c6:	a819                	j	dc <strcmp+0x24>
    p++, q++;
  c8:	fe843783          	ld	a5,-24(s0)
  cc:	0785                	addi	a5,a5,1
  ce:	fef43423          	sd	a5,-24(s0)
  d2:	fe043783          	ld	a5,-32(s0)
  d6:	0785                	addi	a5,a5,1
  d8:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
  dc:	fe843783          	ld	a5,-24(s0)
  e0:	0007c783          	lbu	a5,0(a5)
  e4:	cb99                	beqz	a5,fa <strcmp+0x42>
  e6:	fe843783          	ld	a5,-24(s0)
  ea:	0007c703          	lbu	a4,0(a5)
  ee:	fe043783          	ld	a5,-32(s0)
  f2:	0007c783          	lbu	a5,0(a5)
  f6:	fcf709e3          	beq	a4,a5,c8 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
  fa:	fe843783          	ld	a5,-24(s0)
  fe:	0007c783          	lbu	a5,0(a5)
 102:	0007871b          	sext.w	a4,a5
 106:	fe043783          	ld	a5,-32(s0)
 10a:	0007c783          	lbu	a5,0(a5)
 10e:	2781                	sext.w	a5,a5
 110:	40f707bb          	subw	a5,a4,a5
 114:	2781                	sext.w	a5,a5
}
 116:	853e                	mv	a0,a5
 118:	6462                	ld	s0,24(sp)
 11a:	6105                	addi	sp,sp,32
 11c:	8082                	ret

000000000000011e <strlen>:

uint
strlen(const char *s)
{
 11e:	7179                	addi	sp,sp,-48
 120:	f422                	sd	s0,40(sp)
 122:	1800                	addi	s0,sp,48
 124:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 128:	fe042623          	sw	zero,-20(s0)
 12c:	a031                	j	138 <strlen+0x1a>
 12e:	fec42783          	lw	a5,-20(s0)
 132:	2785                	addiw	a5,a5,1
 134:	fef42623          	sw	a5,-20(s0)
 138:	fec42783          	lw	a5,-20(s0)
 13c:	fd843703          	ld	a4,-40(s0)
 140:	97ba                	add	a5,a5,a4
 142:	0007c783          	lbu	a5,0(a5)
 146:	f7e5                	bnez	a5,12e <strlen+0x10>
    ;
  return n;
 148:	fec42783          	lw	a5,-20(s0)
}
 14c:	853e                	mv	a0,a5
 14e:	7422                	ld	s0,40(sp)
 150:	6145                	addi	sp,sp,48
 152:	8082                	ret

0000000000000154 <memset>:

void*
memset(void *dst, int c, uint n)
{
 154:	7179                	addi	sp,sp,-48
 156:	f422                	sd	s0,40(sp)
 158:	1800                	addi	s0,sp,48
 15a:	fca43c23          	sd	a0,-40(s0)
 15e:	87ae                	mv	a5,a1
 160:	8732                	mv	a4,a2
 162:	fcf42a23          	sw	a5,-44(s0)
 166:	87ba                	mv	a5,a4
 168:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 16c:	fd843783          	ld	a5,-40(s0)
 170:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 174:	fe042623          	sw	zero,-20(s0)
 178:	a00d                	j	19a <memset+0x46>
    cdst[i] = c;
 17a:	fec42783          	lw	a5,-20(s0)
 17e:	fe043703          	ld	a4,-32(s0)
 182:	97ba                	add	a5,a5,a4
 184:	fd442703          	lw	a4,-44(s0)
 188:	0ff77713          	andi	a4,a4,255
 18c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 190:	fec42783          	lw	a5,-20(s0)
 194:	2785                	addiw	a5,a5,1
 196:	fef42623          	sw	a5,-20(s0)
 19a:	fec42703          	lw	a4,-20(s0)
 19e:	fd042783          	lw	a5,-48(s0)
 1a2:	2781                	sext.w	a5,a5
 1a4:	fcf76be3          	bltu	a4,a5,17a <memset+0x26>
  }
  return dst;
 1a8:	fd843783          	ld	a5,-40(s0)
}
 1ac:	853e                	mv	a0,a5
 1ae:	7422                	ld	s0,40(sp)
 1b0:	6145                	addi	sp,sp,48
 1b2:	8082                	ret

00000000000001b4 <strchr>:

char*
strchr(const char *s, char c)
{
 1b4:	1101                	addi	sp,sp,-32
 1b6:	ec22                	sd	s0,24(sp)
 1b8:	1000                	addi	s0,sp,32
 1ba:	fea43423          	sd	a0,-24(s0)
 1be:	87ae                	mv	a5,a1
 1c0:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 1c4:	a01d                	j	1ea <strchr+0x36>
    if(*s == c)
 1c6:	fe843783          	ld	a5,-24(s0)
 1ca:	0007c703          	lbu	a4,0(a5)
 1ce:	fe744783          	lbu	a5,-25(s0)
 1d2:	0ff7f793          	andi	a5,a5,255
 1d6:	00e79563          	bne	a5,a4,1e0 <strchr+0x2c>
      return (char*)s;
 1da:	fe843783          	ld	a5,-24(s0)
 1de:	a821                	j	1f6 <strchr+0x42>
  for(; *s; s++)
 1e0:	fe843783          	ld	a5,-24(s0)
 1e4:	0785                	addi	a5,a5,1
 1e6:	fef43423          	sd	a5,-24(s0)
 1ea:	fe843783          	ld	a5,-24(s0)
 1ee:	0007c783          	lbu	a5,0(a5)
 1f2:	fbf1                	bnez	a5,1c6 <strchr+0x12>
  return 0;
 1f4:	4781                	li	a5,0
}
 1f6:	853e                	mv	a0,a5
 1f8:	6462                	ld	s0,24(sp)
 1fa:	6105                	addi	sp,sp,32
 1fc:	8082                	ret

00000000000001fe <gets>:

char*
gets(char *buf, int max)
{
 1fe:	7179                	addi	sp,sp,-48
 200:	f406                	sd	ra,40(sp)
 202:	f022                	sd	s0,32(sp)
 204:	1800                	addi	s0,sp,48
 206:	fca43c23          	sd	a0,-40(s0)
 20a:	87ae                	mv	a5,a1
 20c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 210:	fe042623          	sw	zero,-20(s0)
 214:	a8a1                	j	26c <gets+0x6e>
    cc = read(0, &c, 1);
 216:	fe740793          	addi	a5,s0,-25
 21a:	4605                	li	a2,1
 21c:	85be                	mv	a1,a5
 21e:	4501                	li	a0,0
 220:	00000097          	auipc	ra,0x0
 224:	2f6080e7          	jalr	758(ra) # 516 <read>
 228:	87aa                	mv	a5,a0
 22a:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 22e:	fe842783          	lw	a5,-24(s0)
 232:	2781                	sext.w	a5,a5
 234:	04f05763          	blez	a5,282 <gets+0x84>
      break;
    buf[i++] = c;
 238:	fec42783          	lw	a5,-20(s0)
 23c:	0017871b          	addiw	a4,a5,1
 240:	fee42623          	sw	a4,-20(s0)
 244:	873e                	mv	a4,a5
 246:	fd843783          	ld	a5,-40(s0)
 24a:	97ba                	add	a5,a5,a4
 24c:	fe744703          	lbu	a4,-25(s0)
 250:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 254:	fe744783          	lbu	a5,-25(s0)
 258:	873e                	mv	a4,a5
 25a:	47a9                	li	a5,10
 25c:	02f70463          	beq	a4,a5,284 <gets+0x86>
 260:	fe744783          	lbu	a5,-25(s0)
 264:	873e                	mv	a4,a5
 266:	47b5                	li	a5,13
 268:	00f70e63          	beq	a4,a5,284 <gets+0x86>
  for(i=0; i+1 < max; ){
 26c:	fec42783          	lw	a5,-20(s0)
 270:	2785                	addiw	a5,a5,1
 272:	0007871b          	sext.w	a4,a5
 276:	fd442783          	lw	a5,-44(s0)
 27a:	2781                	sext.w	a5,a5
 27c:	f8f74de3          	blt	a4,a5,216 <gets+0x18>
 280:	a011                	j	284 <gets+0x86>
      break;
 282:	0001                	nop
      break;
  }
  buf[i] = '\0';
 284:	fec42783          	lw	a5,-20(s0)
 288:	fd843703          	ld	a4,-40(s0)
 28c:	97ba                	add	a5,a5,a4
 28e:	00078023          	sb	zero,0(a5)
  return buf;
 292:	fd843783          	ld	a5,-40(s0)
}
 296:	853e                	mv	a0,a5
 298:	70a2                	ld	ra,40(sp)
 29a:	7402                	ld	s0,32(sp)
 29c:	6145                	addi	sp,sp,48
 29e:	8082                	ret

00000000000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	7179                	addi	sp,sp,-48
 2a2:	f406                	sd	ra,40(sp)
 2a4:	f022                	sd	s0,32(sp)
 2a6:	1800                	addi	s0,sp,48
 2a8:	fca43c23          	sd	a0,-40(s0)
 2ac:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b0:	4581                	li	a1,0
 2b2:	fd843503          	ld	a0,-40(s0)
 2b6:	00000097          	auipc	ra,0x0
 2ba:	288080e7          	jalr	648(ra) # 53e <open>
 2be:	87aa                	mv	a5,a0
 2c0:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 2c4:	fec42783          	lw	a5,-20(s0)
 2c8:	2781                	sext.w	a5,a5
 2ca:	0007d463          	bgez	a5,2d2 <stat+0x32>
    return -1;
 2ce:	57fd                	li	a5,-1
 2d0:	a035                	j	2fc <stat+0x5c>
  r = fstat(fd, st);
 2d2:	fec42783          	lw	a5,-20(s0)
 2d6:	fd043583          	ld	a1,-48(s0)
 2da:	853e                	mv	a0,a5
 2dc:	00000097          	auipc	ra,0x0
 2e0:	27a080e7          	jalr	634(ra) # 556 <fstat>
 2e4:	87aa                	mv	a5,a0
 2e6:	fef42423          	sw	a5,-24(s0)
  close(fd);
 2ea:	fec42783          	lw	a5,-20(s0)
 2ee:	853e                	mv	a0,a5
 2f0:	00000097          	auipc	ra,0x0
 2f4:	236080e7          	jalr	566(ra) # 526 <close>
  return r;
 2f8:	fe842783          	lw	a5,-24(s0)
}
 2fc:	853e                	mv	a0,a5
 2fe:	70a2                	ld	ra,40(sp)
 300:	7402                	ld	s0,32(sp)
 302:	6145                	addi	sp,sp,48
 304:	8082                	ret

0000000000000306 <atoi>:

int
atoi(const char *s)
{
 306:	7179                	addi	sp,sp,-48
 308:	f422                	sd	s0,40(sp)
 30a:	1800                	addi	s0,sp,48
 30c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 310:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 314:	a815                	j	348 <atoi+0x42>
    n = n*10 + *s++ - '0';
 316:	fec42703          	lw	a4,-20(s0)
 31a:	87ba                	mv	a5,a4
 31c:	0027979b          	slliw	a5,a5,0x2
 320:	9fb9                	addw	a5,a5,a4
 322:	0017979b          	slliw	a5,a5,0x1
 326:	0007871b          	sext.w	a4,a5
 32a:	fd843783          	ld	a5,-40(s0)
 32e:	00178693          	addi	a3,a5,1
 332:	fcd43c23          	sd	a3,-40(s0)
 336:	0007c783          	lbu	a5,0(a5)
 33a:	2781                	sext.w	a5,a5
 33c:	9fb9                	addw	a5,a5,a4
 33e:	2781                	sext.w	a5,a5
 340:	fd07879b          	addiw	a5,a5,-48
 344:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 348:	fd843783          	ld	a5,-40(s0)
 34c:	0007c783          	lbu	a5,0(a5)
 350:	873e                	mv	a4,a5
 352:	02f00793          	li	a5,47
 356:	00e7fb63          	bgeu	a5,a4,36c <atoi+0x66>
 35a:	fd843783          	ld	a5,-40(s0)
 35e:	0007c783          	lbu	a5,0(a5)
 362:	873e                	mv	a4,a5
 364:	03900793          	li	a5,57
 368:	fae7f7e3          	bgeu	a5,a4,316 <atoi+0x10>
  return n;
 36c:	fec42783          	lw	a5,-20(s0)
}
 370:	853e                	mv	a0,a5
 372:	7422                	ld	s0,40(sp)
 374:	6145                	addi	sp,sp,48
 376:	8082                	ret

0000000000000378 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 378:	7139                	addi	sp,sp,-64
 37a:	fc22                	sd	s0,56(sp)
 37c:	0080                	addi	s0,sp,64
 37e:	fca43c23          	sd	a0,-40(s0)
 382:	fcb43823          	sd	a1,-48(s0)
 386:	87b2                	mv	a5,a2
 388:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 38c:	fd843783          	ld	a5,-40(s0)
 390:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 394:	fd043783          	ld	a5,-48(s0)
 398:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 39c:	fe043703          	ld	a4,-32(s0)
 3a0:	fe843783          	ld	a5,-24(s0)
 3a4:	02e7fc63          	bgeu	a5,a4,3dc <memmove+0x64>
    while(n-- > 0)
 3a8:	a00d                	j	3ca <memmove+0x52>
      *dst++ = *src++;
 3aa:	fe043703          	ld	a4,-32(s0)
 3ae:	00170793          	addi	a5,a4,1
 3b2:	fef43023          	sd	a5,-32(s0)
 3b6:	fe843783          	ld	a5,-24(s0)
 3ba:	00178693          	addi	a3,a5,1
 3be:	fed43423          	sd	a3,-24(s0)
 3c2:	00074703          	lbu	a4,0(a4)
 3c6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 3ca:	fcc42783          	lw	a5,-52(s0)
 3ce:	fff7871b          	addiw	a4,a5,-1
 3d2:	fce42623          	sw	a4,-52(s0)
 3d6:	fcf04ae3          	bgtz	a5,3aa <memmove+0x32>
 3da:	a891                	j	42e <memmove+0xb6>
  } else {
    dst += n;
 3dc:	fcc42783          	lw	a5,-52(s0)
 3e0:	fe843703          	ld	a4,-24(s0)
 3e4:	97ba                	add	a5,a5,a4
 3e6:	fef43423          	sd	a5,-24(s0)
    src += n;
 3ea:	fcc42783          	lw	a5,-52(s0)
 3ee:	fe043703          	ld	a4,-32(s0)
 3f2:	97ba                	add	a5,a5,a4
 3f4:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 3f8:	a01d                	j	41e <memmove+0xa6>
      *--dst = *--src;
 3fa:	fe043783          	ld	a5,-32(s0)
 3fe:	17fd                	addi	a5,a5,-1
 400:	fef43023          	sd	a5,-32(s0)
 404:	fe843783          	ld	a5,-24(s0)
 408:	17fd                	addi	a5,a5,-1
 40a:	fef43423          	sd	a5,-24(s0)
 40e:	fe043783          	ld	a5,-32(s0)
 412:	0007c703          	lbu	a4,0(a5)
 416:	fe843783          	ld	a5,-24(s0)
 41a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 41e:	fcc42783          	lw	a5,-52(s0)
 422:	fff7871b          	addiw	a4,a5,-1
 426:	fce42623          	sw	a4,-52(s0)
 42a:	fcf048e3          	bgtz	a5,3fa <memmove+0x82>
  }
  return vdst;
 42e:	fd843783          	ld	a5,-40(s0)
}
 432:	853e                	mv	a0,a5
 434:	7462                	ld	s0,56(sp)
 436:	6121                	addi	sp,sp,64
 438:	8082                	ret

000000000000043a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 43a:	7139                	addi	sp,sp,-64
 43c:	fc22                	sd	s0,56(sp)
 43e:	0080                	addi	s0,sp,64
 440:	fca43c23          	sd	a0,-40(s0)
 444:	fcb43823          	sd	a1,-48(s0)
 448:	87b2                	mv	a5,a2
 44a:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 44e:	fd843783          	ld	a5,-40(s0)
 452:	fef43423          	sd	a5,-24(s0)
 456:	fd043783          	ld	a5,-48(s0)
 45a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 45e:	a0a1                	j	4a6 <memcmp+0x6c>
    if (*p1 != *p2) {
 460:	fe843783          	ld	a5,-24(s0)
 464:	0007c703          	lbu	a4,0(a5)
 468:	fe043783          	ld	a5,-32(s0)
 46c:	0007c783          	lbu	a5,0(a5)
 470:	02f70163          	beq	a4,a5,492 <memcmp+0x58>
      return *p1 - *p2;
 474:	fe843783          	ld	a5,-24(s0)
 478:	0007c783          	lbu	a5,0(a5)
 47c:	0007871b          	sext.w	a4,a5
 480:	fe043783          	ld	a5,-32(s0)
 484:	0007c783          	lbu	a5,0(a5)
 488:	2781                	sext.w	a5,a5
 48a:	40f707bb          	subw	a5,a4,a5
 48e:	2781                	sext.w	a5,a5
 490:	a01d                	j	4b6 <memcmp+0x7c>
    }
    p1++;
 492:	fe843783          	ld	a5,-24(s0)
 496:	0785                	addi	a5,a5,1
 498:	fef43423          	sd	a5,-24(s0)
    p2++;
 49c:	fe043783          	ld	a5,-32(s0)
 4a0:	0785                	addi	a5,a5,1
 4a2:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 4a6:	fcc42783          	lw	a5,-52(s0)
 4aa:	fff7871b          	addiw	a4,a5,-1
 4ae:	fce42623          	sw	a4,-52(s0)
 4b2:	f7dd                	bnez	a5,460 <memcmp+0x26>
  }
  return 0;
 4b4:	4781                	li	a5,0
}
 4b6:	853e                	mv	a0,a5
 4b8:	7462                	ld	s0,56(sp)
 4ba:	6121                	addi	sp,sp,64
 4bc:	8082                	ret

00000000000004be <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4be:	7179                	addi	sp,sp,-48
 4c0:	f406                	sd	ra,40(sp)
 4c2:	f022                	sd	s0,32(sp)
 4c4:	1800                	addi	s0,sp,48
 4c6:	fea43423          	sd	a0,-24(s0)
 4ca:	feb43023          	sd	a1,-32(s0)
 4ce:	87b2                	mv	a5,a2
 4d0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 4d4:	fdc42783          	lw	a5,-36(s0)
 4d8:	863e                	mv	a2,a5
 4da:	fe043583          	ld	a1,-32(s0)
 4de:	fe843503          	ld	a0,-24(s0)
 4e2:	00000097          	auipc	ra,0x0
 4e6:	e96080e7          	jalr	-362(ra) # 378 <memmove>
 4ea:	87aa                	mv	a5,a0
}
 4ec:	853e                	mv	a0,a5
 4ee:	70a2                	ld	ra,40(sp)
 4f0:	7402                	ld	s0,32(sp)
 4f2:	6145                	addi	sp,sp,48
 4f4:	8082                	ret

00000000000004f6 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 4f6:	4885                	li	a7,1
 ecall
 4f8:	00000073          	ecall
 ret
 4fc:	8082                	ret

00000000000004fe <exit>:
.global exit
exit:
 li a7, SYS_exit
 4fe:	4889                	li	a7,2
 ecall
 500:	00000073          	ecall
 ret
 504:	8082                	ret

0000000000000506 <wait>:
.global wait
wait:
 li a7, SYS_wait
 506:	488d                	li	a7,3
 ecall
 508:	00000073          	ecall
 ret
 50c:	8082                	ret

000000000000050e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 50e:	4891                	li	a7,4
 ecall
 510:	00000073          	ecall
 ret
 514:	8082                	ret

0000000000000516 <read>:
.global read
read:
 li a7, SYS_read
 516:	4895                	li	a7,5
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <write>:
.global write
write:
 li a7, SYS_write
 51e:	48c1                	li	a7,16
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <close>:
.global close
close:
 li a7, SYS_close
 526:	48d5                	li	a7,21
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <kill>:
.global kill
kill:
 li a7, SYS_kill
 52e:	4899                	li	a7,6
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <exec>:
.global exec
exec:
 li a7, SYS_exec
 536:	489d                	li	a7,7
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <open>:
.global open
open:
 li a7, SYS_open
 53e:	48bd                	li	a7,15
 ecall
 540:	00000073          	ecall
 ret
 544:	8082                	ret

0000000000000546 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 546:	48c5                	li	a7,17
 ecall
 548:	00000073          	ecall
 ret
 54c:	8082                	ret

000000000000054e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 54e:	48c9                	li	a7,18
 ecall
 550:	00000073          	ecall
 ret
 554:	8082                	ret

0000000000000556 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 556:	48a1                	li	a7,8
 ecall
 558:	00000073          	ecall
 ret
 55c:	8082                	ret

000000000000055e <link>:
.global link
link:
 li a7, SYS_link
 55e:	48cd                	li	a7,19
 ecall
 560:	00000073          	ecall
 ret
 564:	8082                	ret

0000000000000566 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 566:	48d1                	li	a7,20
 ecall
 568:	00000073          	ecall
 ret
 56c:	8082                	ret

000000000000056e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 56e:	48a5                	li	a7,9
 ecall
 570:	00000073          	ecall
 ret
 574:	8082                	ret

0000000000000576 <dup>:
.global dup
dup:
 li a7, SYS_dup
 576:	48a9                	li	a7,10
 ecall
 578:	00000073          	ecall
 ret
 57c:	8082                	ret

000000000000057e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 57e:	48ad                	li	a7,11
 ecall
 580:	00000073          	ecall
 ret
 584:	8082                	ret

0000000000000586 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 586:	48b1                	li	a7,12
 ecall
 588:	00000073          	ecall
 ret
 58c:	8082                	ret

000000000000058e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 58e:	48b5                	li	a7,13
 ecall
 590:	00000073          	ecall
 ret
 594:	8082                	ret

0000000000000596 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 596:	48b9                	li	a7,14
 ecall
 598:	00000073          	ecall
 ret
 59c:	8082                	ret

000000000000059e <change>:
.global change
change:
 li a7, SYS_change
 59e:	48d9                	li	a7,22
 ecall
 5a0:	00000073          	ecall
 ret
 5a4:	8082                	ret

00000000000005a6 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5a6:	1101                	addi	sp,sp,-32
 5a8:	ec06                	sd	ra,24(sp)
 5aa:	e822                	sd	s0,16(sp)
 5ac:	1000                	addi	s0,sp,32
 5ae:	87aa                	mv	a5,a0
 5b0:	872e                	mv	a4,a1
 5b2:	fef42623          	sw	a5,-20(s0)
 5b6:	87ba                	mv	a5,a4
 5b8:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 5bc:	feb40713          	addi	a4,s0,-21
 5c0:	fec42783          	lw	a5,-20(s0)
 5c4:	4605                	li	a2,1
 5c6:	85ba                	mv	a1,a4
 5c8:	853e                	mv	a0,a5
 5ca:	00000097          	auipc	ra,0x0
 5ce:	f54080e7          	jalr	-172(ra) # 51e <write>
}
 5d2:	0001                	nop
 5d4:	60e2                	ld	ra,24(sp)
 5d6:	6442                	ld	s0,16(sp)
 5d8:	6105                	addi	sp,sp,32
 5da:	8082                	ret

00000000000005dc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5dc:	7139                	addi	sp,sp,-64
 5de:	fc06                	sd	ra,56(sp)
 5e0:	f822                	sd	s0,48(sp)
 5e2:	0080                	addi	s0,sp,64
 5e4:	87aa                	mv	a5,a0
 5e6:	8736                	mv	a4,a3
 5e8:	fcf42623          	sw	a5,-52(s0)
 5ec:	87ae                	mv	a5,a1
 5ee:	fcf42423          	sw	a5,-56(s0)
 5f2:	87b2                	mv	a5,a2
 5f4:	fcf42223          	sw	a5,-60(s0)
 5f8:	87ba                	mv	a5,a4
 5fa:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5fe:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 602:	fc042783          	lw	a5,-64(s0)
 606:	2781                	sext.w	a5,a5
 608:	c38d                	beqz	a5,62a <printint+0x4e>
 60a:	fc842783          	lw	a5,-56(s0)
 60e:	2781                	sext.w	a5,a5
 610:	0007dd63          	bgez	a5,62a <printint+0x4e>
    neg = 1;
 614:	4785                	li	a5,1
 616:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 61a:	fc842783          	lw	a5,-56(s0)
 61e:	40f007bb          	negw	a5,a5
 622:	2781                	sext.w	a5,a5
 624:	fef42223          	sw	a5,-28(s0)
 628:	a029                	j	632 <printint+0x56>
  } else {
    x = xx;
 62a:	fc842783          	lw	a5,-56(s0)
 62e:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 632:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 636:	fc442783          	lw	a5,-60(s0)
 63a:	fe442703          	lw	a4,-28(s0)
 63e:	02f777bb          	remuw	a5,a4,a5
 642:	0007861b          	sext.w	a2,a5
 646:	fec42783          	lw	a5,-20(s0)
 64a:	0017871b          	addiw	a4,a5,1
 64e:	fee42623          	sw	a4,-20(s0)
 652:	00000697          	auipc	a3,0x0
 656:	72668693          	addi	a3,a3,1830 # d78 <digits>
 65a:	02061713          	slli	a4,a2,0x20
 65e:	9301                	srli	a4,a4,0x20
 660:	9736                	add	a4,a4,a3
 662:	00074703          	lbu	a4,0(a4)
 666:	ff040693          	addi	a3,s0,-16
 66a:	97b6                	add	a5,a5,a3
 66c:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 670:	fc442783          	lw	a5,-60(s0)
 674:	fe442703          	lw	a4,-28(s0)
 678:	02f757bb          	divuw	a5,a4,a5
 67c:	fef42223          	sw	a5,-28(s0)
 680:	fe442783          	lw	a5,-28(s0)
 684:	2781                	sext.w	a5,a5
 686:	fbc5                	bnez	a5,636 <printint+0x5a>
  if(neg)
 688:	fe842783          	lw	a5,-24(s0)
 68c:	2781                	sext.w	a5,a5
 68e:	cf95                	beqz	a5,6ca <printint+0xee>
    buf[i++] = '-';
 690:	fec42783          	lw	a5,-20(s0)
 694:	0017871b          	addiw	a4,a5,1
 698:	fee42623          	sw	a4,-20(s0)
 69c:	ff040713          	addi	a4,s0,-16
 6a0:	97ba                	add	a5,a5,a4
 6a2:	02d00713          	li	a4,45
 6a6:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 6aa:	a005                	j	6ca <printint+0xee>
    putc(fd, buf[i]);
 6ac:	fec42783          	lw	a5,-20(s0)
 6b0:	ff040713          	addi	a4,s0,-16
 6b4:	97ba                	add	a5,a5,a4
 6b6:	fe07c703          	lbu	a4,-32(a5)
 6ba:	fcc42783          	lw	a5,-52(s0)
 6be:	85ba                	mv	a1,a4
 6c0:	853e                	mv	a0,a5
 6c2:	00000097          	auipc	ra,0x0
 6c6:	ee4080e7          	jalr	-284(ra) # 5a6 <putc>
  while(--i >= 0)
 6ca:	fec42783          	lw	a5,-20(s0)
 6ce:	37fd                	addiw	a5,a5,-1
 6d0:	fef42623          	sw	a5,-20(s0)
 6d4:	fec42783          	lw	a5,-20(s0)
 6d8:	2781                	sext.w	a5,a5
 6da:	fc07d9e3          	bgez	a5,6ac <printint+0xd0>
}
 6de:	0001                	nop
 6e0:	0001                	nop
 6e2:	70e2                	ld	ra,56(sp)
 6e4:	7442                	ld	s0,48(sp)
 6e6:	6121                	addi	sp,sp,64
 6e8:	8082                	ret

00000000000006ea <printptr>:

static void
printptr(int fd, uint64 x) {
 6ea:	7179                	addi	sp,sp,-48
 6ec:	f406                	sd	ra,40(sp)
 6ee:	f022                	sd	s0,32(sp)
 6f0:	1800                	addi	s0,sp,48
 6f2:	87aa                	mv	a5,a0
 6f4:	fcb43823          	sd	a1,-48(s0)
 6f8:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 6fc:	fdc42783          	lw	a5,-36(s0)
 700:	03000593          	li	a1,48
 704:	853e                	mv	a0,a5
 706:	00000097          	auipc	ra,0x0
 70a:	ea0080e7          	jalr	-352(ra) # 5a6 <putc>
  putc(fd, 'x');
 70e:	fdc42783          	lw	a5,-36(s0)
 712:	07800593          	li	a1,120
 716:	853e                	mv	a0,a5
 718:	00000097          	auipc	ra,0x0
 71c:	e8e080e7          	jalr	-370(ra) # 5a6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 720:	fe042623          	sw	zero,-20(s0)
 724:	a82d                	j	75e <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 726:	fd043783          	ld	a5,-48(s0)
 72a:	93f1                	srli	a5,a5,0x3c
 72c:	00000717          	auipc	a4,0x0
 730:	64c70713          	addi	a4,a4,1612 # d78 <digits>
 734:	97ba                	add	a5,a5,a4
 736:	0007c703          	lbu	a4,0(a5)
 73a:	fdc42783          	lw	a5,-36(s0)
 73e:	85ba                	mv	a1,a4
 740:	853e                	mv	a0,a5
 742:	00000097          	auipc	ra,0x0
 746:	e64080e7          	jalr	-412(ra) # 5a6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 74a:	fec42783          	lw	a5,-20(s0)
 74e:	2785                	addiw	a5,a5,1
 750:	fef42623          	sw	a5,-20(s0)
 754:	fd043783          	ld	a5,-48(s0)
 758:	0792                	slli	a5,a5,0x4
 75a:	fcf43823          	sd	a5,-48(s0)
 75e:	fec42783          	lw	a5,-20(s0)
 762:	873e                	mv	a4,a5
 764:	47bd                	li	a5,15
 766:	fce7f0e3          	bgeu	a5,a4,726 <printptr+0x3c>
}
 76a:	0001                	nop
 76c:	0001                	nop
 76e:	70a2                	ld	ra,40(sp)
 770:	7402                	ld	s0,32(sp)
 772:	6145                	addi	sp,sp,48
 774:	8082                	ret

0000000000000776 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 776:	715d                	addi	sp,sp,-80
 778:	e486                	sd	ra,72(sp)
 77a:	e0a2                	sd	s0,64(sp)
 77c:	0880                	addi	s0,sp,80
 77e:	87aa                	mv	a5,a0
 780:	fcb43023          	sd	a1,-64(s0)
 784:	fac43c23          	sd	a2,-72(s0)
 788:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 78c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 790:	fe042223          	sw	zero,-28(s0)
 794:	a42d                	j	9be <vprintf+0x248>
    c = fmt[i] & 0xff;
 796:	fe442783          	lw	a5,-28(s0)
 79a:	fc043703          	ld	a4,-64(s0)
 79e:	97ba                	add	a5,a5,a4
 7a0:	0007c783          	lbu	a5,0(a5)
 7a4:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 7a8:	fe042783          	lw	a5,-32(s0)
 7ac:	2781                	sext.w	a5,a5
 7ae:	eb9d                	bnez	a5,7e4 <vprintf+0x6e>
      if(c == '%'){
 7b0:	fdc42783          	lw	a5,-36(s0)
 7b4:	0007871b          	sext.w	a4,a5
 7b8:	02500793          	li	a5,37
 7bc:	00f71763          	bne	a4,a5,7ca <vprintf+0x54>
        state = '%';
 7c0:	02500793          	li	a5,37
 7c4:	fef42023          	sw	a5,-32(s0)
 7c8:	a2f5                	j	9b4 <vprintf+0x23e>
      } else {
        putc(fd, c);
 7ca:	fdc42783          	lw	a5,-36(s0)
 7ce:	0ff7f713          	andi	a4,a5,255
 7d2:	fcc42783          	lw	a5,-52(s0)
 7d6:	85ba                	mv	a1,a4
 7d8:	853e                	mv	a0,a5
 7da:	00000097          	auipc	ra,0x0
 7de:	dcc080e7          	jalr	-564(ra) # 5a6 <putc>
 7e2:	aac9                	j	9b4 <vprintf+0x23e>
      }
    } else if(state == '%'){
 7e4:	fe042783          	lw	a5,-32(s0)
 7e8:	0007871b          	sext.w	a4,a5
 7ec:	02500793          	li	a5,37
 7f0:	1cf71263          	bne	a4,a5,9b4 <vprintf+0x23e>
      if(c == 'd'){
 7f4:	fdc42783          	lw	a5,-36(s0)
 7f8:	0007871b          	sext.w	a4,a5
 7fc:	06400793          	li	a5,100
 800:	02f71463          	bne	a4,a5,828 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 804:	fb843783          	ld	a5,-72(s0)
 808:	00878713          	addi	a4,a5,8
 80c:	fae43c23          	sd	a4,-72(s0)
 810:	4398                	lw	a4,0(a5)
 812:	fcc42783          	lw	a5,-52(s0)
 816:	4685                	li	a3,1
 818:	4629                	li	a2,10
 81a:	85ba                	mv	a1,a4
 81c:	853e                	mv	a0,a5
 81e:	00000097          	auipc	ra,0x0
 822:	dbe080e7          	jalr	-578(ra) # 5dc <printint>
 826:	a269                	j	9b0 <vprintf+0x23a>
      } else if(c == 'l') {
 828:	fdc42783          	lw	a5,-36(s0)
 82c:	0007871b          	sext.w	a4,a5
 830:	06c00793          	li	a5,108
 834:	02f71663          	bne	a4,a5,860 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 838:	fb843783          	ld	a5,-72(s0)
 83c:	00878713          	addi	a4,a5,8
 840:	fae43c23          	sd	a4,-72(s0)
 844:	639c                	ld	a5,0(a5)
 846:	0007871b          	sext.w	a4,a5
 84a:	fcc42783          	lw	a5,-52(s0)
 84e:	4681                	li	a3,0
 850:	4629                	li	a2,10
 852:	85ba                	mv	a1,a4
 854:	853e                	mv	a0,a5
 856:	00000097          	auipc	ra,0x0
 85a:	d86080e7          	jalr	-634(ra) # 5dc <printint>
 85e:	aa89                	j	9b0 <vprintf+0x23a>
      } else if(c == 'x') {
 860:	fdc42783          	lw	a5,-36(s0)
 864:	0007871b          	sext.w	a4,a5
 868:	07800793          	li	a5,120
 86c:	02f71463          	bne	a4,a5,894 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 870:	fb843783          	ld	a5,-72(s0)
 874:	00878713          	addi	a4,a5,8
 878:	fae43c23          	sd	a4,-72(s0)
 87c:	4398                	lw	a4,0(a5)
 87e:	fcc42783          	lw	a5,-52(s0)
 882:	4681                	li	a3,0
 884:	4641                	li	a2,16
 886:	85ba                	mv	a1,a4
 888:	853e                	mv	a0,a5
 88a:	00000097          	auipc	ra,0x0
 88e:	d52080e7          	jalr	-686(ra) # 5dc <printint>
 892:	aa39                	j	9b0 <vprintf+0x23a>
      } else if(c == 'p') {
 894:	fdc42783          	lw	a5,-36(s0)
 898:	0007871b          	sext.w	a4,a5
 89c:	07000793          	li	a5,112
 8a0:	02f71263          	bne	a4,a5,8c4 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 8a4:	fb843783          	ld	a5,-72(s0)
 8a8:	00878713          	addi	a4,a5,8
 8ac:	fae43c23          	sd	a4,-72(s0)
 8b0:	6398                	ld	a4,0(a5)
 8b2:	fcc42783          	lw	a5,-52(s0)
 8b6:	85ba                	mv	a1,a4
 8b8:	853e                	mv	a0,a5
 8ba:	00000097          	auipc	ra,0x0
 8be:	e30080e7          	jalr	-464(ra) # 6ea <printptr>
 8c2:	a0fd                	j	9b0 <vprintf+0x23a>
      } else if(c == 's'){
 8c4:	fdc42783          	lw	a5,-36(s0)
 8c8:	0007871b          	sext.w	a4,a5
 8cc:	07300793          	li	a5,115
 8d0:	04f71c63          	bne	a4,a5,928 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 8d4:	fb843783          	ld	a5,-72(s0)
 8d8:	00878713          	addi	a4,a5,8
 8dc:	fae43c23          	sd	a4,-72(s0)
 8e0:	639c                	ld	a5,0(a5)
 8e2:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 8e6:	fe843783          	ld	a5,-24(s0)
 8ea:	eb8d                	bnez	a5,91c <vprintf+0x1a6>
          s = "(null)";
 8ec:	00000797          	auipc	a5,0x0
 8f0:	48478793          	addi	a5,a5,1156 # d70 <malloc+0x14a>
 8f4:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 8f8:	a015                	j	91c <vprintf+0x1a6>
          putc(fd, *s);
 8fa:	fe843783          	ld	a5,-24(s0)
 8fe:	0007c703          	lbu	a4,0(a5)
 902:	fcc42783          	lw	a5,-52(s0)
 906:	85ba                	mv	a1,a4
 908:	853e                	mv	a0,a5
 90a:	00000097          	auipc	ra,0x0
 90e:	c9c080e7          	jalr	-868(ra) # 5a6 <putc>
          s++;
 912:	fe843783          	ld	a5,-24(s0)
 916:	0785                	addi	a5,a5,1
 918:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 91c:	fe843783          	ld	a5,-24(s0)
 920:	0007c783          	lbu	a5,0(a5)
 924:	fbf9                	bnez	a5,8fa <vprintf+0x184>
 926:	a069                	j	9b0 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 928:	fdc42783          	lw	a5,-36(s0)
 92c:	0007871b          	sext.w	a4,a5
 930:	06300793          	li	a5,99
 934:	02f71463          	bne	a4,a5,95c <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 938:	fb843783          	ld	a5,-72(s0)
 93c:	00878713          	addi	a4,a5,8
 940:	fae43c23          	sd	a4,-72(s0)
 944:	439c                	lw	a5,0(a5)
 946:	0ff7f713          	andi	a4,a5,255
 94a:	fcc42783          	lw	a5,-52(s0)
 94e:	85ba                	mv	a1,a4
 950:	853e                	mv	a0,a5
 952:	00000097          	auipc	ra,0x0
 956:	c54080e7          	jalr	-940(ra) # 5a6 <putc>
 95a:	a899                	j	9b0 <vprintf+0x23a>
      } else if(c == '%'){
 95c:	fdc42783          	lw	a5,-36(s0)
 960:	0007871b          	sext.w	a4,a5
 964:	02500793          	li	a5,37
 968:	00f71f63          	bne	a4,a5,986 <vprintf+0x210>
        putc(fd, c);
 96c:	fdc42783          	lw	a5,-36(s0)
 970:	0ff7f713          	andi	a4,a5,255
 974:	fcc42783          	lw	a5,-52(s0)
 978:	85ba                	mv	a1,a4
 97a:	853e                	mv	a0,a5
 97c:	00000097          	auipc	ra,0x0
 980:	c2a080e7          	jalr	-982(ra) # 5a6 <putc>
 984:	a035                	j	9b0 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 986:	fcc42783          	lw	a5,-52(s0)
 98a:	02500593          	li	a1,37
 98e:	853e                	mv	a0,a5
 990:	00000097          	auipc	ra,0x0
 994:	c16080e7          	jalr	-1002(ra) # 5a6 <putc>
        putc(fd, c);
 998:	fdc42783          	lw	a5,-36(s0)
 99c:	0ff7f713          	andi	a4,a5,255
 9a0:	fcc42783          	lw	a5,-52(s0)
 9a4:	85ba                	mv	a1,a4
 9a6:	853e                	mv	a0,a5
 9a8:	00000097          	auipc	ra,0x0
 9ac:	bfe080e7          	jalr	-1026(ra) # 5a6 <putc>
      }
      state = 0;
 9b0:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 9b4:	fe442783          	lw	a5,-28(s0)
 9b8:	2785                	addiw	a5,a5,1
 9ba:	fef42223          	sw	a5,-28(s0)
 9be:	fe442783          	lw	a5,-28(s0)
 9c2:	fc043703          	ld	a4,-64(s0)
 9c6:	97ba                	add	a5,a5,a4
 9c8:	0007c783          	lbu	a5,0(a5)
 9cc:	dc0795e3          	bnez	a5,796 <vprintf+0x20>
    }
  }
}
 9d0:	0001                	nop
 9d2:	0001                	nop
 9d4:	60a6                	ld	ra,72(sp)
 9d6:	6406                	ld	s0,64(sp)
 9d8:	6161                	addi	sp,sp,80
 9da:	8082                	ret

00000000000009dc <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 9dc:	7159                	addi	sp,sp,-112
 9de:	fc06                	sd	ra,56(sp)
 9e0:	f822                	sd	s0,48(sp)
 9e2:	0080                	addi	s0,sp,64
 9e4:	fcb43823          	sd	a1,-48(s0)
 9e8:	e010                	sd	a2,0(s0)
 9ea:	e414                	sd	a3,8(s0)
 9ec:	e818                	sd	a4,16(s0)
 9ee:	ec1c                	sd	a5,24(s0)
 9f0:	03043023          	sd	a6,32(s0)
 9f4:	03143423          	sd	a7,40(s0)
 9f8:	87aa                	mv	a5,a0
 9fa:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 9fe:	03040793          	addi	a5,s0,48
 a02:	fcf43423          	sd	a5,-56(s0)
 a06:	fc843783          	ld	a5,-56(s0)
 a0a:	fd078793          	addi	a5,a5,-48
 a0e:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 a12:	fe843703          	ld	a4,-24(s0)
 a16:	fdc42783          	lw	a5,-36(s0)
 a1a:	863a                	mv	a2,a4
 a1c:	fd043583          	ld	a1,-48(s0)
 a20:	853e                	mv	a0,a5
 a22:	00000097          	auipc	ra,0x0
 a26:	d54080e7          	jalr	-684(ra) # 776 <vprintf>
}
 a2a:	0001                	nop
 a2c:	70e2                	ld	ra,56(sp)
 a2e:	7442                	ld	s0,48(sp)
 a30:	6165                	addi	sp,sp,112
 a32:	8082                	ret

0000000000000a34 <printf>:

void
printf(const char *fmt, ...)
{
 a34:	7159                	addi	sp,sp,-112
 a36:	f406                	sd	ra,40(sp)
 a38:	f022                	sd	s0,32(sp)
 a3a:	1800                	addi	s0,sp,48
 a3c:	fca43c23          	sd	a0,-40(s0)
 a40:	e40c                	sd	a1,8(s0)
 a42:	e810                	sd	a2,16(s0)
 a44:	ec14                	sd	a3,24(s0)
 a46:	f018                	sd	a4,32(s0)
 a48:	f41c                	sd	a5,40(s0)
 a4a:	03043823          	sd	a6,48(s0)
 a4e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a52:	04040793          	addi	a5,s0,64
 a56:	fcf43823          	sd	a5,-48(s0)
 a5a:	fd043783          	ld	a5,-48(s0)
 a5e:	fc878793          	addi	a5,a5,-56
 a62:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 a66:	fe843783          	ld	a5,-24(s0)
 a6a:	863e                	mv	a2,a5
 a6c:	fd843583          	ld	a1,-40(s0)
 a70:	4505                	li	a0,1
 a72:	00000097          	auipc	ra,0x0
 a76:	d04080e7          	jalr	-764(ra) # 776 <vprintf>
}
 a7a:	0001                	nop
 a7c:	70a2                	ld	ra,40(sp)
 a7e:	7402                	ld	s0,32(sp)
 a80:	6165                	addi	sp,sp,112
 a82:	8082                	ret

0000000000000a84 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a84:	7179                	addi	sp,sp,-48
 a86:	f422                	sd	s0,40(sp)
 a88:	1800                	addi	s0,sp,48
 a8a:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a8e:	fd843783          	ld	a5,-40(s0)
 a92:	17c1                	addi	a5,a5,-16
 a94:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a98:	00000797          	auipc	a5,0x0
 a9c:	30878793          	addi	a5,a5,776 # da0 <freep>
 aa0:	639c                	ld	a5,0(a5)
 aa2:	fef43423          	sd	a5,-24(s0)
 aa6:	a815                	j	ada <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 aa8:	fe843783          	ld	a5,-24(s0)
 aac:	639c                	ld	a5,0(a5)
 aae:	fe843703          	ld	a4,-24(s0)
 ab2:	00f76f63          	bltu	a4,a5,ad0 <free+0x4c>
 ab6:	fe043703          	ld	a4,-32(s0)
 aba:	fe843783          	ld	a5,-24(s0)
 abe:	02e7eb63          	bltu	a5,a4,af4 <free+0x70>
 ac2:	fe843783          	ld	a5,-24(s0)
 ac6:	639c                	ld	a5,0(a5)
 ac8:	fe043703          	ld	a4,-32(s0)
 acc:	02f76463          	bltu	a4,a5,af4 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad0:	fe843783          	ld	a5,-24(s0)
 ad4:	639c                	ld	a5,0(a5)
 ad6:	fef43423          	sd	a5,-24(s0)
 ada:	fe043703          	ld	a4,-32(s0)
 ade:	fe843783          	ld	a5,-24(s0)
 ae2:	fce7f3e3          	bgeu	a5,a4,aa8 <free+0x24>
 ae6:	fe843783          	ld	a5,-24(s0)
 aea:	639c                	ld	a5,0(a5)
 aec:	fe043703          	ld	a4,-32(s0)
 af0:	faf77ce3          	bgeu	a4,a5,aa8 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 af4:	fe043783          	ld	a5,-32(s0)
 af8:	479c                	lw	a5,8(a5)
 afa:	1782                	slli	a5,a5,0x20
 afc:	9381                	srli	a5,a5,0x20
 afe:	0792                	slli	a5,a5,0x4
 b00:	fe043703          	ld	a4,-32(s0)
 b04:	973e                	add	a4,a4,a5
 b06:	fe843783          	ld	a5,-24(s0)
 b0a:	639c                	ld	a5,0(a5)
 b0c:	02f71763          	bne	a4,a5,b3a <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 b10:	fe043783          	ld	a5,-32(s0)
 b14:	4798                	lw	a4,8(a5)
 b16:	fe843783          	ld	a5,-24(s0)
 b1a:	639c                	ld	a5,0(a5)
 b1c:	479c                	lw	a5,8(a5)
 b1e:	9fb9                	addw	a5,a5,a4
 b20:	0007871b          	sext.w	a4,a5
 b24:	fe043783          	ld	a5,-32(s0)
 b28:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 b2a:	fe843783          	ld	a5,-24(s0)
 b2e:	639c                	ld	a5,0(a5)
 b30:	6398                	ld	a4,0(a5)
 b32:	fe043783          	ld	a5,-32(s0)
 b36:	e398                	sd	a4,0(a5)
 b38:	a039                	j	b46 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 b3a:	fe843783          	ld	a5,-24(s0)
 b3e:	6398                	ld	a4,0(a5)
 b40:	fe043783          	ld	a5,-32(s0)
 b44:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 b46:	fe843783          	ld	a5,-24(s0)
 b4a:	479c                	lw	a5,8(a5)
 b4c:	1782                	slli	a5,a5,0x20
 b4e:	9381                	srli	a5,a5,0x20
 b50:	0792                	slli	a5,a5,0x4
 b52:	fe843703          	ld	a4,-24(s0)
 b56:	97ba                	add	a5,a5,a4
 b58:	fe043703          	ld	a4,-32(s0)
 b5c:	02f71563          	bne	a4,a5,b86 <free+0x102>
    p->s.size += bp->s.size;
 b60:	fe843783          	ld	a5,-24(s0)
 b64:	4798                	lw	a4,8(a5)
 b66:	fe043783          	ld	a5,-32(s0)
 b6a:	479c                	lw	a5,8(a5)
 b6c:	9fb9                	addw	a5,a5,a4
 b6e:	0007871b          	sext.w	a4,a5
 b72:	fe843783          	ld	a5,-24(s0)
 b76:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 b78:	fe043783          	ld	a5,-32(s0)
 b7c:	6398                	ld	a4,0(a5)
 b7e:	fe843783          	ld	a5,-24(s0)
 b82:	e398                	sd	a4,0(a5)
 b84:	a031                	j	b90 <free+0x10c>
  } else
    p->s.ptr = bp;
 b86:	fe843783          	ld	a5,-24(s0)
 b8a:	fe043703          	ld	a4,-32(s0)
 b8e:	e398                	sd	a4,0(a5)
  freep = p;
 b90:	00000797          	auipc	a5,0x0
 b94:	21078793          	addi	a5,a5,528 # da0 <freep>
 b98:	fe843703          	ld	a4,-24(s0)
 b9c:	e398                	sd	a4,0(a5)
}
 b9e:	0001                	nop
 ba0:	7422                	ld	s0,40(sp)
 ba2:	6145                	addi	sp,sp,48
 ba4:	8082                	ret

0000000000000ba6 <morecore>:

static Header*
morecore(uint nu)
{
 ba6:	7179                	addi	sp,sp,-48
 ba8:	f406                	sd	ra,40(sp)
 baa:	f022                	sd	s0,32(sp)
 bac:	1800                	addi	s0,sp,48
 bae:	87aa                	mv	a5,a0
 bb0:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 bb4:	fdc42783          	lw	a5,-36(s0)
 bb8:	0007871b          	sext.w	a4,a5
 bbc:	6785                	lui	a5,0x1
 bbe:	00f77563          	bgeu	a4,a5,bc8 <morecore+0x22>
    nu = 4096;
 bc2:	6785                	lui	a5,0x1
 bc4:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 bc8:	fdc42783          	lw	a5,-36(s0)
 bcc:	0047979b          	slliw	a5,a5,0x4
 bd0:	2781                	sext.w	a5,a5
 bd2:	2781                	sext.w	a5,a5
 bd4:	853e                	mv	a0,a5
 bd6:	00000097          	auipc	ra,0x0
 bda:	9b0080e7          	jalr	-1616(ra) # 586 <sbrk>
 bde:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 be2:	fe843703          	ld	a4,-24(s0)
 be6:	57fd                	li	a5,-1
 be8:	00f71463          	bne	a4,a5,bf0 <morecore+0x4a>
    return 0;
 bec:	4781                	li	a5,0
 bee:	a03d                	j	c1c <morecore+0x76>
  hp = (Header*)p;
 bf0:	fe843783          	ld	a5,-24(s0)
 bf4:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 bf8:	fe043783          	ld	a5,-32(s0)
 bfc:	fdc42703          	lw	a4,-36(s0)
 c00:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 c02:	fe043783          	ld	a5,-32(s0)
 c06:	07c1                	addi	a5,a5,16
 c08:	853e                	mv	a0,a5
 c0a:	00000097          	auipc	ra,0x0
 c0e:	e7a080e7          	jalr	-390(ra) # a84 <free>
  return freep;
 c12:	00000797          	auipc	a5,0x0
 c16:	18e78793          	addi	a5,a5,398 # da0 <freep>
 c1a:	639c                	ld	a5,0(a5)
}
 c1c:	853e                	mv	a0,a5
 c1e:	70a2                	ld	ra,40(sp)
 c20:	7402                	ld	s0,32(sp)
 c22:	6145                	addi	sp,sp,48
 c24:	8082                	ret

0000000000000c26 <malloc>:

void*
malloc(uint nbytes)
{
 c26:	7139                	addi	sp,sp,-64
 c28:	fc06                	sd	ra,56(sp)
 c2a:	f822                	sd	s0,48(sp)
 c2c:	0080                	addi	s0,sp,64
 c2e:	87aa                	mv	a5,a0
 c30:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c34:	fcc46783          	lwu	a5,-52(s0)
 c38:	07bd                	addi	a5,a5,15
 c3a:	8391                	srli	a5,a5,0x4
 c3c:	2781                	sext.w	a5,a5
 c3e:	2785                	addiw	a5,a5,1
 c40:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 c44:	00000797          	auipc	a5,0x0
 c48:	15c78793          	addi	a5,a5,348 # da0 <freep>
 c4c:	639c                	ld	a5,0(a5)
 c4e:	fef43023          	sd	a5,-32(s0)
 c52:	fe043783          	ld	a5,-32(s0)
 c56:	ef95                	bnez	a5,c92 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c58:	00000797          	auipc	a5,0x0
 c5c:	13878793          	addi	a5,a5,312 # d90 <base>
 c60:	fef43023          	sd	a5,-32(s0)
 c64:	00000797          	auipc	a5,0x0
 c68:	13c78793          	addi	a5,a5,316 # da0 <freep>
 c6c:	fe043703          	ld	a4,-32(s0)
 c70:	e398                	sd	a4,0(a5)
 c72:	00000797          	auipc	a5,0x0
 c76:	12e78793          	addi	a5,a5,302 # da0 <freep>
 c7a:	6398                	ld	a4,0(a5)
 c7c:	00000797          	auipc	a5,0x0
 c80:	11478793          	addi	a5,a5,276 # d90 <base>
 c84:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 c86:	00000797          	auipc	a5,0x0
 c8a:	10a78793          	addi	a5,a5,266 # d90 <base>
 c8e:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c92:	fe043783          	ld	a5,-32(s0)
 c96:	639c                	ld	a5,0(a5)
 c98:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 c9c:	fe843783          	ld	a5,-24(s0)
 ca0:	4798                	lw	a4,8(a5)
 ca2:	fdc42783          	lw	a5,-36(s0)
 ca6:	2781                	sext.w	a5,a5
 ca8:	06f76863          	bltu	a4,a5,d18 <malloc+0xf2>
      if(p->s.size == nunits)
 cac:	fe843783          	ld	a5,-24(s0)
 cb0:	4798                	lw	a4,8(a5)
 cb2:	fdc42783          	lw	a5,-36(s0)
 cb6:	2781                	sext.w	a5,a5
 cb8:	00e79963          	bne	a5,a4,cca <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 cbc:	fe843783          	ld	a5,-24(s0)
 cc0:	6398                	ld	a4,0(a5)
 cc2:	fe043783          	ld	a5,-32(s0)
 cc6:	e398                	sd	a4,0(a5)
 cc8:	a82d                	j	d02 <malloc+0xdc>
      else {
        p->s.size -= nunits;
 cca:	fe843783          	ld	a5,-24(s0)
 cce:	4798                	lw	a4,8(a5)
 cd0:	fdc42783          	lw	a5,-36(s0)
 cd4:	40f707bb          	subw	a5,a4,a5
 cd8:	0007871b          	sext.w	a4,a5
 cdc:	fe843783          	ld	a5,-24(s0)
 ce0:	c798                	sw	a4,8(a5)
        p += p->s.size;
 ce2:	fe843783          	ld	a5,-24(s0)
 ce6:	479c                	lw	a5,8(a5)
 ce8:	1782                	slli	a5,a5,0x20
 cea:	9381                	srli	a5,a5,0x20
 cec:	0792                	slli	a5,a5,0x4
 cee:	fe843703          	ld	a4,-24(s0)
 cf2:	97ba                	add	a5,a5,a4
 cf4:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 cf8:	fe843783          	ld	a5,-24(s0)
 cfc:	fdc42703          	lw	a4,-36(s0)
 d00:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 d02:	00000797          	auipc	a5,0x0
 d06:	09e78793          	addi	a5,a5,158 # da0 <freep>
 d0a:	fe043703          	ld	a4,-32(s0)
 d0e:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 d10:	fe843783          	ld	a5,-24(s0)
 d14:	07c1                	addi	a5,a5,16
 d16:	a091                	j	d5a <malloc+0x134>
    }
    if(p == freep)
 d18:	00000797          	auipc	a5,0x0
 d1c:	08878793          	addi	a5,a5,136 # da0 <freep>
 d20:	639c                	ld	a5,0(a5)
 d22:	fe843703          	ld	a4,-24(s0)
 d26:	02f71063          	bne	a4,a5,d46 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 d2a:	fdc42783          	lw	a5,-36(s0)
 d2e:	853e                	mv	a0,a5
 d30:	00000097          	auipc	ra,0x0
 d34:	e76080e7          	jalr	-394(ra) # ba6 <morecore>
 d38:	fea43423          	sd	a0,-24(s0)
 d3c:	fe843783          	ld	a5,-24(s0)
 d40:	e399                	bnez	a5,d46 <malloc+0x120>
        return 0;
 d42:	4781                	li	a5,0
 d44:	a819                	j	d5a <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d46:	fe843783          	ld	a5,-24(s0)
 d4a:	fef43023          	sd	a5,-32(s0)
 d4e:	fe843783          	ld	a5,-24(s0)
 d52:	639c                	ld	a5,0(a5)
 d54:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d58:	b791                	j	c9c <malloc+0x76>
  }
}
 d5a:	853e                	mv	a0,a5
 d5c:	70e2                	ld	ra,56(sp)
 d5e:	7442                	ld	s0,48(sp)
 d60:	6121                	addi	sp,sp,64
 d62:	8082                	ret
