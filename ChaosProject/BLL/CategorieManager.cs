using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class CategorieManager
    {
        private Model1Container context;

        public CategorieManager()
        {
            context = new Model1Container();
        }

        public List<Category> getCategories()
        {
            return context.Categories.ToList();
        }

        public Category getSingleCategory(int id)
        {
            return context.Categories.Find(id);
        }

        public void insertCategory(Category category)
        {
            context.Categories.Add(category);
            context.SaveChanges();
        }

        public void addCategoryToUser(Category category, User user)
        {
            context.Categories.Find(category).User.Add(context.Users.Find(user));
            context.SaveChanges();
        }
    }
}
