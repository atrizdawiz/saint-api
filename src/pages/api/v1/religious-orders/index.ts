import { PrismaClient, ReligiousOrder } from "@prisma/client";
import type { NextApiRequest, NextApiResponse } from "next";

const prisma = new PrismaClient();

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<ReligiousOrder[]>
) {
  const religiousOrders = await prisma.religiousOrder.findMany();

  res.json(religiousOrders);
}
