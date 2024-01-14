@extends('layouts.base')
@push('styles')
<link id="color-link" rel="stylesheet" type="text/css" href="assets/css/demo2.css">
<style>
    nav svg {
        height: 20px;
    }

    .product-box .product-details h5 {

        width: 100%;

    }
</style>
@endpush
@section('content')
<section class="breadcrumb-section section-b-space" style="padding-top:20px;padding-bottom:20px;">
    <ul class="circles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h3>Zboží</h3>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{route('app.index')}}">
                                <i class="fas fa-home"></i>
                            </a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Zboží</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section start -->
<section class="section-b-space">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 category-side col-md-4">
                <div class="category-option">
                    <div class="button-close mb-3">
                        <button class="btn p-0"><i data-feather="arrow-left"></i> Zavřít</button>
                    </div>
                    <div class="accordion category-name" id="accordionExample">
                        <div class="accordion-item category-rating">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                                    Značky
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                <div class="accordion-body category-scroll">
                                    <ul class="category-list">
                                        @foreach ($brands as $brand)
                                        <li>
                                            <div class="form-check ps-0 custome-form-check">
                                                <input class="checkbox_animated check-it" id="br{{$brand->id}}" name="brands" type="checkbox" @if(in_array($brand->id,explode(',',$q_brands))) checked @endif value="{{$brand->id}}" onchange="filterProductsByBrand(this)">
                                                <label class="form-check-label">{{$brand->name}}</label>
                                                <p class="font-light">({{$brand->products->count()}})</p>
                                            </div>
                                        </li>
                                        @endforeach

                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item category-rating">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix">
                                    Kategorie
                                </button>
                            </h2>
                            <div id="collapseSix" class="accordion-collapse collapse show" aria-labelledby="headingOne">
                                <div class="accordion-body category-scroll">
                                    <ul class="category-list">
                                        @foreach ($categories as $category)
                                        <li>
                                            <div class="form-check ps-0 custome-form-check">
                                                <input class="checkbox_animated check-it" id="ct{{$category->id}}" name="categories" type="checkbox" @if(in_array($category->id,explode(',',$q_categories))) checked="checked" @endif value="{{$category->id}}" onchange="filterProductsByCategory(this)">
                                                <label class="form-check-label">{{$category->name}}</label>
                                                <p class="font-light">({{$category->products->count()}})</p>
                                            </div>
                                        </li>

                                        @endforeach


                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item category-rating">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                                    Technologie tisku
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                <div class="accordion-body category-scroll">
                                    <ul class="category-list">
                                        @foreach ($technologies as $technology)
                                        <li>
                                            <div class="form-check ps-0 custome-form-check">
                                                <input class="checkbox_animated check-it" id="tl{{$technology->id}}" name="technologies" type="checkbox" @if(in_array($technology->id,explode(',',$q_technologies))) checked="checked" @endif value="{{$technology->id}}" onchange="filterProductsByTechnology(this)">
                                                <label class="form-check-label">{{$technology->name}}</label>
                                                <p class="font-light">({{$technology->products->count()}})</p>
                                            </div>
                                        </li>
                                        @endforeach

                                    </ul>
                                </div>
                            </div>
                            <div class="accordion-item category-price">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour">Cena</button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="range-slider category-list">
                                        <input type="text" class="js-range-slider" id="js-range-price" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="category-product col-lg-9 col-12 ratio_30">


                <div class="row g-4">
                    <!-- label and featured section -->
                    <div class="col-md-12">
                        <ul class="short-name">


                        </ul>
                    </div>

                    <div class="col-12">
                        <div class="filter-options">
                            <div class="select-options">

                                <div class="dropdown select-featured">
                                    <select class="form-select" name="size" id="pagesize">
                                        <option value="12" {{ $size == 12 ? 'selected':'' }}>12 Produktů na stránku</option>
                                        <option value="24" {{ $size == 24 ? 'selected':'' }}>24 Produktů na stránku</option>
                                        <option value="52" {{ $size == 52 ? 'selected':'' }}>52 Produktů na stránku</option>
                                        <option value="100" {{ $size == 100 ? 'selected':'' }}>100 Produktů na stránku</option>
                                    </select>
                                </div>
                            </div>
                            <div class="grid-options d-sm-inline-block d-none">
                                <ul class="d-flex">
                                    <li class="two-grid">
                                        <a href="javascript:void(0)">
                                            <img src="assets/svg/grid-2.svg" class="img-fluid blur-up lazyload" alt="">
                                        </a>
                                    </li>
                                    <li class="three-grid d-md-inline-block d-none">
                                        <a href="javascript:void(0)">
                                            <img src="assets/svg/grid-3.svg" class="img-fluid blur-up lazyload" alt="">
                                        </a>
                                    </li>
                                    <li class="grid-btn active d-lg-inline-block d-none">
                                        <a href="javascript:void(0)">
                                            <img src="assets/svg/grid.svg" class="img-fluid blur-up lazyload" alt="">
                                        </a>
                                    </li>
                                    <li class="list-btn">
                                        <a href="javascript:void(0)">
                                            <img src="assets/svg/list.svg" class="img-fluid blur-up lazyload" alt="">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- label and featured section -->

                <!-- Prodcut setion -->
                <div class="row g-sm-4 g-3 row-cols-lg-4 row-cols-md-3 row-cols-2 mt-1 custom-gy-5 product-style-2 ratio_asos product-list-section">

                    @foreach ($products as $product)
                    <div>
                        <div class="product-box">
                            <div class="img-wrapper">
                                <div class="front">
                                    <a href="{{route('shop.product.details',['slug'=>$product->slug])}}">
                                        <img src="assets/images/kola/{{$product->image}}" class="bg-img blur-up lazyload" alt="">
                                    </a>
                                </div>
                                <div class="back">
                                    <a href="{{route('shop.product.details',['slug'=>$product->slug])}}">
                                        <img src="assets/images/kola/{{$product->image}}" class="bg-img blur-up lazyload" alt="">
                                    </a>
                                </div>

                            </div>
                            <div class="product-details">
                                <div class="rating-details">
                                    <span class="font-light grid-content">{{$product->category->name}}</span>
                                
                                </div>
                                <div class="main-price">
                                    <a href="{{route('shop.product.details',['slug'=>$product->slug])}}" class="font-default">
                                        <h5 class="ms-0">{{$product->name}}</h5>
                                    </a>
                                    <div class="listing-content">
                                        <span class="font-light">{{$product->category->name}}</span>
                                        <p class="font-light">{{$product->short_description}}</p>
                                    </div>
                                    <h3 class="theme-color">{{$product->regular_price}} Kč</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach



                </div>
                {{$products->withQueryString()-> links("pagination.default")}}


            </div>
        </div>
    </div>
