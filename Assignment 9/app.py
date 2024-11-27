from flask import Flask, render_template, request, redirect, url_for, flash
import get_data

app = Flask(__name__)
app.secret_key = 'your_secret_key'

products_sample = [
    (1, "Oak Wood", "Oak Wood", 999.99, 1.5, "Wood", 4.5, 101),
    (2, "Nails", "Not from fingers", 199.99, 0.3, "Materials", 4.8, 102),
    (3, "Birch Wood", "From Birch trees", 89.99, 3.2, "Wood", 4.2, 101),
    (4, "Screws", "These are Screws", 149.99, 0.2, "Materials", 4.7, 103),
]

order_history_sample = [
    (1001, 1, "2024-11-01", "Delivered", 999.99, "Credit Card", "123 Main St, Springfield, IL", 201),
    (1002, 2, "2024-11-15", "Shipped", 199.99, "PayPal", "456 Elm St, Springfield, IL", 201),
    (1003, 3, "2024-11-20", "Pending", 89.99, "Debit Card", "789 Oak St, Springfield, IL", 201),
]

product_values = [
    (1, 10, 0, "2024-11-01", 1),
    (2, 20, 0, "2024-11-01", 2),
    (3, 30, 0, "2024-11-01", 3),
    (4, 40, 0, "2024-11-01", 4),
]


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')        
        
        #login = get_data.login(username, password)
        if username == '1' and password == 'password':
            flash('Login successful!', 'success')
            return redirect(url_for('search'))
        else:
            flash('Invalid username or password', 'danger')
            return redirect(url_for('login'))
        
    return render_template('login.html', title='Login')

@app.route('/search', methods=['GET'])
def search():
    """
    Render the search page with the three search forms.
    """
    return render_template('search.html', title='Search')

@app.route('/search/product', methods=['GET'])
def search_by_product():
    """
    Handle search by product_id.
    """
    product_id = request.args.get('product_id')
    if not product_id:
        return "Please provide a product ID.", 400
    #matching_products = get_data.get_product_ids(product_id)
    matching_products = [p for p in products_sample if str(p[0]) == product_id]

    return render_template('products.html', title="Product Results", products=matching_products)

@app.route('/search/seller', methods=['GET'])
def search_by_seller():
    """
    Handle search by seller_name.
    """
    seller_name = request.args.get('seller_name')
    if not seller_name:
        return "Please provide a seller name.", 
    #matching_products = get_data.get_seller_ids(seller_name)
    matching_products = [p for p in products_sample if str(p[-1]) == seller_name]

    return render_template('products.html', title="Product Results", products=matching_products)

@app.route('/search/category', methods=['GET'])
def search_by_category():
    """
    Handle search by category.
    """
    category = request.args.get('category')
    if not category:
        return "Please select a category.", 400
    #matching_products = get_data.get_category(category)
    matching_products = [p for p in products_sample if str(p[5]) == category]

    return render_template('products.html', title="Product Results", products=matching_products)

@app.route('/product/<int:product_id>', methods=['GET'])
def product_info(product_id):
    product = products_sample[product_id]
    #product = get_data.get_product_id(pid)
    if not product:
        return "Product not found.", 404

    return render_template('product_info.html', title=product[1], product=product)


@app.route('/buy/<int:product_id>', methods=['POST'])
def buy_product(product_id):
    quantity = request.form.get('quantity')
    if not quantity or int(quantity) < 1:
        return "Invalid quantity.", 400

    return redirect('../profile')

@app.route('/profile', methods=['GET'])
def profile():
    #order_history = get_data.order_history(cid)
    return render_template('profile.html', title="Your Profile", orders=order_history_sample)

@app.route('/profile/seller/<int:seller_id>', methods=['GET'])
def seller_info(seller_id):
    seller_products = [p[0] for p in products_sample if p[7] == seller_id]
    mps = [x for x in product_values if x[0] in seller_products]
    #mps = get_data.seller_info(sid) 
    return render_template('seller_info.html', title=f"Seller {seller_id}", seller_id=seller_id, products=mps)
