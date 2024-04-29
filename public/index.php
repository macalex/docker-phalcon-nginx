<?php

use Phalcon\Mvc\Application;
use Phalcon\Di\FactoryDefault;

try {
    // Create a DI
    $di = new FactoryDefault();

    // Handle the request
    $application = new Application($di);

    phpinfo();

    echo $application->handle()->getContent();
} catch (\Exception $e) {
    echo "Phalcon Error: " . $e->getMessage();
}