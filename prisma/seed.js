const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  for (let row = 0; row < 100; row++) {
    for (let col = 0; col < 100; col++) {
      await prisma.rectangle.create({
        data: {
          rect_row: row,
          col: col,
          purchased: false,
        },
      });
    }
  }
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });