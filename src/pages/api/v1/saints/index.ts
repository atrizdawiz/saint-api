import { PrismaClient, ReligiousOrder, Saint } from "@prisma/client";
import type { NextApiRequest, NextApiResponse } from "next";

const prisma = new PrismaClient();

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<Saint[]>
) {
  const saints = await prisma.saint.findMany();

  res.json(saints);
}
