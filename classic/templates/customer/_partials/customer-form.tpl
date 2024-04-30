{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
<style>
    label[for="field-company"] {
        display: none;
    }

    input#field-company {
        display: none;
    }

    label[for="field-siret"] {
        display: none;
    }

    input#field-siret {
        display: none;
    }

    .col-md-3.form-control-comment {
        display: none;
    }
</style>
{block name='customer_form'}
    {block name='customer_form_errors'}
        {include file='_partials/form-errors.tpl' errors=$errors['']}
    {/block}
    <form action="{block name='customer_form_actionurl'}{$action}{/block}" id="customer-form" class="js-customer-form"
          method="post">
        <div>

            {block "form_fields"}
                {foreach from=$formFields item="field"}
                    {block "form_field"}
                        {if $field.type === "password"}
                            <div class="field-password-policy">
                                {form_field field=$field}
                            </div>
                        {else}
                            {form_field field=$field}
                        {/if}
                    {/block}
                {/foreach}
                {$hook_create_account_form nofilter}
            {/block}
        </div>

        {block name='customer_form_footer'}
            <footer class="form-footer clearfix">
                <input type="hidden" name="submitCreate" value="1">
                {block "form_buttons"}
                    <button class="btn btn-primary form-control-submit float-xs-right" data-link-action="save-customer"
                            type="submit">
                        {l s='Save' d='Shop.Theme.Actions'}
                    </button>
                {/block}
            </footer>
        {/block}

    </form>
{literal}
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.querySelector("#professionnal").addEventListener("click", function () {
                document.querySelector("label[for='field-company']").style.display = "block";
                document.querySelector("label[for='field-siret']").style.display = "block";
                document.getElementById("field-company").style.display = "block";
                document.getElementById("field-siret").style.display = "block";

                document.querySelector("input#field-siret").required = true;
            });

            document.querySelector("#part").addEventListener("click", function () {
                document.querySelector("label[for='field-company']").style.display = "none";
                document.querySelector("label[for='field-siret']").style.display = "none";
                document.getElementById("field-company").style.display = "none";
                document.getElementById("field-siret").style.display = "none";

            });


            var saveButton = document.querySelector("button[data-link-action='save-customer']");
            saveButton.addEventListener("click", function (event) {
                fetch('https://prodhys.vizualee.fr/updateGroup.php', {
                    method: 'GET'
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('La requête a échoué avec le statut ' + response.status);
                        }
                        return response.text();
                    })
                    .then(data => {
                        console.log("Réponse reçue :", data);
                    })
                    .catch(error => {
                        console.error("Erreur lors de la requête :", error);
                    });
            });
        });


    </script>
{/literal}
{/block}
