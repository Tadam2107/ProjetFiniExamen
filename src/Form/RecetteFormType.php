<?php

namespace App\Form;

use App\Entity\Menu;
use App\Entity\Categorie;
use Symfony\Component\Form\AbstractType;
use FOS\CKEditorBundle\Form\Type\CKEditorType;
use Symfony\Component\Form\FormBuilderInterface;
use Vich\UploaderBundle\Form\Type\VichImageType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;

class RecetteFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nom',TextType::class,[
                'label'=>'Nom de la recette'
            ])
          
            ->add('ingredients',CKEditorType::class,[
                'label'=>'Description de la recette'
            ])
            ->add('imageFile',VichImageType::class,[
                'required'=>false,
                'label'=>'Image mise en avant',
                'allow_delete' => false,
                'download_label' => 'Télécharger',
            ])
            //->add('slug')
            //->add('created_at')
            //->add('updated_at')
            ->add('categorie',EntityType::class,[
                'class'=>Categorie::class,
                'label'=>'Catégories',
                'multiple'=>false,//donne la possibilité de choisir plusieurs options
                'expanded'=>true
            ])
            
            ->add('actif',CheckboxType::class,[
                'label'=>'Publier',
                'required'=>false
            ])
 
            //->add('user')

            ->add('Ajouter',SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Menu::class,
        ]);
    }
}
