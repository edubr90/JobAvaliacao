using System;

namespace SimuladorCredito.Utils
{
    public static class DatetimeExtensions
    {
        public static int DaysDiff(this DateTime first, DateTime second)
        {
            return (int)(first - second).TotalDays;
        }
    }
}