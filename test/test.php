<?php
class Site
{
    public $url;
    public $title;
  
    public function setUrl($par)
    {
        $this->url = $par;
    }
  
    public function getUrl()
    {
        echo $this->url . PHP_EOL;
    }
  
    public function setTitle($par)
    {
        $this->title = $par;
    }
  
    public function getTitle()
    {
        echo $this->title . PHP_EOL;
        $arr1 = [];
        $arr2 = [];
        $arr3 = array_merge($arr1, $arr2);
        $this->getTitle();
        $this->getTitle();
        $this->setTitle('ok');
    }
}
