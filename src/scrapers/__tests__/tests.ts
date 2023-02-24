import { getRealDate } from "../saintScraper";

describe("getRealDate", () => {
  it("should handle '10 October 376' string correctly", () => {
    const input = "10 October 376";

    const actual = getRealDate(input)?.toISOString();

    expect(actual).toEqual("0376-10-10T00:00:00.000Z");
  });

  it("should handle '01 January 103' string correctly", () => {
    const input = "01 January 103";

    const actual = getRealDate(input)?.toISOString();

    expect(actual).toEqual("0103-01-01T00:00:00.000Z");
  });

  it("should handle '20 December 888' string correctly", () => {
    const input = "20 December 888";

    const actual = getRealDate(input)?.toISOString();

    expect(actual).toEqual("0888-12-20T00:00:00.000Z");
  });

  it("should handle '1 Mars 1983' string correctly", () => {
    const input = "1 Mars 1983";

    const actual = getRealDate(input)?.toISOString();

    expect(actual).toEqual("1983-03-01T00:00:00.000Z");
  });

  it("should handle '18 October 1964 by Pope Paul VI' string correctly", () => {
    const input = "18 October 1964 by Pope Paul VI";

    const actual = getRealDate(input)?.toISOString();

    expect(actual).toEqual("1964-10-18T00:00:00.000Z");
  });
});
