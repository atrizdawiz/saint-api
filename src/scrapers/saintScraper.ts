import { load } from "cheerio";

interface SaintData {
  name: string;
  wikiLink: string | null;
  dateOfBirth: string | null;
  dateOfHeavenlyBirth: string | null;
  dateOfCanonization: string | null;
  notes: string | null;
}

const saintScraper = async () => {
  const html = await fetch(
    "https://en.wikipedia.org/wiki/List_of_Catholic_saints"
  ).then((res) => res.text());

  const $ = load(html);

  // Saint	Date of birth	Date of death	Date of canonization	Notes
  const saints: SaintData[] = [];
  const trs = $("table.wikitable.sortable tbody > tr").each((i, el) => {
    if (i === 0) return;
    const tds = $(el).find("td");
    const name = $(tds[0])
      .text()
      .replace("\n", "")
      .replace(/\[.*\]/, "")
      .trim();
    const wikiLink = $(tds[0]).find("a").attr("href") || null;
    const dateOfBirth = $(tds[1])
      .text()
      .replace("\n", "")
      .replace(/\[.*\]/, "")
      .trim();
    const dateOfHeavenlyBirth = $(tds[2])
      .text()
      .replace("\n", "")
      .replace(/\[.*\]/, "")
      .trim();

    const dateOfCanonization = $(tds[3])
      .text()
      .replace("\n", "")
      .replace(/\[.*\]/, "")
      .trim();

    const notes = $(tds[4])
      .text()
      .replace("\n", "")
      .replace(/\[.*\]/, "")
      .trim();

    saints.push({
      name,
      wikiLink,
      dateOfBirth,
      dateOfHeavenlyBirth,
      dateOfCanonization,
      notes,
    });
  });
};

export const getRealDate = (date: string | null) => {
  if (date === null) return null;
  if (
    date.includes("-") ||
    date.includes("–") ||
    date.includes("or") ||
    date.includes("c.")
  )
    return null;

  const parseAbleDate = date.match(/[0-9]{1,2} [A-Za-z]{3,} [0-9]{0,4}/);
  //(?<=<pre>)(.*?)(?=</pre>)
  let day;
  let month;
  let year;
  let outputDate;
  if (parseAbleDate !== null) {
    const dayMatch = parseAbleDate[0].match(/^[0-9]{1,2}\b/g);
    const monthMatch = parseAbleDate[0].match(/[A-Za-z]+/g);
    const yearMatch = parseAbleDate[0].match(/[0-9]+$/g);

    if (dayMatch) {
      day = dayMatch[0];
    }
    if (monthMatch) {
      month = monthMatch[0];
    }
    if (yearMatch) {
      year = yearMatch[0];
    }

    try {
      outputDate = new Date(`${year}-${month}-${day} UTC`);

      return outputDate;
    } catch {
      throw new Error(`failed to parse date ${year}-${month}-${day}`);
    }
  }
  return null;
};

export const saintDetailScraper = async (wikiUrl: string) => {
  console.log("fetching saint:", wikiUrl);
  const html = await fetch(`https://en.wikipedia.org${wikiUrl}`).then((res) =>
    res.text()
  );

  const $ = load(html);

  const hej = $("table.infobox .infobox-label");

  const niceStuff: any = {};
  hej.each((i, el) => {
    const label = $(el).text();

    const firstSibling = $(el).siblings()[0];
    const firstSiblingtext = $(firstSibling).text();
    const text = $(firstSibling)
      .children()
      .toArray()
      .map((mapEl, i) => {
        console.log(mapEl);
        if (mapEl.name === "br") {
          return " ";
        }
        return $(mapEl).text();
      })
      .join("")
      .replace(/\s+/g, " ")
      .trim();

    const removeMe = text.match(/ \[.*\]/);
    if (removeMe) {
      text.replace(removeMe[0], "");
    }

    switch (label) {
      case "Born":
        niceStuff.bornText = text;
        break;
      case "Died":
        niceStuff.diedText = text;
        break;
      case "Venerated in":
        niceStuff.diedText = text;
        break;
      case "Canonized":
        niceStuff.canonizedText = text;
        break;
      case "Major shrine":
        niceStuff.majorShrineText = text;
      case "Feast":
        niceStuff.feastText = text;
      case "Attributes":
        niceStuff.attributesText = text;
      case "Patronage":
        niceStuff.patronageText = text;
      default:
        break;
    }
  });
  return niceStuff;
};

export default saintScraper;
