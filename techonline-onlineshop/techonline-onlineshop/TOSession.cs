﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TechonlineAPI;

namespace TechonlineFrontend
{
    public class TOSession
    {
        // private constructor
        private TOSession() { }

        // Gets the current session.
        public static TOSession Current
        {
            get
            {
                TOSession session = (TOSession)HttpContext.Current.Session["__MySession__"];
                if (session == null)
                {
                    session = new TOSession();
                    HttpContext.Current.Session["__MySession__"] = session;
                }
                return session;
            }
        }

        public User user { get; set; } = null;
    }
}

