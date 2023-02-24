import saintsService from "@/services/saintsService";
import { PrismaClient, ReligiousOrder, Saint } from "@prisma/client";
import type { NextApiRequest, NextApiResponse } from "next";

const prisma = new PrismaClient();

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<Saint[]>
) {
  const { query } = req;
  const countryCode = query.countryCode?.toString().toUpperCase() || "";

  const saints = await saintsService.getSaintsByCountryCode(countryCode);

  res.json(saints);
}
