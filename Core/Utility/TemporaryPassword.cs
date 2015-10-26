using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Utility
{
    public class TemporaryPasswordMethod
    {
        public static string CreateTemporaryPassword(int passwordLength)
        {
            string allowedChars = "abcdefghijkmnopqrstuvwxyz0123456789";
            char[] chars = new char[passwordLength];
            Random rd = new Random();

            for (int i = 0; i < passwordLength; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }

            return new string(chars);
        }
    }
}
