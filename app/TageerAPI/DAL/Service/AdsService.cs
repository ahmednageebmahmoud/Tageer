using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
using DAL.Models.ViewModel;

namespace DAL.Service
{
    public class AdsService
    {
        /// <summary>
        /// اضافة الحقول الفردية للاعلان
        /// </summary>
        /// <param name="ad"></param>
        /// <param name="adIndividualField"></param>
        internal static void ImportAdIndividualField(Ad ad, AdIndividualFieldVM adIndividualField)
        {
            List<AdIndividualFieldsDetail> AdIndividualFieldsDetails = new List<AdIndividualFieldsDetail>();

            //Age
            if (adIndividualField.Age > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.Age,
                    adIndividualField.Age.ToString()));
            //Color
            if (!string.IsNullOrEmpty(adIndividualField.Color))
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.Color,
                    adIndividualField.Color));
            //BuildingYear
            if (adIndividualField.BuildingYear > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.BuildingYear,
                    adIndividualField.BuildingYear.ToString()));
            //AmountOfInsurance
            if (adIndividualField.AmountOfInsurance > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.AmountOfInsurance,
                    adIndividualField.AmountOfInsurance.ToString()));
            //ApartmentCount
            if (adIndividualField.ApartmentCount > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.ApartmentCount,
                    adIndividualField.ApartmentCount.ToString()));
            //BagsSmallCount
            if (adIndividualField.BagsSmallCount > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.BagsSmallCount,
                    adIndividualField.BagsSmallCount.ToString()));
            //BagsBigCount
            if (adIndividualField.BagsBigCount > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.BagsBigCount,
                    adIndividualField.BagsBigCount.ToString()));
            //ElevatorCount
            if (adIndividualField.ElevatorCount > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.ElevatorCount,
                    adIndividualField.ElevatorCount.ToString()));
            //FloorNumber
            if (adIndividualField.FloorNumber > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.FloorNumber,
                    adIndividualField.FloorNumber.ToString()));
            //Model
            if (adIndividualField.Model > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.Model,
                    adIndividualField.Model.ToString()));
            //ParkingCount
            if (adIndividualField.ParkingCount > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.ParkingCount,
                    adIndividualField.ParkingCount.ToString()));
            //PricePerMeter
            if (adIndividualField.PricePerMeter > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.PricePerMeter,
                    adIndividualField.PricePerMeter.ToString()));
            //RoomsCount
            if (adIndividualField.RoomsCount > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.RoomsCount,
                    adIndividualField.RoomsCount.ToString()));
            //SeatsCount
            if (adIndividualField.SeatsCount > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.SeatsCount,
                    adIndividualField.SeatsCount.ToString()));
            //ToiletsCount
            if (adIndividualField.ToiletsCount > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.ToiletsCount,
                    adIndividualField.ToiletsCount.ToString()));
            //StreetWidth
            if (adIndividualField.StreetWidth > 0)
                AdIndividualFieldsDetails.Add(
                    AdIndividualFieldsDetail.GetNewAdIndividualFieldsDetail(IndividualFieldEnumVM.StreetWidth,
                    adIndividualField.StreetWidth.ToString()));

            ad.AdIndividualFieldsDetails = AdIndividualFieldsDetails;
        }
        /// <summary>
        /// اضافة حقول المجموعات للاعلان
        /// </summary>
        /// <param name="ad"></param>
        /// <param name="adGroupsField"></param>
        internal static void ImportAdGroupsField(Ad ad, List<AdGroupFieldVM> adGroupsField)
        {
            List<AdGroupsDetail> AdGroupsDetails = new List<AdGroupsDetail>();


            adGroupsField.ForEach(ag =>
            {
                //Check If Custom Value
                if (!string.IsNullOrEmpty(ag.ValueString))
                {
                    ag.Values.ForEach(v =>
                    {
                        AdGroupsDetails.Add(new AdGroupsDetail()
                        {
                            FKGroup_Id = ag.GroupId,
                            IsCustomValue = false,
                            FKGroupItem_Id = v
                        });
                    });
                }
                else
                {
                    //Noe That Custom value
                    AdGroupsDetails.Add(new AdGroupsDetail()
                    {
                        FKGroup_Id = ag.GroupId,
                        IsCustomValue = true,
                        CustomValue = ag.ValueString
                    });
                }
            });

            ad.AdGroupsDetails = AdGroupsDetails;
        }
        /// <summary>
        /// اضافة الحقول المباشرة للاعلان
        /// </summary>
        /// <param name="ad"></param>
        /// <param name="adDirectField"></param>
        internal static void ImportAdDirectField(Ad ad, AdDirectFieldVM adDirectField)
        {
            AdDirectFieldDetail AdDirectFieldDetail = new AdDirectFieldDetail();

            //Area
            if (adDirectField.AreaHeight > 0 || adDirectField.AreaLength > 0 || adDirectField.AreaWidth > 0)
                AdDirectFieldDetail.Area = new Area()
                {
                    Length = adDirectField.AreaLength,
                    Width = adDirectField.AreaWidth,
                    Height = adDirectField.AreaHeight,
                };

            //Location
            if (!string.IsNullOrEmpty(adDirectField.LocationLatitude) && !string.IsNullOrEmpty(adDirectField.LocationLongitude))
                AdDirectFieldDetail.Location = new Location()
                {
                    Latitude = adDirectField.LocationLatitude,
                    Longitude = adDirectField.LocationLongitude,
                };


            //Country
            if (adDirectField.CountryId > 0)
                AdDirectFieldDetail.FkCountry_Id = adDirectField.CountryId;

            //Mark
            if (adDirectField.MarkId > 0)
                AdDirectFieldDetail.FKMark_Id = adDirectField.MarkId;

            //Material
            if (adDirectField.MaterialId > 0)
                AdDirectFieldDetail.FKMatrial_Id = adDirectField.MaterialId;

            //Nationality 
            if (adDirectField.NationalityId > 0)
                AdDirectFieldDetail.FKNationality_Id = adDirectField.NationalityId;

            //Province
            if (adDirectField.ProvinceId > 0)
                AdDirectFieldDetail.FkProvince_Id = adDirectField.ProvinceId;

            //Size
            if (adDirectField.SizeId > 0)
                AdDirectFieldDetail.FKSize_Id = adDirectField.SizeId;

            ad.AdDirectFieldDetail = AdDirectFieldDetail;
        }

        internal static string GetAdSerial(int adId)
        {

            return $" {TextService.GetNewChar()}  ";
        }

        public dynamic GetAdValue(string name, dynamic objValue) 
        {
            switch (name)
            {
                case "Area":
                    {
                        if (objValue == null) return new  Area();
                        return new  Area
                        {
                            Width = objValue.Width,
                            Height = objValue.Height,
                            Length = objValue.Length,
                        };
                    }
                case "Location":
                    {
                        if (objValue == null) return new Location();

                        return new Location
                        {
                            Latitude = objValue.Latitude,
                            Longitude = objValue.Longitude,
                        };
                    }
                case "Country":
                    {

                        if (objValue == null) return "";
                        return objValue.CountryName;
                    }
                case "Mark":

                    if (objValue == null) return "";
                    else
                        return objValue.MarkName;
                case "Material":
                    if (objValue == null) return "";
                    else
                        return objValue.MaterialName;
                case "Nationality":
                    if (objValue == null) return "";
                    else
                        return objValue.NationalityName;
                case "Province":
                    if (objValue == null) return "";
                    else
                        return objValue.ProvinceName;
                case "Size":
                    if (objValue == null) return "";
                    else
                        return objValue.Name;

            }
            return "";
        }

    }
}
