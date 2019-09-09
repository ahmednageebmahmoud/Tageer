﻿using DAL.Resource;
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

            switch (PublicService.ReadInXmlFile("DateLanguage"))
            {
                case "ar":
                    return date.ToString(format, new CultureInfo("ar"));
                default:
                    return date.ToString(format, new CultureInfo("en"));
            }
        }

        public static string GetDateByCulture( DateTime date)
        {
            string Format = "dd/MM/yyyy";
            switch (PublicService.ReadInXmlFile("DateLanguage"))
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
            switch (PublicService.ReadInXmlFile("DateLanguage"))
            {
                case "ar":
                    return date.ToString(Format, new CultureInfo("ar"));
                default:
                    return date.ToString(Format, new CultureInfo("en"));
            }
        }

        public static string CaltDateTimeSince(DateTime dateTime)
        {
            try
            {

                /*
               نتحقق من السنين ثم الشهمو ثم الايام ثم الدقلئق
                 */
                var dTime = DateTime.Now - dateTime;

                //A: Year
                if (dTime.Days >= 366)
                {
                    //notify befor year
                    //نتحقق هل هى اكبر من ثلاث سنوات ام لا
                     if (dTime.Days >= (366 * 3))
                        return Token.Ago + " " + (dTime.Days / 366) + " " + Token.Years;
                     //نتحقق هى اكبر من سنتين ام لا
                    else if (dTime.Days >= (366 * 2))
                        return Token.Ago + " " + Token.TwoYears;
                    else
                        //اذا هى سنة واحدة
                        return Token.Ago + " " + Token.OneYear;
                }

                //B:Month
                if (dTime.Days >= 31)
                {
                    //notify befor Month
                    //نتحقق هل هى اكبر من ثلاث شهور ام لا
                    if (dTime.Days >= (31 * 3))
                        return Token.Ago + " " + (dTime.Days / 31) + " "+Token.Months;
                    //نتحقق هى اكبر من شهرين ام لا
                    else if (dTime.Days >= (31 * 2))
                        return Token.Ago + " " + Token.TwoMonths;
                    else								  
                        //اذا هوا شهر واحد				  
                        return Token.Ago + " " + Token.OneMonth;
                }										  

                //C: Day
                if (dTime.Days > 0)
                {
                    //notify befor Day
                    if (dTime.Days >= 3)
                        return Token.Ago + " " + dTime.Days + " "+Token.Days;
                    else if (dTime.Days >=2)
                        return Token.Ago + " " + Token.TwoDays;
                    else
                        return Token.Ago + " " + Token.OneDay;
                }

				//D: Hour
				if (dTime.Hours > 0)
				{
					//notify befor Hour
					if (dTime.Hours >= 3)
						return Token.Ago + " " + dTime.Hours + " " + Token.Hour ;
					else if (dTime.Hours >= 2)
						return Token.Ago + " " + Token.TwoHour ;
					else
						return Token.Ago + " " + Token.OneHour ;
				}

				//D: Minute
				if (dTime.Minutes > 0)
                {
                    //notify befor Minute
                    if (dTime.Minutes >= 3)
                        return Token.Ago + " " + dTime.Minutes + " "+ Token.Minute ;
                    else if (dTime.Minutes >= 2)
                        return Token.Ago + " " + Token.TwoMinute ;
                    else
                        return Token.Ago + " " + Token.OneMinute  ;
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
