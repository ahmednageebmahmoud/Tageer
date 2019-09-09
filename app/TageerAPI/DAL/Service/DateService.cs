using DAL.Resource;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Service
{
    public class DateService
    {
        /// <summary>
        /// get date by culture 
        /// </summary>
        /// <param name="format as MM or dd or yyyy"></param>
        /// <param name="date as date object"></param>
        /// <returns></returns>
        public static string GetDateByCulture(string format, DateTime date)
        {

            switch (XMLService.ReadInXmlFile("DateLanguage"))
            {
                case "ar":
                    return date.ToString(format, new CultureInfo("ar"));
                default:
                    return date.ToString(format, new CultureInfo("en"));
            }
        }

        public static string GetDateByCulture(DateTime date)
        {
            string Format = "dd/MM/yyyy";
            switch (XMLService.ReadInXmlFile("DateLanguage"))
            {
                case "ar":
                    return date.ToString(Format, new CultureInfo("ar"));
                default:
                    return date.ToString(Format, new CultureInfo("en"));
            }
        }


        public static string GetDateTimeByCulture(DateTime date)
        {
            string Format = "dd/MM/yyyy hh:mm:ss tt";
            switch (XMLService.ReadInXmlFile("DateLanguage"))
            {
                case "ar":
                    return date.ToString(Format, new CultureInfo("ar"));
                default:
                    return date.ToString(Format, new CultureInfo("en"));
            }
        }
        public static string GetDateTimeByCulture(DateTime? date)
        {
            if (!date.HasValue)
                return string.Empty;

            string Format = "dd/MM/yyyy hh:mm:ss tt";
            switch (XMLService.ReadInXmlFile("DateLanguage"))
            {
                case "ar":
                    return date.Value.ToString(Format, new CultureInfo("ar"));
                default:
                    return date.Value.ToString(Format, new CultureInfo("en"));
            }
        }

        public static string CaltDateTimeSince(DateTime dateTime)
        {
            try
            {
                var dTime = DateTime.Now - dateTime;
                //A: Year
                if (dTime.Days >= 366)
                {
                    if (dTime.Days >= (366 * 3))
                        return Token.Ago + " " + (dTime.Days / 366) + " " + Token.Years;
                    else if (dTime.Days >= (366 * 2))
                        return Token.Ago + " " + Token.TwoYears;
                    else
                        return Token.Ago + " " + Token.OneYear;
                }

                //B:Month
                if (dTime.Days >= 31)
                {
                    if (dTime.Days >= (31 * 3))
                        return Token.Ago + " " + (dTime.Days / 31) + " " + Token.Months;
                    else if (dTime.Days >= (31 * 2))
                        return Token.Ago + " " + Token.TwoMonths;
                    else
                        return Token.Ago + " " + Token.OneMonth;
                }

                //C: Day
                if (dTime.Days > 0)
                {
                    if (dTime.Days >= 3)
                        return Token.Ago + " " + dTime.Days + " " + Token.Day;
                    else if (dTime.Days >= 2)
                        return Token.Ago + " " + Token.TwoDays;
                    else
                        return Token.Ago + " " + Token.OneDay;
                }

                //D: Hour
                if (dTime.Hours > 0)
                {
                    if (dTime.Hours >= 3)
                        return Token.Ago + " " + dTime.Hours + " " + Token.Hour;
                    else if (dTime.Hours >= 2)
                        return Token.Ago + " " + Token.TwoHour;
                    else
                        return Token.Ago + " " + Token.OneHour;
                }

                //D: Minute
                if (dTime.Minutes > 0)
                {
                    if (dTime.Minutes >= 3)
                        return Token.Ago + " " + dTime.Minutes + " " + Token.Minute;
                    else if (dTime.Minutes >= 2)
                        return Token.Ago + " " + Token.TwoMinute;
                    else
                        return Token.Ago + " " + Token.OneMinute;
                }

                return Token.JustNow;
            }
            catch (Exception)
            {
                return null;
            }
        }

    }//end 
}
