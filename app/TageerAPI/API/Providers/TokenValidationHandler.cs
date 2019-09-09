﻿using DAL.Models.ViewModel;
using DAL.Resource;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace API
{
    //custom Message Handle
    public class TokenValidationHandler : DelegatingHandler
    {
        private static bool TryRetrieveToken(HttpRequestMessage request, out string token)
        {
            token = null;
            IEnumerable<string> authzHeaders;
            if (!request.Headers.TryGetValues("Authorization", out authzHeaders) || authzHeaders.Count() > 1)
            {
                return false;
            }
            var bearerToken = authzHeaders.ElementAt(0);
            token = bearerToken.StartsWith("Bearer ") ? bearerToken.Substring(7) : bearerToken;
            return true;
        }
        /// <summary>
        /// اذا كان هناك اكسس توكن يقوم بفكة وملىئه واذا لم يكن سوف يكملة مسيرتة 
        /// والدالة التى ذاهب اليها تحتاج الى مصادقة سوف يرجع بـ الخطاء المعتاد
        /// </summary>
        /// <param name="request"></param>
        /// <param name="cancellationToken"></param>
        /// <returns></returns>
        protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {

            HttpStatusCode statusCode;
            string token;
            HttpResponseMessage HTM = new HttpResponseMessage();
            ResponseVM Res = new ResponseVM();

            //determine whether a jwt exists or not
            if (!TryRetrieveToken(request, out token))
                {
                //allow requests with no token - whether a action method needs an authentication can be set with the claimsauthorization attribute
                return base.SendAsync(request, cancellationToken);
            }

            try
            {
                const string sec = "401b09eab3c013d4ca54922bb802bec8fd5318192b0a75f201d8b3727429090fb337591abd3e44453b954555b7a0812e1081c39b740293f765eae731f5a65ed1";
                //var now = DateTime.UtcNow;
                var securityKey = new Microsoft.IdentityModel.Tokens.SymmetricSecurityKey(System.Text.Encoding.Default.GetBytes(sec));


                SecurityToken securityToken;
                JwtSecurityTokenHandler handler = new JwtSecurityTokenHandler();
                /*
                    هذا الاوبجكت نتحقق هل الملعومات الذى بداخلة هى التى داخل الاكسس توكن 
                والتى سبق وانشئنها اثناء انشاء التوكن 
                 */
                TokenValidationParameters validationParameters = new TokenValidationParameters()
                {
                    ValidAudience = "Tageer",
                    ValidIssuer = "Tageer",
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    LifetimeValidator = this.LifetimeValidator,
                    IssuerSigningKey = securityKey
                };
                //extract and assign the user of the jwt
                Thread.CurrentPrincipal = handler.ValidateToken(token, validationParameters, out securityToken);
                HttpContext.Current.User = handler.ValidateToken(token, validationParameters, out securityToken);

                return base.SendAsync(request, cancellationToken);
            }
            catch (SecurityTokenValidationException e)
            {
                statusCode = HttpStatusCode.Unauthorized;
                Res.Message = Token.AuthorizationRequired;
            }
            catch (Exception ex)
            {
                statusCode = HttpStatusCode.InternalServerError;
                Res.Message = Token.TokenNotValid;

            }

            Res.RequestType = RequestTypeEnumVM.Error;

            HTM.StatusCode = statusCode;
            HTM.Content = new StringContent(JsonConvert.SerializeObject(Res));
            return Task<HttpResponseMessage>.Factory.StartNew(() => HTM);
        }

        public bool LifetimeValidator(DateTime? notBefore, DateTime? expires, SecurityToken securityToken, TokenValidationParameters validationParameters)
        {
            if (expires != null)
            {
                if (DateTime.UtcNow < expires) return true;
            }
            return false;
        }


    }
}