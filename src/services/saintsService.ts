import { getRealDate } from "@/scrapers/saintScraper";
import saints from "@/__fixtures__/saints";
import { Prisma, Saint } from "@prisma/client";
import prisma from "../clients/prismaClient";

const updateTimeFields = async () => {
  // const allSaints = await prisma.saint.findMany({ take: 5 });
  const updatedSaints: {
    currentSaint: any;
    updatedSaint: Prisma.BatchPayload;
  }[] = [];

  const allSaints = saints;

  while (allSaints.length > 0) {
    const currentSaint = allSaints.pop();

    if (currentSaint) {
      const heavenlyBirth = getRealDate(currentSaint.dateOfHeavenlyBirth);
      const dateOfBirth = getRealDate(currentSaint.dateOfBirth);
      const canonizationDate = getRealDate(currentSaint.dateOfCanonization);

      const saintShouldBeUpdated =
        heavenlyBirth || dateOfBirth || canonizationDate;

      if (saintShouldBeUpdated) {
        const updatedSaint = await prisma.saint.updateMany({
          where: { name: currentSaint.name },
          data: {
            ...(heavenlyBirth && {
              dateOfHeavenlyBirth: heavenlyBirth,
            }),
            ...(dateOfBirth && {
              dateOfBirth,
            }),
            ...(canonizationDate && {
              dateOfCanonization: canonizationDate,
            }),
          },
        });

        updatedSaints.push({ currentSaint, updatedSaint });
      }
    }
  }
  console.log("updatedSaints", updatedSaints);

  return updatedSaints;
};

const saintsService = { updateTimeFields };

export default saintsService;