</section>
<!-- Shop Section end -->
<!-- Subscribe Section Start -->
<section class="subscribe-section section-b-space">
    <div class="container">
        <div class="row">
   
        </div>
    </div>
</section>
<!-- Subscribe Section End -->
<form id="frmFilter" method="get">
    <input type="hidden" name="page" id="page" value="{{$page}}" />
    <input type="hidden" name="size" id="size" value="{{$size}}" />
    <input type="hidden" name="order" id="order" value="{{$order}}" />
    <input type="hidden" name="brands" id="brands" value="{{$q_brands}}" />
    <input type="hidden" name="categories" id="categories" value="{{$q_categories}}" />
    <input type="hidden" name="technologies" id="technologies" value="{{$q_technologies}}" />
    <input type="hidden" name="prange" id="prange" value="" />
</form>
@endsection

@push("scripts")
<script>
    function filterProductsByBrand(brand) {
        var brands = "";
        $("input[name='brands']:checked").each(function() {
            if (brands == "") {
                brands += this.value;
            } else {
                brands += "," + this.value;
            }
        });

        $("#brands").val(brands);
        $("#frmFilter").submit();
    }

    function filterProductsByCategory(category) {
        var categories = "";
        $("input[name='categories']:checked").each(function() {
            if (categories == "") {
                categories += this.value;
            } else {
                categories += "," + this.value;
            }
        });

        $("#categories").val(categories);
        $("#frmFilter").submit();
    }

     function filterProductsByTechnology(technology) {
        var technologies = "";
        $("input[name='technologies']:checked").each(function() {
             if (technologies == "") {
                technologies += this.value;
             } else {
                 technologies += "," + this.value;
             }
        });

        $("#technologies").val(technologies);
        $("#frmFilter").submit();
     }

    $(function() {
        $("#pagesize").on("change", function() {
            $("#size").val($("#pagesize option:selected").val());
            $("#frmFilter").submit();
        });
        $("#orderby").on("change", function() {
            $("#order").val($("#orderby option:selected").val());
            $("#frmFilter").submit();
        });
        var $range = $(".js-range-slider");
        instance = $range.data("ionRangeSlider");
        instance.update({
            from: '{{$from}}',
            to: '{{$to}}'
        });
        $("#prange").on("change", function() {
            setTimeout(() => {
                $("#frmFilter").submit();
            }, 1000);
        });
    });
</script>
@endpush