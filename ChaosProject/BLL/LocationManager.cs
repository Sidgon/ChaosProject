using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class LocationManager
    {
        private Model1Container context;

        public LocationManager()
        {
            context = new Model1Container();
        }

        public List<Location> getLocation()
        {
            return context.Locations.ToList();
        }

        public Location getSingleLocation(int id)
        {
            return context.Locations.Find(id);
        }

        public void insertLocation(Location location)
        {
            context.Locations.Add(location);
            context.SaveChanges();
        }
    }
}
