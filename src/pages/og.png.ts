import type { APIRoute } from "astro";
import { generateOgImageForSite } from "@utils/generateOgImages";

export const GET: APIRoute = async () => {
  const png = await generateOgImageForSite();
  return new Response(png, {
    headers: { "Content-Type": "image/png" },
  });
};
